.data
.globl s
s: .word 0
.globl i
i: .word 0

.text
.globl main
main:
#   la $t0, s
#   sw $zero, 0($t0)

#   la $t0, i
#   li $s0, 1
#   sw $s0, 0($t0)

# loop:
#   la $t0, i
#   lw $s0, 0($t0)
#   li $s1, 100
#   sle $s2, $s0, $s1
#   beqz $s2, loop_end

#   la $t0, s
#   lw $s0, 0($t0)
#   la $t1, i
#   lw $s1, 0($t1)
#   add $s2, $s0, $s1
#   sw $s2, 0($t0)

#   la $t0, i
#   lw $s0, 0($t0)
#   addi $s2, $s0, 1
#   sw $s2, 0($t0)
#   b loop
# loop_end:
#   li $v0, 0
#   jr $ra

# 頻繁に使う変数をレジスタに割り当てることによって
# ロードの回数を減らしている
    move $t1, $zero # 変数s
    li   $t2, 1     # 変数i
    li   $t3, 100   # 定数100
loop:
    sle  $t0, $t2, $t3
    beqz $t0, loop_end

    add  $t1, $t1, $t2
    addi $t2, $t2, 1

    b    loop
loop_end:
    la   $t0, s
    sw   $t1, 0($t0)
    la   $t0, i
    sw   $t2, 0($t0)
    
    li   $v0, 0
    jr   $ra