.pos 0x100

# c = 5
ld $5, r0 # r0 = 5
ld $c, r1 # r1 = address of c
st r0, 0(r1)

# b = c + 10
ld $c, r0 # r0 = address of c
ld 0(r0), r0 # r1 = c
ld $10, r1 # r1 = 10
add r1, r0 # r0 = c + 10
ld $b, r1 # r1 = address of b
st r0, 0(r1) # b = c + 10

# a[8] = 8;
ld $a, r0 # r0 = address of a
ld $8, r1 # r1 = 8
st r1, (r0,r1,4) # a[8] = 8

# a[4] = a[4] + 4
ld $a, r0 # r0 = address of a
ld 16(r0), r1 # r1 = a[4]
inca r1 # r1 = a[4] + 4
st r1, 16(r0) # a[4] = a[4] + 4

# a[c] = a[8] + b + a[b & 0x7]
ld $b, r0 # r0 = address of b
ld 0(r0), r0 # r0 = b
mov r0, r1 # r1 = r0 (value of b)
ld $0x7, r2 # r1 = 0x7
and r2, r1 # r1 = b & 0x7

ld $a, r2 # r2 = address of a
ld (r2,r1,4), r1 # r1 = a[b & 0x7]
add r1, r0 # r0 = b + a[b & 0x7]

ld 32(r2), r3 # r3 = a[8]
add r0, r3 # r3 = a[8] + b + a[b & 0x7]

ld $c, r0 # r0 = c
ld 0(r0), r0 # r0 = value of c
st r3, (r2,r0,4) # a[c] = ...

halt




.pos 0x200

b: .long 0 # b

c: .long 0 # c

a: .long 0 # a[0]
   .long 0 # a[1]
   .long 0 # a[2]
   .long 0 # a[3]
   .long 0 # a[4]
   .long 0 # a[5]
   .long 0 # a[6]
   .long 0 # a[7]
   .long 0 # a[8]
   .long 0 # a[9]




