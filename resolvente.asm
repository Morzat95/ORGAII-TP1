;%include "io.inc"
extern printf

section .data

    ; format db "a: %.2f, b: %.2f, c: %.2f",10,0
    format db "result X1 = %.4f",10,0
    a dq 0
    b dq 0
    c dq 0
    cuatro dd 4.0
    menosuno dd -1.0
    dos dd 2.0
    x1 dq 0

section .text
global CMAIN             ; must be declared for llsinker (1d)

CMAIN:                       ; tell the linker entry point
    xor eax, eax
    ;enter
    push ebp
    mov ebp, esp

    ; mov eax, [ebp+8] ; argument 1
    ; add eax, [esp+4] ; argument 2
    ; ; a
    ; fld dword[ebp+8]
    ; fst qword[result]

    ; ; b
    ; fld dword[ebp+12]
    ; fst qword[b]

    ; c
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

    ; resultado X1
    fst qword[x1]

    ; print results
    push dword[x1+4]
    push dword[x1]
    push format
    call printf
    ; add esp, 28

    mov esp, ebp
    pop ebp

    ret