#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "simulator.h"
#include "instructs.h"

#define Sim_Init(sim) int _i; do{ for(_i=0;_i<MEMSIZE;_i++) sim.mem[_i]=0; for(_i=0;_i<REGS;_i++){ (sim).reg[_i]=0;(sim).freg[_i]=0;}(sim).pc=0;} while(0);
#define Is_break(opcode) ((opcode)&_BREAK)
#define Clear_break(opcode) ((opcode)&MASK_OP_FUN)
#define Set_break(opcode) ((opcode)|_BREAK)
/*オプションから受け取った変数*/
/*simulation.c*/
extern int debug,execute;
extern long long int iter_max;
extern void print_regs(Simulator sim);
/*readline.c*/
Label *labels;
int n_label;
void print_code(FILE *output_instr_file, int *bin, int n){
  int i,op[4]={0,0,0,0};
  Instruct ins;
  fprintf(output_instr_file,"pc\tcode    \tinstr\top1\top2\top3\top4\n");
  for(i=0;i<n;i++){
    fprintf(output_instr_file,"%d\t%08X\t",i,bin[i]);
    code_fetch(bin[i],&(ins.opcode),op);
    print_instr(ins,output_instr_file);
    fprintf(output_instr_file,"\t%d\t%d\t%d\t%d\n",op[0],op[1],op[2],op[3]);
  } 
}
int simulation_bin(int *bin, int n){
  Simulator sim;
  int now;
  Instruct ins;
  int (*instr_r)(Simulator*,int,int,int,int),(*instr_i)(Simulator*,int,int,int),(*instr_j)(Simulator*,int),op[4]={0,0,0,0};
  int instr_type,opcode;
  long long int clocks=0;
  Sim_Init(sim);
  /*simulator実行部分*/
  fprintf(stderr,"Execution started.\n");
  while(sim.pc<n&&clocks<iter_max){
    /*FETCH*/
    now=bin[sim.pc];
    if(now==0xffffffff)
      break;
    code_fetch(now,&opcode,op);
    instr_type=judge_type(opcode);
    ins.opcode=opcode;
    switch(instr_type){
    case TYPE_R: 
      fetch_r(&instr_r,NULL,ins);
      break;
    case TYPE_I:
      fetch_i(&instr_i,NULL,ins);
      break;
    case TYPE_J:
      fetch_j(&instr_j,NULL,ins);
      break;
    }

    /*EXECUTE*/
    switch(instr_type){
    case TYPE_R: 
      (*instr_r)(&sim,op[0],op[1],op[2],op[3]);
      break;
    case TYPE_I:
      (*instr_i)(&sim,op[0],op[1],op[2]);
      break;
    case TYPE_J:
      (*instr_j)(&sim,op[0]);
      break;
    }
    clocks++;
  }
  if(clocks>=iter_max){
    fprintf(stderr,"Execution stopped; too long operation.\n");
  }else{
    fprintf(stderr,"Execution finished.\n");
  }
  print_regs(sim);
  fprintf(stderr,"clocks: %lld\n",clocks);
  free(bin);
  return 0;
}    


enum Flag {STEP,CONTINUE};
int step_simulation_bin(Instruct *instr, int n) {
  Simulator sim;
  Instruct now;
  int (*instr_r)(Simulator*,int,int,int,int),(*instr_i)(Simulator*,int,int,int),(*instr_j)(Simulator*,int),op[4]={0,0,0,0};
  int instr_type,stop=0;
  long long int clocks=0;
  int ch;
  enum Flag flag=CONTINUE;
  Sim_Init(sim);
  /*simulator実行部分*/
  fprintf(stderr,"Execution started.\n");
  while(sim.pc<n){
    /*FETCH*/
    stop=Is_break(now.opcode);
    if(stop||flag==STEP){
      fprintf(stderr,"STEP No.%d.\n", sim.pc);
      print_regs(sim);
      fprintf(stderr,"clocks: %lld\n",clocks);
      fprintf(stderr,"next instruct: ");
      print_instr(instr[sim.pc],stderr);
      fprintf(stderr,"\n");
      while((ch = getchar())!=EOF){
	if(ch=='\n') break;
	if(ch=='s') flag=STEP;
	else if(ch=='c') flag=CONTINUE;
	else fprintf(stderr,"sim: Unknown command\n");
      }
      if(ch == EOF) {
	fprintf(stderr,"step simulation cancelled.\n");
	break;
      }
    }
    instr_type=judge_type(now.opcode);
    switch(instr_type){
    case TYPE_R: 
      fetch_r(&instr_r,op,now);
      break;
    case TYPE_I:
      fetch_i(&instr_i,op,now);
      break;
    case TYPE_J:
      fetch_j(&instr_j,op,now);
      break;
    }
    /*EXECUTE*/
    switch(instr_type){
    case TYPE_R: 
      (*instr_r)(&sim,op[0],op[1],op[2],op[3]);
      break;
    case TYPE_I:
      (*instr_i)(&sim,op[0],op[1],op[2]);
      break;
    case TYPE_J:
      (*instr_j)(&sim,op[0]);
      break;
    }
    clocks++;
  }
  
  fprintf(stderr,"Execution finished.\n");
  print_regs(sim);
  fprintf(stderr,"clocks: %lld\n",clocks);
  free(instr);
  return 0;
}
int _sim_binary(int program_fd,char *output_instr_file_name){
  int n,pc=0;
  int *bin;
  register int i,tmp,j;
  FILE *output_instr_file;
  /*命令のロード*/
  n=lseek(program_fd,0,SEEK_END)>>2;
  lseek(program_fd,0,SEEK_SET);
    /*命令列出力用のファイルのオープン*/
  output_instr_file=NULL;
  if(output_instr_file_name!=NULL){
    output_instr_file=fopen(output_instr_file_name,"w");
    if(output_instr_file_name==NULL){
      fprintf(stderr,"Warning: Could not open file '%s'\n",output_instr_file_name);
    }
  }
  if(n>0){
    bin=(int*)malloc(n*sizeof(int));
    read(program_fd,bin,n<<2);
    for(i=0;i<n;i++){
      if(bin[i]!=0xffffffff){
	tmp=bin[i];
	bin[i]=(((tmp&0xFF000000)>>24))|(((tmp&0xFF0000)>>16)<<8)|(((tmp&0xFF00)>>8)<<16)|((tmp&0xFF)<<24);
      }else{
	pc=i;
	break;
      }
    }
    if(pc==0) pc=n;
    else{
      i++;
      n_label=bin[i];
      labels=(Label*)malloc(n_label*sizeof(Label));
      i++;
      for(j=0;j<n_label;j++){
	strncpy(labels[j].name,(char*)((void*)(bin+i+1)),bin[i]);
	i+=((bin[i])>>2)+2;
	labels[j].pc=bin[i];
	i++;
      }
    }
    if(output_instr_file!=NULL){
      print_code(output_instr_file,bin,n);
      fclose(output_instr_file);
    }
    if(execute&&n>=0){
      /*if(debug) step_simulation_bin(instr,pc);
	else*/
      simulation_bin(bin,pc);
    }    
    if(labels!=NULL)
      free(labels);
    return 0;
  }else{
    fprintf(stderr,"Error: failed to load; could not open binary file\n");
    return -1;
  }
}
