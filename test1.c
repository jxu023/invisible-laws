#include <stdio.h>

int main() {
	printf("hello world, clang static analyzer testing\n");
	int * p;
	int a = *p;
	printf("a is %d\n", a);
}
