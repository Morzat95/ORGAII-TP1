rm resolvente.o main
nasm -f elf32 resolvente.asm -o resolvente.o
gcc -m32 resolvente.c resolvente.o -o main
./main