#ifndef MAIN_H
#define MAIN_H
#include <stdio.h>
#include <getopt.h>

typedef struct {
  _Bool b;
  _Bool e;
  _Bool n;
  _Bool s;
  _Bool t;
  _Bool v;
  _Bool T;
  _Bool E;

} options;

struct option long_options[] = {{"number-nonblank", no_argument, NULL, 'b'},
                                {"number", no_argument, NULL, 'n'},
                                {"squeeze-blank", no_argument, NULL, 's'},
                                {"show-ends", no_argument, NULL, 'E'},
                                {"show-tabs", no_argument, NULL, 'T'},
                                {"show-nonprinting", no_argument, NULL, 'v'},
                                {NULL, 0, NULL, 0}};


void Depend_on_options(int c, int *previous_c, options *opts, int *number,
                       _Bool *emptyOneJustPrinted);
void Printing_file_with_options(FILE *file, options *opts);

#endif