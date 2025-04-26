#include "parse.h"

#include <ctype.h>
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void parse_arguments(int argc, char **argv, options *opts) {
  int opt;
  regex_t preg;
  FILE *file = NULL;
  int invalid_flag = 0;

  while ((opt = getopt_long(argc, argv, "ce:ivln", NULL, 0)) != -1) {
    if (strchr("ceivln", opt) != NULL) {  ////ogo
      if (opt == 'c')
        opts->c = 1;
      else if (opt == 'e') {
        opts->e = 1;
        e_pattern(opts, optarg);
      } else if (opt == 'i') {
        opts->i = 1;
      } else if (opt == 'v') {
        opts->v = 1;
      } else if (opt == 'n')
        opts->n = 1;
      else if (opt == 'l')
        opts->l = 1;
    } else {
      invalid_flag = 1;
    }
  }

  if (invalid_flag) {
    fprintf(stderr, "Oh boy! invalid flag\n");
  } else if (optind >= argc)  // wth patterns or files
  {
    fprintf(stderr,
            "it's supposed to be like: %s  [OPTIONS] PATTERN [FILE...] \n",
            argv[0]);
  } else {
    if (!opts->e) {
      strcat(opts->pattern, argv[optind]);
      optind++;
    }
    for (int i = optind; i < argc; i++) {
      file = fopen(argv[i], "r");
      if (file) {
        pattern_file(&preg, &file, argv[i], opts);
        fclose(file);
      } else {
        perror("Error opening file");
      }
    }
  }
}

void e_pattern(options *opts, char *str) {
  if (opts->pattern_count) strcat(opts->pattern, "|");
  strcat(opts->pattern, str);
  opts->pattern_count++;
}

void pattern_file(regex_t *preg, FILE **file, char *filename, options *opts) {
  int regcom_parametr = REG_EXTENDED;

  if (opts->i) {
    regcom_parametr |= REG_ICASE;
  }
  if (regcomp(preg, opts->pattern, regcom_parametr)) {
    fprintf(stderr, "weird pattern (shablon tipa stranniy)\n");
  } else if (*file) {
    results_on_grep_with_options(*file, opts, preg, filename);
  } else {
    regfree(preg);
    perror(
        "cant open ur file (maybe u forgot to provide pattern how "
        "could u ?))");
  }
}

void results_on_grep_with_options(FILE *file, options *opts, regex_t *preg,
                                  char *filename) {
  char *line = NULL;
  size_t len = 0;
  ssize_t read;
  int match;
  int line_number = 0;
  int match_count = 0;
  while ((read = getline(&line, &len, file)) != -1) {
    line_number++;
    // if (line[read - 1] == '\n') {
    //   line[read - 1] = '\0';
    // }
    match = regexec(preg, line, 0, NULL, 0);

    if (opts->v) {
      match = !match;
    }

    if (!match) {
      match_count++;

      if (opts->l && (opts->c)) {
        printf("1\n");
        printf("%s\n", filename);
        break;
      }

      if (opts->l && !opts->c) {
        printf("%s\n", filename);
        break;
      }
      if (opts->n && (!(opts->l) && !(opts->c))) {
        printf("%d:", line_number);
      }
      if (!opts->c) printf("%s", line);
    }
  }
  if (opts->c && !opts->l) {
    printf("%d\n", match_count);
  }

  free(line);
  regfree(preg);
}