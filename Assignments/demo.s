# main function definition
.pos 0x100
main:  ld $x, r2 # r2 = &x
       gpc $6, r6 # r6 = return address (address of the st instruction below)
       j foo # call foo()
       st r0, 0(r2) # foo returns to here, now r0 has the return value. so x = foo()
       ld $0, r0 # set return value of main to 0
       halt # main doesn't actually return to anyone

# foo function definition
.pos 0x200
foo:  ld $a, r0 # r0 = &a
      ld 0(r0), r0 # r0 = a
      ld $b, r1 # r1 = &b
      ld 0(r1), r1 # r1 = b
      add r1, r0 # r0 = a+b
      j 0(r6) # return to caller, uses value of r6 as target address

# static data area
.pos 0x1000
a:  .long 4
b:  .long 5
x:  .long 0