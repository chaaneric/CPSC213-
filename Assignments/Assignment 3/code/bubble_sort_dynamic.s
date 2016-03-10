.pos 0x100


# t = val[i]
ld $t, r0 # r0 = &t
ld $val, r1 # r1 = &val
ld 0(r1), r1 # r1 = val
ld $i, r2 # r2 = &i
ld 0(r2), r2 # r2 = i
ld (r1,r2,4), r1 # r1 = val[i]
st r1, 0(r0) # t = val[i]


# val[i] = val[j]
ld $val, r0 # r0 = &val
ld 0(r0), r0 # r0 = val
ld $i, r1 # r1 = &i
ld 0(r1), r1 # r1 = i
ld $j, r2 # r2 = &j
ld 0(r2), r2 # r2 = j
ld (r0,r2,4), r2 # r2 = val[j]
st r2, (r0,r1,4) # val[i] = val[j]

# val[j] = t
ld $t, r0 # r0 = &t
ld 0(r0), r0 # r0 = t
ld $val, r1 # r0 = &val
ld 0(r1), r1 # r0 = val
ld $j, r2 # r2 = &j
ld 0(r2), r2 # r2 = j
st r0, (r1,r2,4) # val[j] = t



halt




.pos 0x200
i: .long 3 # i
j: .long 2 # j
val: .long c # val
t: .long 5 # t
c: .long 2 # c[0]
   .long 3 # c[1]
   .long 5 # c[2]
   .long 6 # c[3]
   .long 7 # c[4]
   .long 9 # c[5]

