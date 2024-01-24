.ORIG	x3000
    ; set last number of id
    ld r1, id_n        ; r1= 6,last number of id
    sti r1, id         ; [x3101] = 6
    ldi r2, n          ; r2 = n
    ; check odd
    and r0, r2, #1     ; check lsb
    brp is_odd 
    not r2, r2         ; not n
    add r2, r2, #1     ; 2' complement
is_odd
    ld r3, count       ; r3 = 16
    and r4, r4, #0     ; r4: result = 0
    ld r5, mask
loop
    and r0, r2, r5     ; checl msb
    brnp next
    add r4, r4, #1     ; result+1
next
    add r2, r2, r2     ; r2 = r2*2 means left shift 1 bit
    add r3, r3, #-1    ; count-1
    brp loop
    add r1, r1, r4     ; id+result
    sti r1, result
    trap  x25    ; halt
mask .fill x8000
count .FILL #16  ; count=16
id_n .FILL #6    ; last number of ID
n .FILL	x3100    ; n
id .FILL	x3101     ; address of last number
result .FILL	x3102 ; result
.END