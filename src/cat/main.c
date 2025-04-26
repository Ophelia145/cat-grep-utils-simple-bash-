#include "main.h"

#include <ctype.h>
#include <getopt.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
  options opts = {0};
  int opt;
  int invalid_flag = 0;
  while ((opt = getopt_long(argc, argv, "beEnstTv", long_options, NULL)) !=
         -1) {
    if (strchr("bensETtv", opt) != NULL) {
      if (opt == 'b')
        opts.b = 1;
      else if (opt == 'e') {
        opts.e = 1;
        opts.v = 1;
      } else if (opt == 'T') {
        opts.t = 1;
      } else if (opt == 'E') {
        opts.e = 1;
      } else if (opt == 'n')
        opts.n = 1;
      else if (opt == 's')
        opts.s = 1;
      else if (opt == 't') {
        opts.t = 1;
        opts.v = 1;
      } else if (opt == 'v')
        opts.v = 1;
    } else {
      invalid_flag = 1;
    }
  }
  if (invalid_flag) {
    fprintf(stderr, "Oh boy! invalid flag\n");
  } else if (optind >= argc) {
    fprintf(stderr, "it's supposed to be like: %s [options] file\n", argv[0]);
  } else {
    const char *filename = argv[optind];
    FILE *file = fopen(filename, "r");
    if (file != NULL) {
      Printing_file_with_options(file, &opts);
      fclose(file);
    } else {
      perror("cant open ur file");
    }
  }
  return 0;
}

void Printing_file_with_options(FILE *file, options *opts) {
  int number = 0;
  _Bool emptyOneJustPrinted = 0;
  int c = fgetc(file), previous_c = '\n';

  while (c != EOF) {
    Depend_on_options(c, &previous_c, opts, &number, &emptyOneJustPrinted);
    c = fgetc(file);
  }
}

void Depend_on_options(int c, int *previous_c, options *opts, int *number,
                       _Bool *emptyOneJustPrinted) {
  int skip_line = 0;
  if (opts->s && *previous_c == '\n' && c == '\n' && *emptyOneJustPrinted) {
    skip_line = 1;
  }
  if (!skip_line) {
    if (*previous_c == '\n' && c == '\n') {
      *emptyOneJustPrinted = 1;
    } else {
      *emptyOneJustPrinted = 0;
    }
    if (((opts->n && !opts->b) || (opts->b && c != '\n')) &&
        *previous_c == '\n') {
      *number += 1;
      printf("%6d\t", *number);
    }
    if (opts->e && c == '\n') {
      putchar('$');
    }
    if (opts->t && c == '\t') {
      printf("^I");
      *previous_c = c;
      return;
    }
    if (opts->v && c >= 0 && c <= 31 && c != '\n' && c != '\t') {
      printf("^");
      c += 64;
    }
    putchar(c);
  }
  *previous_c = c;
}
