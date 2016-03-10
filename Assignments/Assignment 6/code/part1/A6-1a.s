.pos 0x100

      ld $0x0, r0 # r0 = temp_i = 0
      ld $-5, r1 # r1 = -5
      ld $a, r2 # r2 = address of a[0]
      ld $0, r5 # r5 = temp_s
      ld $s, r6 # r6 = &s
loop: mov r0, r3 # r3 = temp_i
      add r1, r3 # r3 = temp_i - 5
      beq r3, end_loop # if temp_i = 5 goto ____
cond: ld (r2,r0,4), r4 # r4 = a[temp_i]
      bgt r4, then # if a[temp_i] > 0 goto +2
else: br end_if # goto +4
then: add r4, r5 # r5 = s + a[temp_i]
      br end_if # goto +2
end_if: inc r0 # r0 = temp_i++
        br loop
end_loop: st r5, 0(r6)
          halt


.pos 0x1000
i: .long 10 # i
a: .long 10 # a[0]
   .long 0xFFFFFFE2 # a[1]
   .long 0xFFFFFFF4 # a[2]
   .long 4 # a[3]
   .long 8 # a[4]
s: .long 0 # s

