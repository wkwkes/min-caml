#ifndef SIM_H

#define SIM_H
#define MEMSIZE 2097148
#define REGS 32
#define FREGS 32

typedef struct simulator {
  char *mem;
  int reg[REGS];
  float freg[FREGS];
  int pc;
} Simulator;

typedef struct instruct {
  int opcode;
  int operands[4];
} Instruct;

typedef struct instr_list {
  int no;
  Instruct instr;  
  struct instr_list *next;
  struct instr_list *back;
} Instr_list;


/*ラベル構造体の定義*/
typedef struct label{
  char name[100];
  int pc;
  int type;
} Label;

Instruct instruct_get(Instr_list l);
Instr_list instruct_load(int fd);

#define Rev_bits(i) ((((i)&1)<<7)|(((i)&2)<<5)|(((i)&4)<<3)|(((i)&8)<<1)|(((i)&16)>>1)|(((i)&32)>>3)|(((i)&64)>>5)|(((i)&128)>>7))

#endif
