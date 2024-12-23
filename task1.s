.data
array: .word 1,2,3,4,5,6,7,8,9

.text

main:
    la a0, array
    li a1, 9

    jal ra,sumArray

    mv a1,a0
    li a0,1

    ecall
    ebreak
    li a0, 10

    ecall


sumArray:
    addi sp,sp,-4
    sw ra,0(sp)
    add t1,x0,x0
    mv t0,a0
    add a0,x0,x0
    loop:
        bge t1,a1,finised
            slli t2,t1,2
            add t2,t2,t0
            lw t3,0(t2)
            add a0,a0,t3
            addi t1,t1,1
        j loop
    finised:
    lw ra,0(sp)
    addi sp,sp, 4
    jalr x0,0(ra)
    


