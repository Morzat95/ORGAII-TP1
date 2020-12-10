global suma_vf

section .data
    initial dq 0

section .text

    suma_vf:
        push ebp
        mov ebp, esp

        mov eax, [ebp + 8] ; vector
        mov edx, [ebp + 12] ; cantidad

        fld dword[initial] ; cargamos un valor inicial nulo para poder operar en una sola pasada de atrás hacia delante
        
        .sumar:
            dec edx ; usamos la cantidad como un contador regresivo disminuyéndolo en 1 por cada pasada
            fld dword[eax + 4 * edx] ; cargamos el siguiente valor
            fadd ; sumamos
            cmp edx, 0 ; comparamos con 0 para saber si hay que seguir sumando
            jg suma_vf.sumar ; seguimos hasta que sumamos todos los números

    fin:
        mov esp, ebp
        pop ebp
        ret