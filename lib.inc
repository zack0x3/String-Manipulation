segment .data
write equ 0x4
read equ 0x3
return equ 0x0
sys_call equ 0x80
output equ 0x1
exit equ 0x1
n equ 0xA

section .data
buffer db "Zackl", n
size equ $-buffer

section .text
manipulation:
mov eax, write
mov ebx, output
mov ecx, buffer
mov edx, size
int sys_call
ret
