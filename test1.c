#include <stdio.h>

void func() {
  printf("this is gonna be dead code?");
}

void a() {

}
void b() {
  a();
  func();
}
void c() {

}

int main() {
	//printf("hello world, clang static analyzer testing\n");
  int x = 0;
  //main();
  int y = 10/x;
  if (0) {
    func();
  }
  a();
  b();
  c();
	/*int * p;
	int a = *p;
	printf("a is %d\n", a);*/
}
