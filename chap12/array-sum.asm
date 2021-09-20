      .data
      .globl sum
sum:  .word 0
      .globl i
i:    .word 0
      .globl a
a:    .word 9
      .word 5
      .word 1
      .word 7
      .word 10
      .word 12
      .word 2

      .text
      .globl main
main:
      la $t0, i
      sw $zero, 0($t0)

      la $t0, sum
      sw $zero, 0($t0)

while_start:
      la   $t0, i
      lw   $s0, 0($t0)
      li   $s1, 7
      slt  $t0, $s0, $s1
      beqz $t0, while_end

      # sum = sum + a[i]
      la   $t0, sum
      lw   $s7, 0($t0) # s7 = sum
      la   $t0, i
      lw   $s1, 0($t0) # s1 = i
      li   $t1, 4
      mul  $t1, $t1, $s1 # 4 * i
      la   $t0, a
      addu $t0, $t0, $t1
      lw   $s0, 0($t0) # a[i]
      add  $s0, $s7, $s0 # sum + a[i]
      la   $t0, sum
      sw   $s0, 0($t0)

      # i += i
      la   $t0, i
      lw   $s0, 0($t0)
      addi $s0, $s0, 1
      sw   $s0, 0($t0)

      b    while_start
while_end:
      li   $v0, 0
      jr   $ra