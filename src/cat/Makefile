CC = gcc
CFLAGS = -Wall -Werror -Wextra #/убери решетку
EXE = s21_cat

all: $(EXE) # $@ - target  $^ - все предварительные условия для нее

$(EXE): main.o
	$(CC) $(CFLAGS) -o $@ $^

main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $^

rebuild: clean format all

clean:
	rm -rf *.o
	rm -rf $(EXE)
format:
	clang-format -i *.c *.h