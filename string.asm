; Include my lib lib.inc
%include "lib.inc"

section .data
string db "Original : "
size_string equ $-string
string_mod db "Modification : "
size_mod equ $-string_mod

section .text
global _start
_start:

mov eax, write
mov ebx, output
mov ecx, string
mov edx, size_string
int sys_call

mov eax, write
mov ebx, output
mov ecx, buffer
mov edx, size
int sys_call

lea esi, [buffer]
add esi, 0x0
mov dl, 0x16
add dl, '0' 
mov [esi], dl

mov eax, write
mov ebx, output
mov ecx, string_mod
mov edx, size_mod
int sys_call

lea esi, [buffer]
add esi, 0x1
mov dl, 0x31
add dl, '0'
mov [esi], dl

call manipulation

mov eax, exit
mov ebx, return
int sys_call
