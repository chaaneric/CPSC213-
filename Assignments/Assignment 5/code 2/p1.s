.pos 0x1000
    ld $s, r0      #
    ld (r0), r0    #
    ld (r0), r1    #
    ld 4(r0), r2   #
    ld 4(r1), r3   #
    st r3, (r2)    #
    ld 4(r2), r3   #
    st r3, (r1)    #
    halt                     

.pos 0x2000
s:  .long d0
# END OF STATIC ALLOCATION

# DYNAMICALLY ALLOCATED HEAP SNAPSHOT
# (malloc'ed and dynamically initialized in c version)
d0: .long d1
    .long d2
d1: .long 1
    .long 2
d2: .long 3
    .long 4
