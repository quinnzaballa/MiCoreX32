;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): YES
;; ================================================================
;; DATE OF CREATION (DOC) : 7/16/2025 | 11:18PM | GMT+08 | EVENT(S): My Birthday X3 (Just turned 18)
;; ================================================================

.TEST_CODE:
    mov cx, word 2
    mov ax, word DATA_0
    mov si, ax
    mov ax, word DATA_1
    mov di, ax
    mov ah, byte 1
    call near INTERPRETER_START

hlt
align 16
;; DATA
DATA_0 db '0', '2'
align 16
DATA_1 times 2 dw 0
align 16
INTERPRETER_START:

;; ──── BUILD OPTIONS ─┐
[ORG 0x0000]
[BITS 16]
;; ────────────────────┘
;; ──── PASS CHECK(1) ───────────────────┐
.PASS_CHK_1:
    pusha
    test cx, cx
    jz short .CINV
    cmp ah, byte 0x00
    je short .OPTION
    ;; ASCII SCAN
    .SCAN_ASCII:
        .DGT:
            lodsb
            cmp al, byte '9'
            ja  short .ASCII
        ;; VALIDATE ASCII 0-9
            cmp al, byte '0'
            jb .SCAN_FAIL
            loop .DGT
            jmp .EXIT
        .ASCII:
            cmp al, byte 'A'
            jb short .SCAN_FAIL
            cmp al, byte 'F'
            ja short .SCAN_FAIL
            loop .DGT
        .EXIT: jmp short .OPTION
;; ════ ERRORS ═════════════════════╕
.SCAN_FAIL:
    mov word [TEMP_DATA0], cx
    popa
    mov cx, word [TEMP_DATA0]
    mov ah, byte 0x0F
    ret
.CINV:   ;; COUNT INVALID
    popa
    mov ah, byte 0x1F
    ret
;; ═════════════════════════════════╛
;; ──────────────────────────────────────┘
;; ──── OPTIONS ─────────────┐
.OPTION:
    popa
    pusha
    ;; VALIDATION (SIMPLE)
    cmp ah, byte 0x02
    ja short .OPTNOTAV
    jmp near ENDOC_0
    ;; OPTION NOT AVAILABLE
    .OPTNOTAV:
        popa
        mov ah, byte 0x0E
        ret
;; ──────────────────────────┘
align 16
;; ──── TEMP_DATA ─┐
TEMP_DATA0 dw 0
;; ────────────────┘
align 16
;; ──── PADDING ───────────┐
TIMES 511 - ($ - $$) nop
hlt
ENDOC_0:
;; ────────────────────────┘

HxNT:
    cmp ah, byte 0x00
    jne near .NMOPT
    %include "./1-HxNT.asm"
    TIMES 511 - ($ - HxNT) nop
    hlt
.NMOPT:

THx:
    cmp ah, byte 0x01
    jne near .NMOPT1
    %include "./2-THx.asm"
    times 511 - ($ - THx) nop
    hlt
.NMOPT1:

TNHx:
    %include "./3-TNHx.asm"
    times 511 - ($ - TNHx) nop
    hlt