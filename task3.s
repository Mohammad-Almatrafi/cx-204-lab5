
.data
array: .word 1234,1234,654,432,63,214,65481,4,5521,1241,6632,14

.text

main:

la a0, array
li a1,12
jal ra,bubbleSort_int_int

ebreak
li a0,10
ecall


bubbleSort_int_int:
    addi sp,sp,-4 # stack pointer alloc
    sw ra,0(sp) # store ra

    addi t2,a1,-1 # get n-1
    li t0,0 # i = 0

outer_loop:
    bge t0,t2,done # i < n-1
    li t1, 0 # j = 0
    sub t3, t2, t0 # n-i-1
inner_loop: 
    bge t1,t3,next # j < n-i-1
        slli t4, t1, 2 # calculate j address
        add t4, t4,a0
        lw t5, 0(t4)
        lw t6, 4(t4)
        bgt t6,t5,afterJ
        sw t5, 4(t4)
        sw t6, 0(t4)
afterJ:
    addi t1,t1,1
    j inner_loop
next:
addi t0,t0,1
j outer_loop

done:
    lw ra,0(sp) # store ra
    addi sp,sp,4 # stack pointer alloc
    jr ra


