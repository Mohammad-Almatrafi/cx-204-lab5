
main:

li a0,14
jal ra,fibbonacci_int
mv a1,a0
li a0,1
ecall
ebreak
li a0,10
ecall


fibbonacci_int:
    addi sp,sp,-20
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw s3, 16(sp)
    mv s0,a0

    addi s1,a0,-1
    addi s2,a0,-2

    li t0,1

    ble a0,t0,epilouge

    mv a0,s1
    jal fibbonacci_int
    mv s1,a0
    mv a0,s2
    jal fibbonacci_int
    mv s2,a0
    add a0,s1,s2


    epilouge:
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    lw s3, 16(sp)
    addi sp,sp,20
    jr ra