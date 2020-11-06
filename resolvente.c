#include <stdio.h>
#include <stdlib.h>

extern void CMAIN(float a, float b, float c);

int main()
{
  // printf("%d\n", add(2, 6));
  float a = 6;
  float b = 15.3;
  float c = 2;
  CMAIN(a, b, c);
  return 0;
}

//Ejemplo de cómo sumar 2 números llamados desde .asm
// nasm -f elf32 code.asm code.o 
// gcc -m32 main.c code.o -o main   
// Ejecutar con ./main  
