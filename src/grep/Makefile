CC = gcc
CFLAGS = -Wall -Werror -Wextra
EXE = s21_grep

all: $(EXE) # $@ - target  $^ - все предварительные условия для нее

$(EXE): main.o parse.o
	$(CC) $(CFLAGS) -o $@ $^

main.o: main.c 
	$(CC) $(CFLAGS) -c -o $@ $^

parse.o: parse.c
	$(CC) $(CFLAGS) -c -o $@ $^

rebuild: clean format all

clean:
	rm -rf *.o
	rm -rf $(EXE)

format:
	clang-format -i *.c *.h
