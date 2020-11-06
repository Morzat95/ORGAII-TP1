#include <stdio.h>
#include <stdlib.h>

extern void CMAIN(float a, float b, float c);

int main()
{

  float a;
  float b;
  float c;

  printf("Introduzca el valor deĺ coeficiente cuadrático: ");
  scanf("%f", &a);

  printf("Introduzca el valor deĺ coeficiente lineal: ");
  scanf("%f", &b);

  printf("Introduzca el valor deĺ término independiente: ");
  scanf("%f", &c);

  CMAIN(a, b, c);
  return 0;
}

// Ejemplo de cómo sumar 2 números llamados desde .asm
// nasm -f elf32 code.asm code.o 
// gcc -m32 main.c code.o -o main   
// Ejecutar con ./main  
