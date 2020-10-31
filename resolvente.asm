;%include "io.inc"
extern printf

section .data

    format db "a: %.2f, b: %.2f, c: %.2f",10,0
    result dq 0
    b dq 0
    c dq 0

section .text
global CMAIN             ; must be declared for llsinker (1d)

CMAIN:                       ; tell the linker entry point
    xor eax, eax
    ;enter
    push ebp
    mov ebp, esp

    ; mov eax, [ebp+8] ; argument 1
    ; add eax, [esp+4] ; argument 2
    ; a
    fld dword[ebp+8]
    fst qword[result]

    ; b
    fld dword[ebp+12]
    fst qword[b]

    ; c
    fld dword[ebp+16]
    fst qword[c]

    ; push eax
    push dword[c+4]
    push dword[c]
    push dword[b+4]
    push dword[b]
    push dword[result+4]
    push dword[result]
    push format
    call printf
    add esp, 28

    mov esp, ebp
    pop ebp

    ret