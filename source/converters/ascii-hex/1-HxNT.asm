;; ================================================================
;; Author : Quinn Matthew C. Zaballa
;; LICENSE : MIT LICENSE
;; Function type : Converters | ASCII-Hex
;; Name : ASCII-Hex
;; Adaptable(?): NO | LINKED TO 0-interpreter.asm
;; ================================================================
;; DATE OF CREATION (DOC) : 7/19/2025 | 7:46PM | GMT+08 | EVENT(S): N/A
;; ================================================================

cmp ah, 0x00
je short .MOPT
ja short .NMOPT
.MOPT:
    nop
    hlt
.NMOPT:
