# Práctica Gestión de Memoria

## Punto 4

Usted dispone de un dispositivo que utiliza un sistema de paginación con direcciones
virtuales de 32 bits , 1 GB de memoria física y frames de 4 KB. ¿Cuántas entradas posee la
tabla de páginas en cada uno de estos esquemas?

1. Si se utiliza un sistema de paginación de un solo nivel.
2. Si se utiliza un sistema de tabla de paginación invertido.

### Respuesta

1. Si se utiliza un sistema de paginación de un solo nivel, la tabla de páginas tendría 2^20 entradas (surge de restarle a las direcciones de 32 bits los 12 bits que representan el tamaño de páginas de 4KB).

2. Si se utiliza un sistema de paginación invertido, la tabla de páginas tendría 2^30 / 2^12 = 2^18 entradas. Esto surge de dividir 1GB (2^30) de memoria en frames de 4KB (2^12) ya que en un sistema de paginación invertida, a cada entrada en la tabla le corresponde un frame en la memoria física.

## Punto 6

Se encuentran cargados los siguientes registros de segmento para el proceso P1:

CS -> base address: 1000 , limit: 800
DS -> base address: 500 , limit: 250
SS -> base address: 4000 , limit: 200

Por otro lado, el proceso lee las siguientes direcciones lógicas:

A. La dirección 0 para el segmento de datos.<br>
B. La dirección 550 para el segmento de código.<br>
C. La dirección 100 para el segmento de stack.<br>
D. La dirección 4000 para el segmento de stack.

Calcular la dirección física asociada a cada uno de estos.

### Respuesta

A. 500 (DS base address) + 0 (offset) = 500<br>
B. 1000 (CS base address) + 550 (offset) = 1550<br>
C. 4000 (SS base address) + 100 (offset) = 4100<br>
D. No se puede leer la dirección física porque sobrepasaría el límite del segmento (el máximo es 4000 -base address- + 200 -limit- = 4200)

## Punto 7

Dado el siguiente esquema, indicar el estado final de la cache TLB y tabla de páginas.
También indicar la cantidad de rafagas utilizadas en cada secuencia.
Las páginas requeridas son las siguientes:

A. Pagina 1, Pagina 2, Pagina 6, Pagina 3, Pagina 2, Pagina 1, Pagina 4, Pagina 5<br>
B. Pagina 6, Pagina 1, Pagina 3, Pagina 2, Pagina 4, Pagina 5, Pagina 4, Pagina 6

**TLB**

| Página | Frame | Tiempo |
|  :---: | :---: | :---:  |
|    2   |   4   |   0    |
|    1   |   2   |   1    |

**Tabla de páginas**

| Página | Frame | Valid  | Tiempo |
|  :---: | :---: | :---:  | :---:  |
|    1   |   2   |   V    |   1    |
|    2   |   4   |   V    |   0    |
|    3   |   -   |   I    |        |
|    4   |   -   |   I    |        |
|    5   |   1   |   V    |   2    |
|    6   |   3   |   V    |   3    |

**Memoria principal**

|<!-- -->   |<!-- -->   |<!-- -->   |<!-- -->   |
|   :---:   |   :---:   |   :---:   |   :---:   |
|  frame 1  |  frame 2  |  frame 3  |  frame 4  |
| página 5  | página 1  | página 6  | página 2  |

**Backing store**

|<!-- -->   | <!-- -->   | <!-- -->   | <!-- -->   | <!-- -->   | <!-- -->   | <!-- -->   | <!-- -->   |
|   :---:   |   :---:   |   :---:   |   :---:   |   :---:   |   :---:   |   :---:   |   :---:   |
|<!-- -->   | <!-- -->   |  página 3  | <!-- -->   | <!-- -->   |  página 4  | <!-- -->   | <!-- -->   |

**Aclaraciones**

- Se tiene un esquema de paginación con 6 páginas , 4 frames, una TLB con dos
entradas y un backing store ilimitado.
- Para decidir qué página se reemplaza en cada momento se utiliza la política de
reemplazo FIFO (first-in , first-out).
- Siempre que se utiliza una entrada de la tabla de páginas, se actualiza la TLB
- No se contabilizan los tiempos de escritura en este ejercicio.
- Los tiempos de acceso son los siguientes:
    - TLB -> 1 rafaga
    - Tabla de paginas -> 2 rafagas
    - Backing Store -> 10 rafagas.

### Respuesta

**A**

![execution](../images/Práctica&#32;Gestión&#32;de&#32;Memoria&#32;-&#32;Punto&#32;7&#32;-&#32;Primera&#32;Parte.jpeg)

**B**

![execution](../images/Práctica&#32;Gestión&#32;de&#32;Memoria&#32;-&#32;Punto&#32;7&#32;-&#32;Segunda&#32;Parte.jpeg)

# Práctica FPU

## Punto 4

Escriba una función en assembler IA-32 que reciba un puntero a un vector de números de punto flotante de precisión simple y calcule la suma. El prototipo de la función es:
```
    float suma_vf(float *vector, int cantidad);
```

### Respuesta

Ejecutar el siguiente comando en la carpeta `prácticas` del proyecto:
```
    ./script.sh
```

![execution](../images/Práctica&#32;FPU&#32;-&#32;Punto&#32;4.png)