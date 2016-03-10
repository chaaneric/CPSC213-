.pos 0x100
        ld $0, r0 # temp_i = 0
        ld $a, r1 # r1 = a
        ld $-4, r3 # r3 = -4
        ld $0, r4 # r4 = 0
loop:   mov r0, r2 # r2 = temp_i
        add r3, r2 # r2 = temp_i - 4
        beq r2, end # if r2 = end goto end
        br cont # goto cont
cont:   ld (r1,r0,4), r5 # r5 = a[temp_i]
        add r5, r4 # r4 = r4 + r1
        inc r0 # r0 = temp_i ++
        br loop
end: ld $s, r6 # r6 = &s
     gpc $6, r7 # storing address
     j test
     ld $a, r2
test: halt

















# static area
.pos 0x1000
s: .long 0 # s
a: .long 2 # a[0]
   .long 4 # a[1]
   .long 5 # a[2]
   .long 6 # a[3]
