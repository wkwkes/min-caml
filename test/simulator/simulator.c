#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "simulator.h"
#include "instructs.h"

/*readline.cに定義*/
extern Instruct *load_instruct(int fd,char* output_instr_file_name,int *size);
extern Label *labels;
extern int get_pc(Label *labels,char *name_label);
/*assemble.cに定義*/
extern int make_code(int out_fd,Instruct *instr,int n);

#define Sim_Init(sim) int _i; (sim).mem=(char*)malloc(MEMSIZE*sizeof(char));do{ for(_i=0;_i<MEMSIZE;_i++) sim.mem[_i]=0; for(_i=0;_i<REGS;_i++){ (sim).reg[_i]=0; (sim).freg[_i]=0;}(sim).pc=0;} while(0);
#define Sim_fin(sim) do{ free((sim).mem);} while(0);

#define Is_break(opcode) ((opcode)&_BREAK)
#define Clear_break(opcode) opcode=((opcode)&MASK_OP_FUN)
#define Set_break(opcode) opcode=((opcode)|_BREAK)
/*オプションから受け取った変数*/
int debug,execute;
int binary_output;
long long int iter_max;
void print_regs(Simulator sim) {
  int i;
  fprintf(stderr, "GPRs:\n");
  fprintf(stderr, "   %11d %11d %11d %11d %11d %11d %11d %11d\n--------------------------------------------------------------------------------------------------\n",0,1,2,3,4,5,6,7);
  for (i = 0; i < REGS; i++) {
    if (i % 8 == 0) fprintf(stderr, "%2d:", i);
    fprintf(stderr, "%11d ", sim.reg[i]);
    if (i % 8 == 7) fprintf(stderr,"\n");
  }
  fprintf(stderr, "\nFPRs:\n");
  fprintf(stderr, "   %11d %11d %11d %11d %11d %11d %11d %11d\n--------------------------------------------------------------------------------------------------\n",0,1,2,3,4,5,6,7);
  for (i = 0; i < FREGS; i++) {
    if (i % 8 == 0) fprintf(stderr, "%2d:", i);
    fprintf(stderr, "%11.4e ", sim.freg[i]);
    if(i % 8 == 7) fprintf(stderr, "\n");
  }

  fprintf(stderr, "PC = %d\n", sim.pc);
}

int simulation(Instruct *instr, int n){
  Simulator sim;
  Instruct now;
  int (*instr_r)(Simulator*,int,int,int,int),(*instr_i)(Simulator*,int,int,int),(*instr_j)(Simulator*,int),op[4];
  int instr_type;
  long long int clocks=0;
  int flag=0;
  Sim_Init(sim);
  /*simulator実行部分*/
  fprintf(stderr,"Execution started.\n");
  while(sim.pc<n&&clocks<iter_max){
    /*FETCH*/
    now=instr[sim.pc];
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
      flag=(*instr_r)(&sim,op[0],op[1],op[2],op[3]);
      break;
      case TYPE_I:
      flag=(*instr_i)(&sim,op[0],op[1],op[2]);
      break;
      case TYPE_J:
      flag=(*instr_j)(&sim,op[0]);
      break;
    }
    if(flag<0){
      break;
    }
    clocks++;
  }
  fflush(stdout);
  if(clocks>=iter_max){
    fprintf(stderr,"Execution stopped; too long operation.\n");
  }else if(flag<0){
    fprintf(stderr,"Fatal error occurred.\n");
  }else{
    fprintf(stderr,"Execution finished.\n");
  }
  print_regs(sim);
  fprintf(stderr,"clocks: %lld\n",clocks);
  free(instr);
  Sim_fin(sim);
  return 0;
}    

enum Flag {STEP,CONTINUE};
int step_simulation(Instruct *instr, int n) {
  Simulator sim;
  Instruct now;
  int (*instr_r)(Simulator*,int,int,int,int),(*instr_i)(Simulator*,int,int,int),(*instr_j)(Simulator*,int),op[4];
  int instr_type,stop=0,breaker=0;
  long long int clocks=0;
  int ch;
  int l = 0;//何行先にブレークポイントをセットしたいか
  int b = 0;//何行目にブレークポイントをセットしたいか
  enum Flag flag=CONTINUE;
  Sim_Init(sim);

  /*simulator実行部分*/
  fprintf(stderr,"Execution started.\n");
  while (sim.pc < n && clocks<iter_max){
    /*FETCH*/
    now=instr[sim.pc];
    stop = Is_break(now.opcode);
    if (stop || (flag == STEP)||clocks==0) {
      fprintf(stderr, "STEP No.%d.\n", sim.pc);
      print_regs(sim);
      fprintf(stderr, "clocks: %lld\n", clocks);
      fprintf(stderr, "next instruct: ");
      print_instr(instr[sim.pc], stderr);
      fprintf(stderr,"\n");

      while ((ch = getchar()) != EOF) {
        if (ch == '\n') break;
        if (ch == 's') flag = STEP;
        else if (ch == 'c') flag = CONTINUE;
        else if (ch == 'l') {//l行先にブレークポイントをセットする（l行分実行する）
          scanf("%d", &l);
          Set_break(instr[sim.pc + l].opcode);
          flag = CONTINUE;
        }
        else if (ch == 'b') {//b行目にブレークポイントをセットする（第b行まで実行する）
          scanf("%d", &b);
          Set_break(instr[b].opcode);
          flag = CONTINUE;
        }
        else fprintf(stderr, "sim: Unknown command\n");
      }

      if(ch == EOF) {
       fprintf(stderr,"step simulation cancelled.\n");
       break;
      } 
    }

    /*実行する関数とその引数をfetch*/
    instr_type=judge_type(now.opcode);
    switch (instr_type) {
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

    /*命令を実行*/
    switch (instr_type) {
      case TYPE_R: 
        breaker=(*instr_r)(&sim,op[0],op[1],op[2],op[3]);
      break;
      case TYPE_I:
        breaker=(*instr_i)(&sim,op[0],op[1],op[2]);
      break;
      case TYPE_J:
        breaker=(*instr_j)(&sim,op[0]);
      break;
    }
    if(breaker<0){
      break;
    }

    clocks++;
  }
  if(clocks>=iter_max){
    fprintf(stderr,"Execution stopped; too long operation.\n");
  }else if(flag<0){
    fprintf(stderr,"Fatal error occurred.\n");
  }else{
    fprintf(stderr,"Execution finished.\n");
  }
  print_regs(sim);
  fprintf(stderr,"clocks: %lld\n",clocks);
  free(instr);
  Sim_fin(sim);
  return 0;
}

int _sim(int program_fd, char *output_instr_file_name, int out_binary_fd) {
  int n, written_bytes;
  Instruct *instr;
  /*命令のロード*/
  instr = load_instruct(program_fd, output_instr_file_name, &n);

  if (out_binary_fd > 0) {//アセンブラ機能が有効のとき
    written_bytes = make_code(out_binary_fd, instr, n);
    fprintf(stderr, "%d byte written\n", written_bytes);
  }

  if (execute && n >= 0) {//シミュレーションを実行
    if (debug) step_simulation(instr,n);//ステップ実行
    else simulation(instr,n);//通常実行
  }
  if(debug)
    free(labels);
  return 0;
}
