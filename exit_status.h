#ifndef EXIT_STATUS_H
#define EXIT_STATUS_H
typedef enum {Success=0, Error_command_line=1, Error_open_file=2, Error_parse_file=3} exit_status;
#endif