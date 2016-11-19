#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

#include "simulator.h"
#include "instructs.h"
#include "list.h"

#define EMPTY_LINE 1
#define NO_ERROR 0
#define SYNTAX_ERROR -65536-1
#define UNKNOWN_SYMBOL -65536-2
#define UNKNOWN_INSTRUCT -65536-3
#define ENTRY_POINT "_min_caml_start"

/*空白文字の定義*/
#define Is_Space(ch) (ch==' '||ch=='\t'||ch=='\r')
/*simulator.c*/
extern int binary_output;
extern int debug;

typedef struct program{
  char filename[100];
  int offset;
  Label *labels;
  int n_label;
} Program;
/*ラベルの数*/
int n_label;
/*ラベルの配列*/
Label *labels;
/*読み込み中の行数*/
int d_lines;
/*命令列出力用のファイルストリーム*/
FILE *output_instr_file;
/*pcの値の初期値*/
int offset=0;
/*リンカ*/
Label *linker;
int n_linker;

#define SECTION_TEXT 1
#define SECTION_DATA 0

/*Utilities*/

int get_pc(Label *labels,char *name_label,int *out_type){
  int i;
  for(i=0;i<n_label;i++){
    if(!strcmp(labels[i].name,name_label)){
      if(out_type!=NULL)
	*out_type=labels[i].type;
      return labels[i].pc;
    }
  }
  return -1;
}

int add_align(Label *ldest,Label *lsrc,int ndest,int nsrc){
  Label *tmp = ldest;
  int i,max=ndest+nsrc;;
  ldest=(Label*)malloc(max*sizeof(Label));
  for(i=0;i<ndest;i++)
    ldest[i]=tmp[i];
  for(;i<max;i++)
    ldest[i]=lsrc[i-ndest];
  return i;
}

int list_to_align(Instruct *instr_a,Instr_list *instr_l,int n){
  int i;
  Instr_list *now=instr_l;
  for(i=0;i<n;i++){
    instr_a[i]=now->instr;
    if(i!=n-1)
      now=now->next;
  }
  return 0;
}

void print_align(Instruct *instr_a,int n,FILE* out_file){
  int i;
  fprintf(out_file,"no\tinstr\top1\top2\top3\top4\n");
  for(i=0;i<n;i++){
    fprintf(out_file,"%d\t",i);
    print_instr(instr_a[i],out_file);
    fprintf(out_file,"\t%d\t%d\t%d\t%d\n",instr_a[i].operands[0],instr_a[i].operands[1],instr_a[i].operands[2],instr_a[i].operands[3]);
  }
}
		
void print_labels(Label *labels,int n_label,FILE* out_file){
  int i;
  fprintf(out_file,"label\tpc\ttype\n");
  for(i=0;i<n_label;i++){
    fprintf(out_file,"%s\t%d\t",labels[i].name,labels[i].pc);
    if(labels[i].type==SECTION_DATA)
      fprintf(out_file,"SYMBOL\n");
    else
      fprintf(out_file,"LABEL\n");

  }
  fprintf(out_file,"\n");
}

int isnum(char ch){
  return ((ch>='0')&&(ch<='9'))||(ch=='-');
}

int search(char t,char buf[],int bufsize){
  int i;
  for(i=0;i<bufsize;i++){
    if(buf[i]==t)
      return i;
  }
  return -1;
}

int count(char t,char buf[], int bufsize){
  int i,c=0;
  for(i=0;i<bufsize;i++){
    if(buf[i]==t)
      c++;
  }
  return c;
}

int search_space(char* buf,int bufsize){
  int i;
  for(i=0;i<bufsize;i++){
    if(Is_Space(buf[i]))
      return i;
  }
  return -1;
}

int search_delim(char* buf,int bufsize){
  int i;
  for(i=0;i<bufsize;i++){
    if(buf[i]==','||buf[i]=='(')
      return i;
  }
  return -1;
}
/*ニーモニックの変換*/
int convert_mnemonic(Instr_list *instr_l,int pc){
  Instruct target,ins;
  int opcode,op[4],dpc=1,i;
  int isbreak=0;
  target=instr_l->instr;
  opcode=target.opcode;
  if(opcode&_BREAK){
    isbreak=_BREAK;
    opcode=opcode&(~_BREAK);
  }
  for(i=0;i<4;i++)
    op[i]=target.operands[i];
  if(Is_mnemonic(target.opcode)){
    list_pop(instr_l);
    switch(opcode){
    case NOP:
      dpc=1;
      ins.opcode=SLL|isbreak;
      ins.operands[0]=0;
      ins.operands[1]=0;
      ins.operands[2]=0;
      ins.operands[3]=0;
      list_push(instr_l,ins);
      break;
    case MOVE:
      dpc=1;
      ins.opcode=ADDI|isbreak;
      ins.operands[0]=op[0];
      ins.operands[1]=op[1];
      ins.operands[2]=0;
      ins.operands[3]=0;
      list_push(instr_l,ins);
      break;
    case LA:
      dpc=1;
      ins.opcode=ADDI|isbreak;
      ins.operands[0]=op[0];
      ins.operands[1]=0;
      ins.operands[2]=op[1];
      ins.operands[3]=0;
      list_push(instr_l,ins);
      break;
    case JALR:
      dpc=2;
      ins.opcode=JR;
      ins.operands[0]=op[0];
      ins.operands[1]=0;
      ins.operands[2]=0;
      ins.operands[3]=0;
      list_push(instr_l,ins);
      ins.opcode=ADDI|isbreak;
      ins.operands[0]=31;
      ins.operands[1]=0;
      ins.operands[2]=pc+offset+2;
      ins.operands[3]=0;
      list_push(instr_l,ins);
      break;
    }
  }
  return dpc;
}
/*.wordの変換*/
int convert_data(Instr_list *prepare,int *mem){
  int n_instr=0,align,data_hi,data_lo;
  Instr_list *now;
  Instruct ins,dest;
  now=prepare;
  while(!list_isempty(now)){
    dest=now->instr;
    if(dest.opcode==_WORD){
      data_hi=dest.operands[0];
      align=dest.operands[1];
      data_lo=data_hi&0xFFFF;
      data_hi=data_hi>>16;
      list_pop(now);
      if(data_hi!=0){
	ins.opcode=ORI;
	ins.operands[0]=1;
	ins.operands[1]=0;
	ins.operands[2]=data_hi&0xFFFF;
	ins.operands[3]=0;
	list_push(now,ins);
	now=now->next;
	ins.opcode=SLL;
	ins.operands[0]=1;
	ins.operands[1]=1;
	ins.operands[2]=16;
	ins.operands[3]=0;
	list_push(now,ins);
	now=now->next;
	n_instr+=2;
      }
      if(data_lo!=0||(data_hi==0&&data_lo==0)){
	ins.opcode=ORI;
	ins.operands[0]=1;
	if(data_hi!=0)
	  ins.operands[1]=1;
	else
	  ins.operands[1]=0;	  
	ins.operands[2]=data_lo;
	ins.operands[3]=0;
	list_push(now,ins);
	now=now->next;
	n_instr++;
      }
      ins.opcode=SW;
      ins.operands[0]=1;
      ins.operands[1]=*mem;
      ins.operands[2]=30;	
      ins.operands[3]=0;
      list_push(now,ins);
      now=now->next;
      n_instr++;
      *mem+=align;
    }else{
      now=now->next;
    }
  }
  return n_instr;
}  

/*ディレクティブのパース*/
int which_directive(char *opcode){
  long long int x=0;
  int i;
  int max = strlen(opcode);
  if(max>8){
    return UNKNOWN_INSTRUCT;
  }
  for(i=0;i<max;i++){
    x|=opcode[i];
    if(i!=max-1)
      x<<=8;
  }
  if(!(x^0x2e676c6f626cL)|!(x^0x2e676c6f62616cL)){
    return _GLOBL;
  }else if(!(x^0x2e74657874L)){
    return _TEXT;
  }else if(!(x^0x2e64617461L)){
    return _DATA;
  }else if(!(x^0x2e776f7264L)){
    return _WORD;
  }else if(!(x^0x2e616c69676eL)){
    return _ALIGN;
  }else{
    return UNKNOWN_INSTRUCT;
  }
}

/*特殊関数へのラベル(実態はシンボル)*/
#define NUM_SIM_SYMBOLS 27
void add_symbols(Label *labels,int max,int *i){  
  strcpy(labels[*i].name,"min_caml_read_byte");
  labels[*i].pc=LIB_RBYTE;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_read_int");
  labels[*i].pc=LIB_RINT;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_read_float");
  labels[*i].pc=LIB_RFLOAT;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_print_char");
  labels[*i].pc=LIB_WBYTE;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_print_int");
  labels[*i].pc=LIB_WINT;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_print_float");
  labels[*i].pc=LIB_WFLOAT;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_print_newline");
  labels[*i].pc=LIB_NLINE;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_sin");
  labels[*i].pc=LIB_SIN;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_cos");
  labels[*i].pc=LIB_COS;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_atan");
  labels[*i].pc=LIB_ATAN;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_float_of_int");
  labels[*i].pc=LIB_ITOF;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_truncate");
  labels[*i].pc=LIB_FTOI;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_int_of_float");
  labels[*i].pc=LIB_FTOI;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_floor");
  labels[*i].pc=LIB_FLOOR;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_sqrt");
  labels[*i].pc=LIB_SQRT;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fabs");
  labels[*i].pc=LIB_FABS;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_abs_float");
  labels[*i].pc=LIB_FABS;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_create_array");
  labels[*i].pc=LIB_CR_ARRAY;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_create_float_array");
  labels[*i].pc=LIB_CR_ARRAY_F;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fiszero");
  labels[*i].pc=LIB_F_IS_0;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fispos");
  labels[*i].pc=LIB_F_IS_POS;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fneg");
  labels[*i].pc=LIB_F_NEG;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fsqr");
  labels[*i].pc=LIB_F_SQR;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fless");
  labels[*i].pc=LIB_F_LESS;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fhalf");
  labels[*i].pc=LIB_F_HALF;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"min_caml_fisneg");
  labels[*i].pc=LIB_F_IS_NEG;
  labels[*i].type=0;
  *i=*i+1;
  strcpy(labels[*i].name,"DBG_PRINT_STRING");
  labels[*i].pc=DBG_PSTR;
  labels[*i].type=0;
  *i=*i+1;
}

/*Parser本体*/
/*ブレークポイントのフラグ*/
int is_break=0;
/*テキストセクションかデータセクションか*/
int section=1;
int data_width=4;
/*オペランド部分のみ*/
int get_operand(char *op,int type_op,int pc,int opcode){
  int dest_pc,pos_space,tmp;
  char buf[32];
  int op_fun,symbol_type;
  if(isnum(op[0])){
    if (!(type_op&&IMMIDIATE))
      fprintf(stderr,"Warning(line %d): wrong operand type\n",d_lines); 
    return strtol(op,NULL,0);
  }else if(op[0]=='%'){
    if(op[1]=='r'){
      if (!(type_op&&REG))
	fprintf(stderr,"Warning(line %d): wrong operand type\n",d_lines);
      tmp = atoi(op+2);
      if(tmp<0||tmp>31){
	fprintf(stderr,"Error(line %d): wrong operand '%s'->%d\n",d_lines,op,tmp);
	return SYNTAX_ERROR;
      }else{
	return tmp;
      }
    }else if(op[1]=='f'){
      if(!(type_op&&FREG))
        fprintf(stderr,"Warning(line %d): wrong operand type\n",d_lines); 
      tmp = atoi(op+2);
      if(tmp<0||tmp>31){
	fprintf(stderr,"Error(line %d): wrong operand '%s'->%d\n",d_lines,op,tmp);	
	return SYNTAX_ERROR;
      }else{
	return tmp;
      }
    }else{
      fprintf(stderr,"Error(line %d): unknown operand '%s'\n",d_lines,op);
    }
  }else if(op[0]=='$'){
    if (!(type_op&&IMMIDIATE))
      fprintf(stderr,"Warning(line %d): wrong operand type\n",d_lines); 
    return strtol(op+1,NULL,0);
  }else{
    if((pos_space=search_space(op,strlen(op)))>=0){
      strncpy(buf,op,pos_space);
    }else{
      strcpy(buf,op);
    }
    if((dest_pc=get_pc(labels,buf,&symbol_type))>=0){
      op_fun=opcode&MASK_OP_FUN;
      if((op_fun==BEQ)||(op_fun==BNE)){
	return dest_pc-pc;
      }else /*if(op_fun==(LA&MASK_OP_FUN))*/{
	if(symbol_type==SECTION_TEXT)
	  return dest_pc+offset;
	else
	  return dest_pc;
      }
    }else{
      fprintf(stderr,"Error(line %d): unknown operand '%s'\n",d_lines,buf);
    }
  }
  return SYNTAX_ERROR;
}
/*行単位のパース*/
int interpret(Instr_list *instr_l,char *buf,int bufsize,int pc){
  char *buf_cp=(char*)malloc(sizeof(char)*(bufsize+1));
  char *now=buf_cp;
  Instruct instr_read;
  int i,rest=bufsize-1,pos_delim,err=NO_ERROR;
  char opcode[16],operands[4][32];
  Instr_list *last=instr_l;
  int directive;
  strcpy(buf_cp,buf);
  for(i=0;i<4;i++)
    instr_read.operands[i]=0;
  /*'#' から先はコメント*/
  if((pos_delim=search('#',now,rest))>=0){
    now[pos_delim]=0;
    rest=pos_delim;
  }
  while((Is_Space(*now)||*now=='!')&&rest>0){
    if(*now=='!')
      is_break=1;
    rest--;
    now++;
  }
  /*|[label:] <op> a1,a2,a3
    |[label:] <op> a1,a2(a3) */
  /*ここではラベルは読み飛ばしてよい*/
  if((pos_delim=search(':',now,rest))>=0){
    now+=pos_delim+1;
    rest-=pos_delim+1;
  }
  while((Is_Space(*now)||*now=='!')&&rest>0){
    if(*now=='!')
      is_break=1;
    rest--;
    now++;
  }  
  if(rest>0){
    pos_delim=search_space(now,rest);
    if(pos_delim<0){
      strcpy(opcode,now);
      pos_delim=strlen(opcode);
    }else{
      strncpy(opcode,now,pos_delim);
      opcode[pos_delim]=0;
    }
    if(opcode[0]=='.'){
      now+=pos_delim+1;
      rest-=pos_delim+1;
      while(Is_Space(*now)&&rest>0){
	rest--;
	now++;
      }
      directive=which_directive(opcode);
      if(directive==_GLOBL){
      }
      free(buf_cp);
      return EMPTY_LINE;
    }else{
      if((instr_read.opcode=get_instr(opcode))==-1) err=UNKNOWN_INSTRUCT;
      if(is_break){
	(instr_read.opcode)|= _BREAK ;
	is_break=0;
      }
      now+=pos_delim+1;
      rest-=pos_delim+1;
      while(Is_Space(*now)&&rest>0){
	rest--;
	now++;
      }
      /* <op> |a1,a2,a3
	 <op> |a1,a2(a3) */
      i=0;
      while(i<4&&rest>0){
	pos_delim=search_delim(now,rest);
	if (pos_delim<0){
	  if(rest==0) break;
	  pos_delim=rest;
	}
	strncpy(operands[i],now,pos_delim);
	operands[i][pos_delim]=0;
	instr_read.operands[i]=get_operand(operands[i],7,pc,instr_read.opcode);
	if(instr_read.operands[i]==SYNTAX_ERROR){
	  err=SYNTAX_ERROR;
	}
	i++;
	now+=pos_delim+1;
	rest-=pos_delim+1;
	if(*(now-1)=='('){
	  while(Is_Space(*now)&&rest>0){
	    rest--;
	    now++;
	  }
	  if(rest<=0){
	    printf("Error(line %d): expected ')'\n",d_lines);
	    err=SYNTAX_ERROR;
	    break;
	  }
	  pos_delim=search(')',now,rest);
	  strncpy(operands[i],now,pos_delim);
	  operands[i][pos_delim]=0;
	  instr_read.operands[i]=get_operand(operands[i],7,pc,instr_read.opcode);
	  if(instr_read.operands[i]==SYNTAX_ERROR){
	    err=SYNTAX_ERROR;
	  }
	  i++;
	  now+=pos_delim+1;
	  rest-=pos_delim+1;
	}
	while(Is_Space(*now)&&rest>0){
	  rest--;
	  now++;
	}
      }
      while(!list_isempty(last))
	last=last->next;
      last->no = pc;
      list_push(last,instr_read);
      free(buf_cp);
    }
  }else{
    free(buf_cp);
    err=EMPTY_LINE;
  }
  return err;
}

int readline(int fd,Instr_list *instr_l){
  char buf[1024],tmp[65536];
  char text[65536];
  int c=0,i=0,l;
  int pos_lf;
  int step=0;
  /*実行に必要な変数の定義*/
  /*step 0*/
  int colons=0;
  int links=0;
  int pos;
  /*step 1*/
  char *now,opcode[16];
  int pos_colon;
  int directive;
  int mem=0,align=4;
  Instr_list *prepare = list_init();
  Instr_list *tail_prepare=prepare;
  /*step 2*/
  Instruct j_ep;
  int interpret_status,ret_status=0;
  /*ここまで*/
  for(step=0;step<3;step++){
    /*初期化*/
    text[0]=0;c=0;i=0;l=0;
    if(step==1){
      links=0;
    }
    /*ここまで*/
    while((c=read(fd,buf,1023))>0){
      buf[c]=0;
      strcat(text,buf);
      i+=c;
      while((pos_lf=search('\n',text,i))>=0){
	text[pos_lf]=0;
	/*各行に対する処理*/
	if(step==0){
	  /*step 0: ラベルの数のカウントと.globlのカウント*/
	  if(search(':',text,pos_lf)>=0)
	    colons++;
	  if((pos=search('.',text,pos_lf))>=0){
	    pos_colon=search_space(text+pos,pos_lf-pos);
	    if(pos_colon<0){
	      strcpy(opcode,text+pos);
	    }else{
	      strncpy(opcode,text+pos,pos_colon);
	      opcode[pos_colon]=0;
	    }
	    if(which_directive(opcode)==_GLOBL){
	      links++;
	    }
	  }
	}else if(step==1){
	  /*step 1: ラベルの配列の作成*/
	  strcpy(tmp,text);
	  if((pos_colon=search(':',tmp,pos_lf))>0){
	    tmp[pos_colon]=0;
	    strcpy(labels[colons].name,tmp);
	    if(!strcmp(labels[colons].name,"SYS_EXIT")){
	      fprintf(stderr,"Error: Name 'SYS_EXIT' could not be used as label name\n");
	      ret_status=-1;
	    }
	    if(section==SECTION_TEXT){
	      labels[colons].pc=l;
	      labels[colons].type=SECTION_TEXT;
	    }else{
	      labels[colons].pc=mem;
	      labels[colons].type=SECTION_DATA;
	    }
	    colons++;
	  }
	  if(pos_colon>=0){
	    now=tmp+pos_colon+1;
	  }else{
	    now=tmp;
	  }
	  /*命令の無い行か?*/
	  while(Is_Space(*now)||*now=='!'){
	    now++;
	  }
	  /*ディレクティブ (.globl)*/
	  if(*now=='.'){
	    pos_colon=search_space(now,strlen(now));
	    if(pos_colon<0){
	      pos_colon=strlen(now);
	      strcpy(opcode,now);
	    }else{
	      strncpy(opcode,now,pos_colon);
	      opcode[pos_colon]=0;
	      now+=pos_colon+1;
	    }
	    directive=which_directive(opcode);
	    if(directive==_GLOBL){
	      while(Is_Space(*now)){
		now++;
	      } 
	      if(*now){
		pos_colon=search_space(now,strlen(now));
		if(pos_colon<0){
		  pos_colon=strlen(now);
		  strcpy(linker[links].name,now);
		}else{
		  strncpy(linker[links].name,now,pos_colon);
		}
		links++;
	      }
	    }else if(directive==_TEXT){
	      section=SECTION_TEXT;
	    }else if(directive==_DATA){
	      section=SECTION_DATA;
	    }else if(directive==_ALIGN){
	      while(Is_Space(*now)){
		now++;
	      } 
	      align=1<<(get_operand(now,7,0,directive));
	      if(align>64){
		fprintf(stderr,"Warning: align parameter too big.\n");
	      }
	    }else if(directive==_WORD){
	      mem+=(align>4)?align:4;
	      j_ep.opcode=_WORD;
	      while(Is_Space(*now)){
		now++;
	      } 
	      if(*now){
		pos_colon=search_space(now,strlen(now));
		if(pos_colon<0){
		  pos_colon=strlen(now);
		  strcpy(opcode,now);
		}else{
		  strncpy(opcode,now,pos_colon);
		}
		j_ep.operands[0]=get_operand(now,7,0,_WORD);
	      }else{
		j_ep.operands[0]=0;
	      }
	      j_ep.operands[1]=(align>4)?align:4;
	      list_push(tail_prepare,j_ep);
	      tail_prepare=tail_prepare->next;
	      
	    }else{
	      fprintf(stderr,"Warning: unknown operand '%s'\n",opcode);
	    }
	  }else if(*now!=0&&*now!='#'){
	    /*行の最後まで空白or単行コメントがあったら行数をカウントしない*/
	    /*命令があったら、その命令の'長さ'によって加算する行数を変える*/
	    pos=search_space(now,strlen(now));
	    if(pos<0){
	      strcpy(opcode,now);
	      pos=strlen(opcode);
	    }else{
	      strncpy(opcode,now,pos);
	      opcode[pos]=0;
	    }
	    directive=get_instr(opcode);
	    if(directive!=-1&&directive!=INSTR_END){
	      pos=Len_mnemonic(directive);
	      l+=(pos>0)?pos:1;
	    }
	  }
	  
	}else{
	  /*step 2: 各行の解釈*/
	  if((interpret_status=interpret(instr_l,text,pos_lf+1,l))<0)
	    ret_status=-1;
	  tail_prepare=instr_l;
	  while(!list_isempty(tail_prepare))
	    tail_prepare=tail_prepare->next;
	  if(interpret_status!=1) l+=convert_mnemonic(tail_prepare->back,l); 
	  d_lines++;
	}
	/*ここまで*/
	if(i>pos_lf)
	  strcpy(tmp,text+pos_lf+1);
	else
	  tmp[0]=0;
	strcpy(text,tmp);
	i=i-pos_lf-1;
      }
    }
    /*実行終了時の処理*/
    if(step==0){
      /*step 0*/
      lseek(fd,0,SEEK_SET);
      n_label=colons+1+NUM_SIM_SYMBOLS;
      n_linker=links;
      labels=(Label*)malloc(n_label*sizeof(Label));
      linker=(Label*)malloc(links*sizeof(Label));
      colons=0;
    }else if(step==1){
      /*step 1*/
      lseek(fd,0,SEEK_SET);
      strcpy(labels[colons].name,"SYS_EXIT");
      labels[colons].pc=l;
      labels[colons].type=SECTION_TEXT;
      colons++;
      add_symbols(labels,n_label,&colons);
      if(output_instr_file!=NULL){
	print_labels(labels,n_label,output_instr_file);
      }
      for(links=0;links<n_linker;links++){
	pos=get_pc(labels,linker[links].name,NULL);
	linker[links].pc=pos;
	if(pos==-1){
	  fprintf(stderr,"Warning: unknown global label '%s'\n",linker[links].name);
	}
      }
      mem=0;
      offset+=convert_data(prepare,&mem);
      if(mem!=0){
        j_ep.opcode=ADDI;
	j_ep.operands[0]=30;
	j_ep.operands[1]=0;
	j_ep.operands[2]=mem;
	tail_prepare=prepare;
	while(!list_isempty(tail_prepare))
	  tail_prepare=tail_prepare->next;
	list_push(tail_prepare,j_ep);
	offset++;
      }
      list_append(instr_l,prepare);
      if((pos=get_pc(linker,ENTRY_POINT,NULL))<0){
	fprintf(stderr,"Warning: missing entry point; add '.globl %s' on your program, and make sure label '%s' exists.\n",ENTRY_POINT,ENTRY_POINT);
      }else{
	j_ep.opcode=J;
	offset++;
	j_ep.operands[0]=pos+offset;
	tail_prepare=instr_l;
	while(!list_isempty(tail_prepare))
	  tail_prepare=tail_prepare->next;
	list_push(tail_prepare,j_ep);
      }
      d_lines=1;
      
    }else{
      /*step 2*/
      if(!debug)
	free(labels);
      if(ret_status==0){
	ret_status=l+offset;
      }
      list_free(prepare);
    }
    /*ここまで*/
  }
  return ret_status;
}

Instruct *load_instruct(int fd,char* output_instr_file_name,int *size){
  Instr_list *instr_l=list_init();
  Instruct *instr_a=NULL;
  int l;
  /*命令列出力用のファイルのオープン*/
  output_instr_file=NULL;
  if(output_instr_file_name!=NULL){
    output_instr_file=fopen(output_instr_file_name,"w");
    if(output_instr_file_name==NULL){
      fprintf(stderr,"Warning: Could not open file '%s'\n",output_instr_file_name);
    }
  }
  l=readline(fd,instr_l);
  if(l>0){
    instr_a=(Instruct*)malloc(l*sizeof(Instruct));
    list_to_align(instr_a,instr_l,l);
    list_free(instr_l);
    if(output_instr_file!=NULL)
      print_align(instr_a,l,output_instr_file);
  }else{
    printf("Failed to load.\n");
    list_free(instr_l);
  }
  *size=l;
  if(output_instr_file!=NULL){
    fclose(output_instr_file);
  }
  return instr_a;
}
