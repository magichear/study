.ORIG x3000
    LDI R0, N_ADRESS ; Load the value of N from memory location x3102 into R0
    LD R7, MAX_VALUE ; Load the MAX value
    LD R6, MAX_VALUE_N ; Load the Negative MAX value

    AND R1, R1, #0   ; Clear R1
    AND R2, R2, #0   ; Clear R2
    ADD R1, R1, #3   ; Set the value of v_1 into R1
    ADD R2, R2, #1   ; Set the value of d_1 into R2

    ADD R0, R0, #-1  ; When N = 1
    BRz END          ; Finish
    BRp POSITIVE     ; N > 1

NEGATIVE
    ADD R1, R1, R1   ; v_next = 2 * v_n
    ADD R1, R1, #-2  ; v_next = v_next - 2
    BRnzp CHECK_MAX  ; Branch to CHECK_MAX

POSITIVE
    ADD R1, R1, R1   ; v_next = 2 * v_n
    ADD R1, R1, #2   ; v_next = v_next + 2
    BRnzp CHECK_MAX  ; Check if R1 is in normal range

; ---------------------------------------------------------------------
CHECK
    ADD R0, R0, #-1  ; N = N - 1      An operation was done
    BRz END          ; Finish

    AND R3, R3, #0   ; Clear R3
    ADD R3, R1, #0   ; Copy v_next to R3
    ADD R4, R2, #0   ; Copy d_next to R4
    BRnzp MODULO
; ----------------------------------------------------------------------
; Faster R3 mod operation
MODULO
    LD R5, A_THOUSAND ; R5 <- -1000
    BRn MODULO_AT     ; while(R3 - 1000)

; R3 mod 1000
MODULO_AT
    ADD R3, R3, R5     ; R3 = R3 - 1000
    BRn AT_ADD
    BRp MODULO_AT      ; Branch back to MODULO_AT    Loop
    BRz D_MODULO_DIGIT ; R3 = #1000

; R3 + 1000
AT_ADD
    NOT R5, R5         ; Flip the bits of R5
    ADD R5, R5, #1     ; Add 1 to get the logical NOT of R5
    ADD R3, R3, R5     ; R3 = R3 + 1000
    LD R5, A_HUNDRED   ; R5 <- -100
    BRp MODULO_AH


; R3 mod 100
MODULO_AH
    ADD R3, R3, R5    ; R3 = R3 - 100
    BRn AH_ADD
    BRp MODULO_AH     ; Branch back to MODULO_AH    Loop
    BRz D_MODULO_DIGIT      ; R3 = #100

; R3 + 100
AH_ADD
    NOT R5, R5         ; Flip the bits of R5
    ADD R5, R5, #1     ; Add 1 to get the logical NOT of R5
    ADD R3, R3, R5     ; R3 = R3 + 100
    BRp MODULO_TEN

; R3 mod 10
MODULO_TEN
    ADD R3, R3, #-10     ; R3 = R3 - 10
    BRp MODULO_TEN       ; Branch back to MODULO_TEN    Loop
    BRnz D_MODULO_DIGIT  ; R3 = #8 || #10

; Check the remainder
D_MODULO_DIGIT
    ADD R3, R3, #2   ; R3 stores the remainder now
                     ; Check if the remainder is 8
    BRz FLIP

    AND R3, R3, #0     ; Clear R3
    ADD R3, R1, #0     ; R3 = R1
    LD R5, CODE_MONKEY ; R5 <- -1024
    BRn MODULO_CM      ; while(R3 - 1024)

; ------------------------------------------------------------------------
; R3 mod 1024
MODULO_CM
    ADD R3, R3, R5    ; R3 = R3 - 1024
    BRn CM_ADD
    BRp MODULO_CM     ; Branch back to MODULO_CM    Loop
    BRz D_MODULO      ; R3 = #1024

; R3 + 1024
CM_ADD
    NOT R5, R5         ; Flip the bits of R5
    ADD R5, R5, #1     ; Add 1 to get the logical NOT of R5
    ADD R3, R3, R5     ; R3 = R3 + 1024
    LD R5, YAO_ER_BA   ; R5 <- -128
    BRp MODULO_YEB


; R3 mod 128
MODULO_YEB
    ADD R3, R3, R5    ; R3 = R3 - 128
    BRn YEB_ADD
    BRp MODULO_YEB    ; Branch back to MODULO_YEB    Loop
    BRz D_MODULO      ; R3 = #128

; R3 + 128
YEB_ADD
    NOT R5, R5         ; Flip the bits of R5
    ADD R5, R5, #1     ; Add 1 to get the logical NOT of R5
    ADD R3, R3, R5     ; R3 = R3 + 128
    BRp MODULO_EIGHT

; R3 mod 8
MODULO_EIGHT
    ADD R3, R3, #-8   ; R3 = R3 - 8
    BRp MODULO_EIGHT  ; Branch back to MODULO_EIGHT  Loop
    ADD R3, R3, #-2   ; R3 = R3 - 2     When R3 is 0, Set it to -2
    BRnz D_MODULO     ; R3 <= #8

; ------------------------------------------------------------------------

; Check the remainder
D_MODULO
    ADD R3, R3, #2   ; R3 stores the remainder now
                     ; Check if the remainder is 8
    BRz FLIP

    ADD R2, R2, #0   ; Check the flip flag d_n
    BRp POSITIVE
    BRn NEGATIVE

; ------------------------------------------------------------------------
; Check if R1 is in normal range
CHECK_MAX
    ADD R1, R1, R6
    BRp CHECK_MAX
    BRz CHECK
    BRn MAX_ADD

; Add R1 to normal range
MAX_ADD
    ADD R1, R1, R7
    BRp CHECK
; --------------------------------------------------------------------------

FLIP
    NOT R2, R2       ; Flip the bits of d_n
    ADD R2, R2, #1   ; Add 1 to get the logical NOT of d_n
    BRp POSITIVE
    BRn NEGATIVE

END
    STI R1, RESULT   ; Store the value of v_next in memory location x3103
    TRAP x25         ; HALT


MAX_VALUE   .FILL #4096
MAX_VALUE_N .FILL #-4096
A_THOUSAND  .FILL #-1000
A_HUNDRED   .FILL #-100
CODE_MONKEY .FILL #-1024
YAO_ER_BA   .FILL #-128
N_ADRESS    .FILL x3102 ; Memory location for N
RESULT      .FILL x3103   ; Memory location for result

.END