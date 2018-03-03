CC=gcc
a: test1.c
	$(CC) test1.c -o test
run:
	./test
clean:
	rm -rf test
