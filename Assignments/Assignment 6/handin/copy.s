.pos 0x100
start:
       ld $sb, r5 # init the stack
       gpc $6, r6 # r6 = ra
       j main
       halt
main:
    deca r5 # allocating space on stack for ra
    st r6, (r5) # store ra on stack
    gpc $6, r6 # r6 = ra
    j copy # j to main function
    ld (r5), r6 # restore ra
    inca r5 # deallocating ra
    j (r6) # return

copy: deca r5 # allocating for ra
      st r6, 0(r5) # storing ra
      deca r5 # allocating for dst[1]
      deca r5 # allocating for dst[0]
      ld $0, r0 # r0 = i
      ld $src, r1 # r1 = &src
loop: ld (r1,r0,4), r2 # r2 = src[i]
      beq r2, loop_end # if src[i] == 0, goto loop_end
      st r2, (r5,r0,4) # dst[i] = src[i]
      inc r0 # r0 = i++
      br loop # goto loop
loop_end: ld $0, r1
          st r1, (r5,r0,4) # dst[i] = 0
          inca r5 # deallocating stack
          inca r5 # deallocating stack
          ld 0(r5), r6 # restoring ra
          inca r5 # deallocating stack
          j (r6) # return










.pos 0x1000
src: .long 0x00000001
     .long 0x00000001
     .long 0x00001010
     .long 0x00000000


     .long 0xffff0000
     .long 0xffffffff
     .long 0x0000ffff
     .long 0xffff0100
     .long 0xffffffff
     .long 0x0200ffff
     .long 0xffff0300
     .long 0xffffffff
     .long 0x0400ffff
     .long 0xffff0500
     .long 0xffffffff
     .long 0x0600ffff
     .long 0xffff0700
     .long 0xffffffff
     .long 0xf0000000

.pos 0x8000
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0