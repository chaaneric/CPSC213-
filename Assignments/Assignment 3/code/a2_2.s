.pos 0x100

# a[i] = a[i+1] + b[i+2]

ld $i, r0 # r0 = address of i
ld 0(r0), r0 # r0 = i
inc r0 # r0 = i + 1
ld $a, r1 # r1 = a
ld (r1,r0,4), r1 # r0 = a[i+1]

inc r0 # r0 = i + 2
ld $b, r2 # r2 = b
ld (r2,r0,4),r2 # r2 = b[i+2]

add r2,r1 # r1 = a[i+1] + b[i+2]

ld $i, r0 # r0 = address of i
ld 0(r0), r0 # r0 = value of i
ld $a, r2 # r2 = address of a
st r1, (r2,r0,4) # a[i] = a[i+1] + b[i+2]

# d[i] = a[i] + b[i]

ld $i, r0 # r0 = address of i
ld 0(r0), r0 # r0 = value of i
ld $a, r1 # r1 = address of a
ld $b, r2 # r2 = address of b
ld $d, r3 # r3 = address of d
ld 0(r3), r3 # value of d

ld (r1,r0,4), r1 # r1 = a[i]
ld (r2,r0,4), r2 # r2 = b[i]

add r2,r1 # a[i] + b[i]

st r1, (r3,r0,4) # d[i] = a[i] + b[i]

#  d[i] = a[b[i]] + b[a[i]];

ld $i, r0 # r0 = &i
ld 0(r0), r0 # r0 = i

ld $a, r1 # r1 = &a

ld $b, r2 # r2 = &b

ld (r1,r0,4), r3 # r3 = a[i]
ld (r2,r0,4), r4 # r4 = b[i]

ld (r1,r4,4), r1 # r1 = a[b[i]]
ld (r2,r3,4), r2 # r2 = b[a[i]]

add r2, r1 # r1 = a[b[i]] + b[a[i]]

ld $d, r2 # r2 = &d
ld 0(r2), r2 # r2 = d
st r1 ,(r2,r0,4) # d[i] = a[b[i]] + b[a[i]]


#  d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i];


# RETRIEVING
ld $i, r0 # r0 = address of i
ld 0(r0), r0 # r0 = value of i
ld $3, r1 # r1 = 3
ld $a, r2 # r2 = a
ld $b, r3 # r3 = b
ld $d, r4 # r4 = d
ld 0(r4), r4 # value of d

# COMPUTATION

# b[a[i & 3] & 3]
mov r2, r5 # r5 = a
mov r0, r6 # r6 = i
and r1, r6 # r6 = i & 3
ld (r5,r6,4), r5 # r5 = a[i & 3]
and r1,r5 # r5 = a[i & 3] & 3
ld (r3,r5,4), r5 # r5 = b[a[i & 3] & 3]

# a[b[i & 3] & 3]
ld (r3,r6,4), r6 # r6 = b[i & 3]
and r1,r6 # r6 = b[i & 3] & 3
ld (r2,r6,4), r6 # r6 = a[b[i & 3] & 3]
not r6 # r6 = ~a[b[i & 3] & 3]
inc r6 # r6 = -a[b[i & 3] & 3]



# b[a[i & 3] & 3] -a[b[i & 3] & 3] + d[i]
add r6,r5 # r5 = b[a[i & 3] & 3] -a[b[i & 3] & 3]
ld (r4,r0,4), r6 # r6 = d[i]
add r6, r5 # r5 = ...

ld (r3,r0,4), r6 # r6 = b[i]

st r5, (r4,r6,4) # d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i];



halt

.pos 0x200

a: .long 0 # a[0]
   .long 11 # a[1]
   .long 2 # a[2]
   .long 0 # a[3]
   .long 1 # a[4]
   .long 2 # a[5]
   .long 0 # a[6]
   .long 1 # a[7]

b: .long 2 # b[0]
   .long 12 # b[1]
   .long 0 # b[2]
   .long 2 # b[3]
   .long 1 # b[4]
   .long 0 # b[5]
   .long 2 # b[6]
   .long 1 # b[7]

c: .long 99 # c[0]
   .long 6 # c[1]
   .long 2 # c[2]
   .long 1 # c[3]
   .long 0 # c[4]
   .long 2 # c[5]
   .long 1 # c[6]
   .long 0 # c[7]

i: .long 5 # i

d: .long c # d