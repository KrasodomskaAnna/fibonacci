#include <stdio.h>
int fib(int k);

int main()
{
	int wynik;

	wynik = fib(20);

	printf("\nWynik = %d\n", wynik);
	return 0;
}