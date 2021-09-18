    .data
    .globl i
i:  .word  0
    .globl v
v:  .word  0

    .text
    .globl main
main:
    la $t0, i
    li $s0, 1
    sw $s0, 0($t0)

    la $t0, v
    sw $zero, 0($t0)

loop_begin:
    # if文
    la $t0, i
    lw $s0, 0($t0)
    li $s1, 100
    sgt $t0, $s0, $s1
    bnez $t0, loop_end

    # v = v + i
    la $t0, v
    lw $s0, 0($t0)
    la $t1, i
    lw $s1, 0($t1)
    add $s0, $s0, $s1
    sw $s0, 0($t0)

    # i = i + 1
    la $t0, i
    lw $s0, 0($t0)
    addi $s0, $s0, 1
    sw $s0, 0($t0)

    j loop_begin
loop_end:
    li $v0 ,0
    jr $ra
