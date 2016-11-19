#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "simulator.h"
#include "instructs.h"

/*simulator.c*/
extern int _sim(int program_fd,char* output_instr_file_name,int out_binary_fd);
extern int make_code(int out_fd,Instruct *instr,int n);
extern int iter_max;
extern int debug;
extern int execute;
extern int binary_output;
/*sim_binary.c*/
extern int _sim_binary(int program_fd,char *output_instr_file_name);
/*instructs.c*/
extern FILE *input_file;
extern FILE *output_file;

int main(int argc, char* argv[]) {
  int program_fd,out_binary_fd = -1;
  int input_binary = 0;
  int binary_output = 0;
  execute = 1;
  debug = 0;
  iter_max = 0x7fffffff;
  input_file = stdin;
  output_file = stdout;

  int ch;
  char _ch;
  extern char *optarg;
  extern int optind,opterr;
  
  char *binary_file_name,*output_instr_file_name = NULL;
  int name_len;

  while ((ch = getopt(argc,argv,"bdni:o:l:a:I:")) != -1) {
    switch (ch) {
    case 'b': /* read binary */
      input_binary=1;
      break;
    case 'd': /* debug mode */
      debug=1;
      break;
    case 'i': /* input file */
      fprintf(stderr,"input file: %s\n",optarg);
      input_file=fopen(optarg,"r");
      break;
    case 'o': /* output file */
      fprintf(stderr,"output file: %s\n",optarg);
      output_file=fopen(optarg,"w");
      break;
    case 'n': /* no simulation */
      execute=0;
      break;
    case 'l': /* output instructs */
      name_len=strlen(optarg);
      output_instr_file_name=(char*)malloc((name_len+1)*sizeof(char));
      strcpy(output_instr_file_name,optarg);
      break;
    case 'a': /* assembler */
      binary_output=1;
      name_len=strlen(optarg);
      binary_file_name=(char*)malloc((name_len+1)*sizeof(char));
      strcpy(binary_file_name,optarg);
      break;
      case 'I':
      iter_max=atoi(optarg);
      break;
    default: /* unknown option */
      _ch=(char)ch;
      fprintf(stderr,"Warning: Unknown option '%s'\n",&_ch);
    }
  }
if (optind >= argc) {
    fprintf(stderr, "Error: no input file\n");
  } else {
    if ((program_fd = open(argv[optind], O_RDONLY))<0){
      fprintf(stderr, "Error: file '%s' not found\n", argv[optind]);
    } else {
      if (input_binary) {//バイナリ実行機能が有効かどうか
        _sim_binary(program_fd, output_instr_file_name);
      } else {//アセンブリ実行
       if (binary_output) {//アセンブラ機能が有効かどうか
         if ((out_binary_fd = open(binary_file_name, O_WRONLY | O_CREAT,00666)) < 0) {
           fprintf(stderr, "Error: file '%s' not found\n", argv[1]);
         } else {
           fprintf(stderr, "writing code into file '%s'\n", binary_file_name);
         }
         free(binary_file_name);
       }
       _sim(program_fd,output_instr_file_name,out_binary_fd);//アセンブリを実行
     }
   }
   close(program_fd);
   if(out_binary_fd>0)
    close(out_binary_fd);
}
if(output_instr_file_name!=NULL){
  free(output_instr_file_name);
}
if(input_file!=stdin)
  fclose(input_file);
if(output_file!=stdout)
  fclose(output_file);
return 0;
}
