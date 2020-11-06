;%include "io.inc"
extern printf

section .data

    format db "result X1 = %.4f, X2 = %.4f",10,0
    a dq 0
    b dq 0
    c dq 0
    cuatro dd 4.0
    menosuno dd -1.0
    dos dd 2.0
    x1 dq 0
    x2 dq 0

section .text
global CMAIN             ; must be declared for llsinker (1d)

CMAIN:                       ; tell the linker entry point
    xor eax, eax
    ;enter
    push ebp
    mov ebp, esp

    ; ---- CALCULO X1 ----
    ; -b
    fld dword[ebp+12]
    fld dword[menosuno]
    fmul

    ; b^2
    fld dword[ebp+12]
    fld dword[ebp+12]
    fmul

    ;4*a*c 
    fld dword[cuatro]
    fld dword[ebp+8]
    fld dword[ebp+16]
    fmul
    fmul

    ; b^2-4*a*c
    fsub

    ; (b^2-4*a*c)^1/2
    fsqrt

    ; -b + (b^2-4*a*c)^1/2
    fadd

    ; 2*a
    fld dword[dos]
    fld dword[ebp+8]
    fmul

    ; [ -b + (b^2-4*a*c)^1/2 ] / 2*a
    fdiv

    ; resultado -> X1 (el stack de la FPU está vacío ahora)
    fstp qword[x1]

    ; ---- CALCULO X2 ----
    ; -b
    fld dword[ebp+12]
    fld dword[menosuno]
    fmul

    ; b^2
    fld dword[ebp+12]
    fld dword[ebp+12]
    fmul

    ;4*a*c 
    fld dword[cuatro]
    fld dword[ebp+8]
    fld dword[ebp+16]
    fmul
    fmul

    ; b^2-4*a*c
    fsub

    ; (b^2-4*a*c)^1/2
    fsqrt

    ; -b - (b^2-4*a*c)^1/2
    fsub

    ; 2*a
    fld dword[dos]
    fld dword[ebp+8]
    fmul

    ; [ -b + (b^2-4*a*c)^1/2 ] / 2*a
    fdiv

    ; resultado -> X2 (el stack de la FPU está vacío ahora)
    fstp qword[x2]

    ; print results
    push dword[x2+4]
    push dword[x2]
    push dword[x1+4]
    push dword[x1]
    push format
    call printf

    mov esp, ebp
    pop ebp

    ret