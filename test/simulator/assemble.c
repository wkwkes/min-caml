#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "simulator.h"
#include "instructs.h"

/*simulator.c*/
extern int debug;
/*readline.c*/
extern Label *labels;
int n_label;

void conv(int code,char buf[4]){
  buf[0]=(char)Rev_bits(code&0xFF);
  buf[1]=(char)Rev_bits((code&0xFF00)>>8);
  buf[2]=(char)Rev_bits((code&0xFF0000)>>16);
  buf[3]=(char)Rev_bits((code&0xFF000000)>>24);
}

void flip(int code,char buf[4]){
  buf[3]=(char)(code&0xFF);
  buf[2]=(char)((code&0xFF00)>>8);
  buf[1]=(char)((code&0xFF0000)>>16);
  buf[0]=(char)((code&0xFF000000)>>24);
}  

int make_code(int out_fd,Instruct *instr,int n){
  int i,j,len,op[4],instr_type,code,written=0;
  char buf[4];

  for(i=0;i<n;i++){
    if((instr_type=judge_type(instr[i].opcode))>0){
      switch(instr_type){
      case TYPE_R:
	fetch_r(NULL,op,instr[i]);
	code=make_code_r(instr[i].opcode&MASK_OP_FUN,op[0],op[1],op[2],op[3]);
	flip(code,buf);
	for(j=0;j<4;j++)
	  written+=write(out_fd,(void*)(buf+j),1);
	break;
      case TYPE_I:
	fetch_i(NULL,op,instr[i]);
	if(instr[i].opcode==LA)
	  code=ADDI;
	else
	  code=instr[i].opcode;
	code=make_code_i(code&MASK_OP_FUN,op[0],op[1],op[2]);
	flip(code,buf);
	for(j=0;j<4;j++)
	  written+=write(out_fd,(void*)(buf+j),1);
	break;
      case TYPE_J:
	fetch_j(NULL,op,instr[i]);
	code=make_code_j(instr[i].opcode&MASK_OP_FUN,op[0]);
	flip(code,buf);
	for(j=0;j<4;j++)
	  written+=write(out_fd,(void*)(buf+j),1);
	break;
      }
    }
  }
  fprintf(stderr,"%d\n",debug);
  if(debug){
    i=0xffffffff;
    j=0;
    written+=write(out_fd,(void*)(&i),4);
    written+=write(out_fd,(void*)(&n_label),4);
    for(i=0;i<n_label;i++){
      len=strlen(labels[i].name);
      written+=write(out_fd,(void*)(&len),4);
      written+=write(out_fd,(void*)(labels[i].name),len+1);
      written+=write(out_fd,(void*)(&j),((((len)>>2)+1)<<2)-(len+1));
      written+=write(out_fd,(void*)(&(labels[i].pc)),sizeof(int));
    }
  }
  
  return written;
}


/*
program
0xffffffff
*/
