;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): YES
;; ================================================================
;; DATE OF CREATION (DOC) : 7/16/2025 | 11:18PM | GMT+08 | EVENT(S): My Birthday X3 (Just turned 18)
;; ================================================================

INTERPRETER_START:

;; ──── BUILD OPTIONS ─┐
[ORG 0x0000]
[BITS 16]
;; ────────────────────┘
;; ──── PASS CHECK(1) ───────────────────┐
PASS_CHK_1:
    pusha
    cmp ah, byte 0x00
    je short OPTION
    ;; ASCII SCAN
    SCAN_ASCII:
        .DGT:
            lodsb
            cmp al, byte '9'
            ja  short .ASCII
        ;; VALIDATE ASCII 0-9
            cmp al, byte '0'
            jb SCAN_FAIL
            loop .DGT
            jmp .EXIT
        .ASCII:
            cmp al, byte 'A'
            jb short SCAN_FAIL
            cmp al, byte 'F'
            ja short SCAN_FAIL
            loop .DGT
        .EXIT: jmp short OPTION
;; ════ ERRORS ═════════════════════╕
SCAN_FAIL:
    mov word [TEMP_DATA0], cx
    popa
    mov cx, word [TEMP_DATA0]
    mov ah, 0x0F
    ret
;; ═════════════════════════════════╛
;; ──────────────────────────────────────┘
;; ──── OPTIONS ─────────────┐
OPTION:
    popa
    ;; VALIDATION (SIMPLE)
    cmp ah, byte 0x02
    ja short .OPTNOTAV
    jmp near ENDOC
    ;; OPTION NOT AVAILABLE
    .OPTNOTAV:
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
ENDOC:
;; ────────────────────────┘

HxNT:
%include "./1-HxNT.asm"
TIMES 511 - ($ - HxNT) nop
hlt