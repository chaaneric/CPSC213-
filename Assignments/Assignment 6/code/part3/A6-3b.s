.pos 0x100
start:
    ld $sb, r5 # intializing the stack
    inca    r5 # init stack
    gpc $6, r6 # r6 = ra
    j main # j to main function
    halt

f:
    deca r5 # allocating 4 bytes of stack for f's local variable
    ld $0, r0 # r0 = i
    ld 4(r5), r1 # r1 = x[a] = a0
    ld $0x80000000, r2 # r2 = -2147483648
f_loop:
    beq r1, f_end # if a0 = 0 goto f_end
    mov r1, r3 # r3 = a0_temp
    and r2, r3 # r3 = a0_temp & -2147483648
    beq r3, f_if1 # if r3 = 0, goto f_if1
    inc r0 # r0 = i++
f_if1:
    shl $1, r1 # a0 = a0 << 1
    br f_loop # br f_loop
f_end:
    inca r5 # r5 = deallocating f's local variable
    j(r6) # return

main:
    deca r5 # allocating 4 bytes of stack
    deca r5 # allocating 4 bytes of stack
    st r6, 4(r5) # store ra to stack
    ld $8, r4 # r4 = a = 8
main_loop:
    beq r4, main_end # if a == 0 goto main_end
    dec r4 # r4 = a--
    ld $x, r0 # r0 = &x
    ld (r0,r4,4), r0 # r0 = x[a]
    deca r5 # allocating 4 byte of stack
    st r0, (r5) # r5 = x[a] = a0
    gpc $6, r6 # r6 = ra
    j f # f(a0)
    inca r5 # deallocating stack
    ld $y, r1 # r1 = &y
    st r0, (r1,r4,4) # y[a] = i
    br main_loop # goto main_loop
main_end:
    ld 4(r5), r6 # r6 = ra
    inca r5 # deallocating main stack
    inca r5 # deallocating main stack
    j (r6) # return

.pos 0x2000
x:
    .long 1
    .long 2
    .long 3
    .long 0xffffffff
    .long 0xfffffffe
    .long 0
    .long 184
    .long 340057058

y:
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0

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

