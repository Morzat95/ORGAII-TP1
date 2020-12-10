base_file_name=suma_vector
file_object=$base_file_name.o
file_asm=$base_file_name.asm
file_c=$base_file_name.c
file_executable=main

sudo nasm -f elf32 $file_asm -o $file_object
sudo gcc -m32 $file_c $file_object -o $file_executable
./$file_executable
sudo rm $file_executable $file_object