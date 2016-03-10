.pos 0x1000
code:
# v = s.x[i]
ld $v, r0 # r0 = &v
ld $s, r1 # r1 = &s
ld $i, r2 # r2 = &i

ld 0x0(r2), r2 # r2 = i
ld (r1,r2,4), r1 # r1 = s.x[i]

st r1, 0(r0) # v = s.x[i]

# v = s.y[i]
ld $v, r0 # r0 = &v
ld $s, r1 # r1 = &s
ld $i, r2 # r2 = &i
ld 0x0(r2), r2 # r2 = i
ld 0x8(r1), r1 # r1 = s. &y
ld (r1,r2,4), r1 # r1 = s.y[i]
st r1, 0(r0) # v = s.y[i]


# v = s.z->x[i]
ld $v, r0 # r0 = &v
ld $s, r1 # r1 = &s
ld $i, r2 # r2 = &i
ld 0(r2), r2 # r2 = i

ld 0x0c(r1), r1 # r1 = s.&z
ld 0(r1), r1 # r1 = s.z
ld (r1,r2,4), r1 # r1 = s.z->y[i]

st r1, 0(r0) # v = s.z->y[i]

halt

.pos 0x2000
static:
i: .long 0
v: .long 0
s: .long 0 # x[0]
   .long 0 # x[1]
   .long 0x3000 # y (pointer)
   .long 0x3008 # z

.pos 0x3000
heap0: .long 0 # y[0]
       .long 0 # y[1]
       .long 0x300c # z (pointer)
heap1: .long 0 # s.z->y[0]
       .long 0 # s.z->y[1]
       .long 0 # s.z->z
