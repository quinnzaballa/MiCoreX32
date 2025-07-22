;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): NO | LINKED TO 0-interpreter.asm
;; ================================================================
;; DATE OF CREATION (DOC) : 7/19/2025 | 7:46PM | GMT+08 | EVENT(S): N/A
;; ================================================================

[BITS 16]

.MOPT:
    ;; ──── CONVERSION ────────┐
    xor ax, ax
    lodsb
    ;; ════ SPLITTING ═╕
    rol ax, 4
    ror al, 4
    ;; ════════════════╛
    ;; ════ MSB|LSB-NIBBLE ═╕
    .MSB:
        cmp ah, 0xA
        jb short .MSB_DGT
        add ah, ('A' - 10)
        jmp short .LSB
        .MSB_DGT:
            add ah, '0'
    .LSB:
        cmp al, 0xA
        jb short .LSB_DGT
        add al, ('A' - 10)
        jmp short .ENDOCONV
        .LSB_DGT:
            add al, '0'
    .ENDOCONV:
    ;; ═════════════════════╛
    ;; ────────────────────────┘
    ;; ──── WRITE RESULT ─┐
    xchg ah, al
    stosw
    ;; ───────────────────┘    
    ;; ──── IS COUNT 0 ───┐
    loop .MOPT
    ;; Nothing to Clean.
    popa ;; Pop all and restore
    ret
    ;; ───────────────────┘  