;; This would restart the platform. Cold-Reboot...
[ORG 0x7C00]
[BITS 16]

cli
xor ax, ax
mov al, byte 0xE
mov dx, word 0xCF9
out dx, al
hlt