[BITS 16]
[ORG 0x7C00]

cli
cld

;; 80x25
mov ax, word 0x0003
int byte 0x10

mov ax, word 0xB800
mov es, ax
xor di, di
mov ax, word DATA_1
ROR ax, 4
mov ds, ax
xor si, si
mov cx, word 12
mov al, 0x7

.LOOP_1:
    movsb
    stosb
    loop .LOOP_1

hlt
align 16
DATA_1 db "HELLO WORLD!"