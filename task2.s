

main:
li a0 , 5
jal ra,factorial_int
mv a1,a0
li a0,1
ecall 
ebreak
li a0,10
ecall


factorial_int:
    addi sp,sp,-4
    sw ra,0(sp)
    mv t0,a0
    addi t1,x0,1
    addi a0,x0,1
    loop: 
    bgt t1,t0,next
    mul a0,a0,t1
    addi t1,t1,1
    jal x0,loop
    next:
    lw ra,0(sp)
    addi sp,sp,4
    jalr x0,0(ra)

