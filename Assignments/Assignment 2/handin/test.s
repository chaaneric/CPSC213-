.pos 0x1000
.long 0xffffffff

.pos 0x1004
.long 0xffffffff

.pos 0x1008
.long 0xffffffff

ldi: ld $0x1000, r0 # r[0] <- 0x1000
 ld $0x1004, r1 # r[1] <- 0x1004

ldbo: ld 0x0(r0), r2 # r[2] <- m[4*0 + 0x1000]

sbo: ld $0x20, r3 # r[3] <- 0x20
     st r3, 0x0(r1) # m[0x1004] <- r[3] (32)

ldbo: ld 0x4(r0), r4 # r[4] <- m[4 * (4/4) + 0x1000]

ldi: ld (r1,r7,4), r5 # r[5] <- m[0x1004 + 4 * 0]

si: ld $0x1008, r6 # r[6] <- 0x1008
    st r1, (r6,r7,4) # m[0x1008] <- r[1]




rm: mov r2,r1 # r[1] <- r[2]

add: add r3,r4 # r[4] <- r[3] + r[4]

and: and r5,r3 # r[3] <- r[5] & r[3] UNSUCCESSFUL

and: and r4,r5 # r[5] <- r[4] & r[5] ONLY ONE BIT SUCCESSFUL

inc: inc r2 # r[2] <- r[2] + 1 // (0)

incaAd: inca r3 # r[3] <- r[3] + 4

dec: dec r2 # r[2] <- r[2] - 1 // (-1)

deca: deca r3 # r[3] <- r[3] - 4

not: not r1 # r[1] <- ~r[1] (-1 turns to 0 flips all bits)

ld $0x1, r0 # r[0] <- 0x1 (setting up shift)

shr: shl $0x1, r0 # r[0] <- r[0] << 1 (becomes two)

shl: shr $0x1, r0 # r[0] <- r[0] >> 1 (becomes one)

halt