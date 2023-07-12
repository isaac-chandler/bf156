BITS 32

org 0x00200000
db 0x7f, "ELF"
dd 1
dd 0
dd $$
dw 2
dw 3
dd _start
dd _start
dd 4

down:
dec byte [ecx]
_ret:
ret

out:
lea eax, [ebp+4]
jmp sys

dw 0x34
dw 0x20
dw 1

_start:

pop esi
pop esi
pop esi

db 0x81, 0xec
right:
inc ecx
ret
dw 0
mov ecx, esp

insn:
push insn

xor ebx, ebx
inc ebx
mov edx, ebx
xor ebp, ebp

lodsb

cmp al, '['
je fwd
cmp al, ']'
je back
cmp al, '>'
je right
cmp al, '<'
je left
cmp al, '+'
je up
cmp al, '-'
je down
cmp al, '.'
je out
cmp al, ','
je in
test al, al
jne _ret

mov eax, ebx
sys:
int 0x80
ret

left:
dec ecx
ret

up:
inc byte [ecx]
ret

in:
lea eax, [ebp+3]
jmp sys

fwd:
cmp byte [ecx], bh
jnz _ret
inc ebp
fwdloop:
lodsb
cmp al, '['
jne fwd2
add ebp, ebx
jnz fwdloop
dir:
cld
inc esi
ret

fwd2:
cmp al, ']'
jne fwdloop
sub ebp, ebx
jnz fwdloop

back:
cmp byte [ecx], bh
jz _ret
dec esi
std
neg ebx
jmp fwdloop