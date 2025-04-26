#ifndef GREP_H
#define GREP_H
#include <regex.h>
#include <stdbool.h>
#include <stdio.h>

typedef struct {
  bool i;
  bool e;
  bool v;
  bool c;
  bool l;
  bool n;
  int pattern_count;
  char pattern[2048];
} options;

void parse_arguments(int argc, char **argv, options *opts);
void e_pattern(options *opts, char *str);
void pattern_file(regex_t *preg, FILE **file, char *filename, options *opts);
void results_on_grep_with_options(FILE *file, options *opts, regex_t *preg,
                                  char *filename);

#endif  // GREP_H