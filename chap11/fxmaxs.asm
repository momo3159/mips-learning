        .data
        .globl x
x:      .word  0
        .globl y
y:      .word  0
        .globl ymax1
ymax1:  .word  0
        .globl ymax2
ymax2:  .word  0

        .text
        .globl main
main:
        la   $t0,   ymax1
        sw   $zero, 0($t0)
        la   $t0,   ymax2
        sw   $zero, 0($t0)
        la   $t0,   x
        li   $t1,   -10
        sw   $t1,   0($t0)
while_start:
        la   $t0,   x
        lw   $s0,   0($t0)
        li   $s1,   10
        sle  $t0,   $s0, $s1
        beqz $t0,   while_end

        la   $t0,   x
        lw   $s0,   0($t0)
        addi $s1,   $s0, 1

        la   $t0,   x
        lw   $s0,   0($t0)
        addi $s2,   $s0, 5

        la   $t0,   x
        lw   $s0,   0($t0)
        li   $t0,   3
        sub  $s3,   $s0, $t0

        la   $t0,   x
        lw   $s0,   0($t0)
        li   $t0,   5
        sub  $s4,   $s0, $t0

        mul  $s1,   $s1, $s2
        mul  $s1,   $s1, $s3
        mul  $s1,   $s1, $s4
        neg  $s1,   $s1

        la   $t0,   y
        sw   $s1,   0($t0)

        la   $t0,   x
        lw   $s0,   0($t0)
        slt  $t0,   $s0, $zero
        beqz $t0,   main_2
        la   $t0,   y
        lw   $s0,   0($t0)
        la   $t1,   ymax1
        lw   $s1,   0($t1)
        sgt  $t0,   $s0, $s1
        beqz $t0,   main_2

        la   $t0,   y
        lw   $s0,   0($t0)
        la   $t0,   ymax1
        sw   $s0,   0($t0)

main_2:
        la   $t0,   x
        lw   $s0,   0($t0)
        sgt  $t0,   $s0, $zero
        beqz $t0,   main_3
        la   $t0,   y
        lw   $s0,   0($t0)
        la   $t1,   ymax2
        lw   $s1,   0($t1)
        sgt  $t0,   $s0, $s1
        beqz $t0,   main_3

        la   $t0,   y
        lw   $s0,   0($t0)
        la   $t0,   ymax2
        sw   $s0,   0($t0)

main_3:
        la   $t0,   x
        lw   $s0,   0($t0)
        addi $s0,   $s0, 1
        sw   $s0,   0($t0)

        b    while_start

while_end:
        li   $v0,   0
        jr   $ra