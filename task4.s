


main:

    li a0,5
    jal ra,factorial_int
    mv a1,a0
    li a0,1
    ecall
    li a0,10
    ecall


factorial_int:
    addi sp,sp,-8
    sw s0, 4(sp)
    ##sw a0, 4(sp)
    sw ra, 0(sp)
    li t0,1
    bgt a0,t0,else
    li a0,1
    j epilouge
    else:
    mv s0,a0
    addi a0,a0,-1
    jal ra,factorial_int
    mul a0,a0,s0
epilouge:
    lw s0, 4(sp)
    #lw a0, 4(sp)
    lw ra, 0(sp)
    addi sp,sp,8
    jr ra
