.pos 0x0
                 ld   $sb, r5 # intializing the stack
                 inca r5
                 gpc  $6, r6   # r6 = return address
                 j    0x300             
                 halt                     
.pos 0x100
                .long 0x00001000 # s
.pos 0x200 # b
                 ld   0x0(r5), r0 # r0 = a1
                 ld   0x4(r5), r1 # r1 = a0
                 ld   $0x100, r2  # r2 = &s (pointer)
                 ld   0x0(r2), r2  # r2 = c = c[0]
                 ld   (r2, r1, 4), r3  # r3 = c[a0]
                 add  r3, r0 # r0 = a3 = c[a0] + a1
                 st   r0, (r2, r1, 4) # c[a0] = c[a0] + a1
                 j    0x0(r6) # return
.pos 0x300 # foo
                 ld   $0xfffffff4, r0 # r0 = -12
                 add  r0, r5  # r5 = allocating portion of stack (12 bytes)
                 st   r6, 0x8(r5)  # r5 = ra stored onto stack
                 ld   $0x1, r0 # r0 = 1 = a2
                 st   r0, 0x0(r5) # storing a onto the stack
                 ld   $0x2, r0 # r0 = 2 = a3
                 st   r0, 0x4(r5) # storing b onto the stack
                 ld   $0xfffffff8, r0 # r0 = -8
                 add  r0, r5 # allocating portion of b's stack (8 bytes)
                 ld   $0x3, r0 # r0 = 3 = a1
                 st   r0, 0x0(r5) # store value of a1 to stack
                 ld   $0x4, r0 # r0 = 4 = a0
                 st   r0, 0x4(r5) # store value of a0 to stack
                 gpc  $6, r6 # r6 = return address
                 j    0x200 # b(a0, a1)
                 ld   $0x8, r0 # r0 = 8
                 add  r0, r5  # deallocating 8 bytes from b's stack
                 ld   0x0(r5), r1 # r1 = a2
                 ld   0x4(r5), r2 # r2 = a3
                 ld   $0xfffffff8, r0  # r0 = -8
                 add  r0, r5 # allocating 8 bytes on b's stack
                 st   r1, 0x0(r5) # store a2 into stack
                 st   r2, 0x4(r5) # store a3 into stack
                 gpc  $6, r6 # save return address
                 j    0x200 # b(a2,a3)
                 ld   $0x8, r0  # r0 = 8
                 add  r0, r5 # deallocating caller 8 bytes from b's stack
                 ld   0x8(r5), r6 # r6 = return address
                 ld   $0xc, r0 # r0 = 12
                 add  r0, r5 # deallocating callee part of foo's frame
                 j    0x0(r6)             
.pos 0x1000
                 .long 0x00000000 # c[0]
                 .long 0x00000000 # c[1]
                 .long 0x00000000 # c[2]
                 .long 0x00000000 # c[3]
                 .long 0x00000000 # c[4]
                 .long 0x00000000 # c[5]
                 .long 0x00000000 # c[6]
                 .long 0x00000000 # c[7]
                 .long 0x00000000 # c[8]
                 .long 0x00000000 # c[9]
.pos 0x8000
# These are here so you can see (some of) the stack contents.
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
