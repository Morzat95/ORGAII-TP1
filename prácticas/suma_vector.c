#include <stdio.h>
#include <stdlib.h>

extern float suma_vf(float *vector, int cantidad);

int main (){
	
	float vector[] = {-1.5, 3.91, 79.42, 95.15, 312.06}; // 489.04
	int cantidad = sizeof(vector) / sizeof(float);
	
    float resultado = suma_vf(vector, cantidad);

	printf("Vector: {");
	for (int i = 0; i < cantidad; i++)
	{
		char *current_val = (i + 1 == cantidad) ? "%.4f" : "%.4f, ";
		printf(current_val, vector[i]);
	}
	puts("}");

	printf("Suma: %.4f\n", resultado);
	
	return 0;
}