;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): NO | LINKED TO 0-interpreter.asm
;; ================================================================
;; DATE OF CREATION (DOC) : 7/22/2025 | 11:37PM | GMT+08 | EVENT(S): Heavy-Rain (STILL)
;; ================================================================

[BITS 16]

.MOPT:
    ;; ──── Load Data ─┐
    xor ax, ax
    lodsw
    xchg al, ah
    ;; ────────────────┘
    ;; ──── CONVERSION ───────────────────────┐
    ;; ════ MSB|LSB-Nibble ════╕
    .MSB:
        cmp ah, byte 'A'
        jb short .MSB_DGT
        sub ah, byte 0x31
        jmp short .MSB_EXIT
        .MSB_DGT:
            sub ah, byte '0'
    .MSB_EXIT:
    .LSB:
        cmp ah, byte 'A'
        jb short .LSB_DGT
        sub ah, byte 0x31
        jmp short .LSB_EXIT
        .LSB_DGT:
            sub ah, byte '0'
    .LSB_EXIT:     
    ;; ════════════════════════╛
    ;; ───────────────────────────────────────┘
    ;; ──── Storing Result ──┐
    rol ah, byte 4
    or al, ah
    stosb
    ;; ──────────────────────┘
    ;; ──── LOOP CHECK ──┐
    loop .MOPT
    popa
    ret
    ;; ──────────────────┘