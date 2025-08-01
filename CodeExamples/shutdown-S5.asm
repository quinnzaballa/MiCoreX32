;; This would shutdown the computer using Sleep TYPa. S5-Soft Shutdown is a software shutdown.
;; Software Shutdown (S5) is a request shutdown by the code logic...

[ORG 0x7C00]    ;; Boot Origin
[BITS 16]       ;; Run on Real_Mode

;; Define(s)
%DEFINE CSAM_CFG_ADDR   word 0xCF8      ;;  Configuration Space Access Mechanism #1 -- CONFIG_ADDRESS
%DEFINE CSAM_CFG_DATA   word 0xCFC      ;;  Configuration Space Access Mechanism #1 -- CONFIG_DATA

;; --------------

SECTION .text
;; SECTION (TEXT)

;; DISABLE INTR
cli

;; SET SEGMENT REG TO 0x0000
xor ax, ax
mov ds, ax
mov es, ax

;; ENABLE ACPI_PM
mov eax, dword [_CSAM_ACPI_CNTL_LPC]
mov dx, word CSAM_CFG_ADDR
out dx, eax

xor ax, ax
mov dx, word CSAM_CFG_DATA
in al, dx

or al, byte (1 << 7)
out dx, al

;; GET PMBASE
mov eax, dword [_CSAM_PMBASE_LPC]
mov dx, word CSAM_CFG_ADDR
out dx, eax

mov dx, word CSAM_CFG_DATA
xor ax, ax
in ax, dx

and ax, word 0xFF80

mov word [_PMBASE], ax

;; Trying to Shutdown.
xor ax, ax
mov dx, word [_PMBASE]
add dx, byte 0x4

in ax, dx
or ax, (1 << 13) | (7 << 10)
out dx, ax

hlt

;; SECTION (TEXT)

;; --------------

ALIGN.DATA: ALIGN 16
SECTION .data
;; SECTION (DATA)

_CSAM_PMBASE_LPC dd (1 << 31) | (0 << 24) | (0 << 16) | (31 << 11) | (0 << 8) | (0x40)
_CSAM_ACPI_CNTL_LPC dd (1 << 31) | (0 << 24) | (0 << 16) | (31 << 11) | (0 << 8) | (0x44)
_PMBASE dw 0
ALIGN 16

_TXT1 db "PMBASE: "
_IO_DATA dw 0

;; SECTION (DATA)