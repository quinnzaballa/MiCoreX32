;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): NO | LINKED TO 0-interpreter.asm
;; ================================================================
;; DATE OF CREATION (DOC) : 7/21/2025 | 4:16PM | GMT+08 | EVENT(S): Heavy-Rain
;; ================================================================

[BITS 16]

.MOPT:
    ;; ──── CONVERSION ──────┐
    .ASCII:
        xor ax, ax
        lodsb
        cmp al, byte 'A'
        jb short .DGT_ASCII
        sub al, byte ('A' - 10)
        jmp .ECONV
        .DGT_ASCII:
            sub al, byte '0'
        .ECONV:
    ;; ──────────────────────┘
    ;; ──── STORING AND LOOP ─┐
    .STO_LOOP:
        stosb
        loop .ASCII
        popa
        ret
    ;; ───────────────────────┘