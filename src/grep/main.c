#include <stdio.h>
#include <stdlib.h>

#include "parse.h"

int main(int argc, char **argv) {
  options opts = {0};

  parse_arguments(argc, argv, &opts);

  return 0;
}
