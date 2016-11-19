#ifndef INSTR_H
#include "simulator.h"
#include <stdio.h>
#define INSTR_H

/* ここに命令セット */
/*命令識別用番号記述箇所*/
/*上位6bitをopcode,下位6bitをfunction(形式R以外は0),それ以外は0にする*/
#define ADD 0x20
#define ADDI 0x20000000
#define SUB 0x22
#define MULT 0x18
#define DIV 0x1A
#define SLT 0x2A
#define BEQ 0x10000000
#define BNE 0x14000000
#define J 0x08000000
#define JAL 0x0C000000
#define JR 8
#define LW 0x8C000000
#define SW 0xAC000000
#define AND 0x24
#define ANDI 0x30000000
#define OR 0x25
#define ORI 0x34000000
#define XOR 0x26
#define SLL 0
#define SRA 3
#define SRL 2
#define IN 0xEC000000
#define OUT 0xF0000000
#define SWC1 0xE4000000
#define LWC1 0xC4000000
#define ADD_S 0x44000000
#define SUB_S 0x44000001
#define MUL_S 0x44000002
#define DIV_S 0x44000003
#define C_EQ_S 0x4400003C
#define C_LE_S 0x4400003D
#define C_LT_S 0x4400003E 
#define FMT_S 0
/*mnemonics*/
/* 変換後の命令数を取り出すためのマスク */
#define DCP_MNEMONIC 0x00000F00
/*これはニーモニックか?*/
#define Is_mnemonic(opcode)  ((opcode)&0x00000F00)
/*このニーモニックの長さは?*/
#define Len_mnemonic(opcode) ((((opcode)&0x00000F00)>>8)&15)
/*nop 
  sll %r0,%r0,%r0に変換される*/
#define NOP 0x00000100
/*move rt,rs
  addi rt,rs,0に変換される*/
#define MOVE 0xFC000100
/*la rt,label
  addi rt,%r0,label に変換される*/
#define LA 0xFC000101
/*jral rt 'pc (pcはアセンブラで取得)
->addi %r31,%r0,pc+2
  jr rt
  に変換される*/
#define JALR 0xFC000202

/*シミュレータ用特殊関数*/
/*未実装のライブラリ関数をシミュレータ側で動作させるようにサポートする*/
/*すべて2^26-n(n>0)の値のラベルを割り当てておく*/
/*JALでこれらのラベルを読み込んだ際、対応した動作を行う*/
/*LIB_***はライブラリで実装されるべき変数*/
/*DBG_***はデバッグ用関数*/
#define LIB_RBYTE 0x2000000-1
#define LIB_RINT 0x2000000-2
#define LIB_RFLOAT 0x2000000-3
/*read_*関数*/
/*標準出力から読み込んだ文字列を対応した形式に置き換え%r1,または%f0に置く*/
#define LIB_NLINE 0x2000000-4
/*print_newline関数*/
/*改行を出力*/
#define LIB_WBYTE 0x2000000-9
#define LIB_WINT 0x2000000-10
#define LIB_WFLOAT 0x2000000-11
/*write_*関数*/
/*%r1,または%f0の値を対応した形式で標準出力に出力*/
#define LIB_SIN 0x2000000-17
#define LIB_COS 0x2000000-18
#define LIB_ATAN 0x2000000-19
/*名称通り。入力・出力ともに%f0*/
#define LIB_ITOF 0x2000000-20
/*入力:%r1,出力:%f0*/
#define LIB_FTOI 0x2000000-21
/*入力:%f0,出力:%r1*/
#define LIB_FLOOR 0x2000000-22
/*入力,出力:%f0*/
#define LIB_SQRT  0x2000000-23
/*入力,出力:%f0*/
#define LIB_FABS  0x2000000-24
/*入力,出力:%f0*/
#define LIB_CR_ARRAY 0x2000000-33
/*入力:%r1,%r2,出力:%r1*/
#define LIB_CR_ARRAY_F 0x2000000-34
/*入力:%f0,出力:%r1*/
#define LIB_F_IS_0 0x2000000-25
/*入力:%f0,出力:%r1*/
#define LIB_F_IS_POS 0x2000000-26
/*入力:%f0,出力:%r1*/
#define LIB_F_NEG 0x2000000-27
/*入力:%f0,出力:%f0*/
#define LIB_F_SQR 0x2000000-28
/*入力:%f0,出力:%f0*/
#define LIB_F_LESS 0x2000000-29
/*入力:%f0,出力:%r1*/
#define LIB_F_HALF 0x2000000-30
/*入力:%r1,%f0,出力:%r1*/
#define LIB_F_IS_NEG 0x2000000-31
/*入力:%r1,%f0,出力:%r1*/
#define DBG_PSTR 0x2000000-65
/*%r1に格納されたポインタからNULまで文字列を出力。*/


/*アセンブラ指令,デバッグ用命令 バイナリファイルには含めない命令*/
#define MASK_ASSEM_INSTR 0x02000000
/* .text textセクションの開始*/
#define _TEXT 0x02000100
/* .data dataセクションの開始*/
#define _DATA 0x02000200
/* .align n  メモリ上のデータの配置を2^nバイト毎に行う*/
#define _ALIGN 0x02000300
/* .word n 整数nを表す1wordのデータをメモリ上に配置 */ 
#define _WORD 0x02000400
/* .globl label  labelをリンカに登録する 開始時のエントリポイントの指定に必要*/
#define _GLOBL 0x02000500
/* .break  この命令の位置にブレークポイントを設定  '!' でも可?*/
#define _BREAK 0x03000000
/*バイナリコード(4byte)から要素を抜き出すためのマクロ*/

#define MASK_OP_FUN 0xFC00003F
#define Fetch_opcode(code) (((code)&0xFC000000)>>26)
#define Fetch_rs(code) (((code)&0x3E00000)>>21)
#define Fetch_rt(code) (((code)&0x1F0000)>>16)
#define Fetch_rd(code) (((code)&0xF800)>>11)
#define Fetch_sa(code) (((code)&0x7C0)>>6)
#define Fetch_function(code) ((code)&0x3F)
#define Fetch_immediate(code) (((code)&0x8000)?(((code)&0xFFFF)|0xFFFF0000):((code)&0x7fff))
#define Fetch_instr_index(code) ((code)&0x3FFFFFF)

#define INSTR_START -1
#define INSTR_END -1

/*オペランド指定用のマクロ;今のところreadline.cのみで使用;構文チェック用*/
#define UNKNOWN -1
#define ERROR -2
#define REG 1
#define FREG 2
#define IMMIDIATE 4
#define NONE 0

/*命令実行用の関数のプロトタイプ宣言(まだ仮置きのまま)
  実体はinstructs.cに記述*/

/*形式Rの命令*/
int instr_clear(Simulator *sim,int rs,int rt,int rd,int sa);
/*レジスタの初期化; pc++*/
int instr_nop(Simulator *sim,int rs,int rt,int rd,int sa);
/*pc++*/
int instr_add(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs+rt; pc++*/
int instr_sub(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs-rt; pc++*/
int instr_mult(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- (rs*rt)[31:0]; pc++*/
int instr_div(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs/rt; pc++*/
int instr_slt(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- (if rs<rt then 1 else 0); pc++*/
int instr_jr(Simulator *sim,int rs,int rt,int rd,int sa);
/*pc <- rs*/
int instr_and(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs&rt; pc++*/
int instr_or(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs|rt; pc++*/
int instr_xor(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs^rt; pc++*/
int instr_sll(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rt<<sa; pc++*/
int instr_sra(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs>>sa (arithmetic); pc++*/
int instr_srl(Simulator *sim,int rs,int rt,int rd,int sa);
/*rd <- rs>>rt; pc++*/
int instr_in(Simulator *sim,int rs,int rt,int rd,int sa);
/*read 4 bytes from stdin into rd)*/
int instr_out(Simulator *sim,int rs,int rt,int rd,int sa);
/*write 4 bytes from stdout into rsx*/

/*形式Iの命令*/
int instr_move(Simulator *sim,int rs,int rt,int imm);
/*rt < -rs;pc++*/
int instr_addi(Simulator *sim,int rs,int rt,int imm);
/*rt <- rs+imm; pc++*/
int instr_andi(Simulator *sim,int rs,int rt,int imm);
/*rt <- rs&imm; pc++*/
int instr_ori(Simulator *sim,int rs,int rt,int imm);
/*rt <- rs|imm; pc++*/
int instr_beq(Simulator *sim,int rs,int rt,int offset);
/*if rs=rt then pc<-pc+offset else pc++*/
int instr_bne(Simulator *sim,int rs,int rt,int offset);
/*if rs!=rt then pc<-pc+offset else pc++*/
int instr_lw(Simulator *sim,int rbase,int rt,int offset);
/*rt <- mem[rbase+offset]; pc++*/
int instr_sw(Simulator *sim,int rbase,int rt,int offset);
/*mem[rbase+offset] <- rt; pc++*/

/*形式Jの命令*/
int instr_j(Simulator *sim,int instr_index);
/*pc<-instr_index*/
int instr_jal(Simulator *sim,int instr_index);
/*r31<-pc; pc<-instr_index*/

/*浮動小数点命令・I形式*/
int instr_flwc1(Simulator *sim,int base,int ft,int offset);
/*ft <- mem[base+offset]; pc++*/
int instr_fswc1(Simulator *sim,int base,int ft,int offset);
/*mem[base+offset] <- ft; pc++*/
/*浮動小数点命令・R形式*/
int instr_fadds(Simulator *sim,int fmt,int ft,int fs,int fd);
/*fd <- fs+ft; pc++*/
int instr_fsubs(Simulator *sim,int fmt,int ft,int fs,int fd);
/*fd <- fs-ft; pc++*/
int instr_fmuls(Simulator *sim,int fmt,int ft,int fs,int fd);
/*fd <- fs*ft; pc++*/
int instr_fdivs(Simulator *sim,int fmt,int ft,int fs,int fd);
/*fd <- fs/ft; pc++*/
int instr_fceqs(Simulator *sim,int fmt,int ft,int fs,int rd);
/*rd <- (fs==ft); pc++*/
int instr_fcles(Simulator *sim,int fmt,int ft,int fs,int rd);
/*rd <- (fs<=ft); pc++*/
int instr_fclts(Simulator *sim,int fmt,int ft,int fs,int rd);
/*rd <- (fs<ft); pc++*/

/*アセンブラの命令名を読み取るための関数
  実体はinstructs.cに記述*/
int get_instr(char *name);
/*命令の識別番号からアセンブラの命令名を読み取り、指定したファイルストリームに出力*/
void print_instr(Instruct instr,FILE* out_file);

/*以下はfetch.cに定義されている*/
/*命令の形式を取得する関数*/
int judge_type(int opcode);
#define TYPE_R 0x10
#define TYPE_I 0x20
#define TYPE_J 0x30
#define UNKNOWN_OP -1

/*Instruct型のデータから、実行する関数とその引数を返す関数*/
int fetch_r(int (**instr)(Simulator*,int,int,int,int),int op[4],Instruct ins);
int fetch_i(int (**instr)(Simulator*,int,int,int),int op[4],Instruct ins);
int fetch_j(int (**instr)(Simulator*,int),int op[4],Instruct ins);
/*バイナリコードから、命令の種類と引数を取り出す関数*/
int code_fetch(int code,int *opcode,int op[4]);

/*命令をバイナリに変換する関数*/
int make_code_r(int opcode,int rs,int rt,int rd,int sa);
int make_code_i(int opcode,int rs,int rt,int imm);
int make_code_j(int opcode,int instr_index);
#endif
