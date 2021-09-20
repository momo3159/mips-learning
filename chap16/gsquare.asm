      .data
      .globl s
s:    .word 0
      .globl sq_s
sq_s: .word 0
      # .globl s1_
      .globl s1_
s1_:  .asciiz "\n"

      .text
      .globl main
main:
      addiu $sp, $sp, -12
      sw $ra, 8($sp)
      sw $fp, 4($sp)
      sw $s0, 0($sp)
      move $fp, $sp

      la $t0, s
      li $t1, 1
      sw $t1, 0($t0)

while_start:
      la $t0, s
      lw $s0, 0($t0)
      li $t1, 10
      sle $t2, $s0, $t1
      beqz $t2, while_end

      #gsquare()
      jal gsquare

      #print_int(sq_s)
      la $t0, sq_s
      lw $a0, 0($t0)
      li $v0, 1
      syscall

      #print_string(\n)
      la $a0, s1_
      li $v0, 4
      # lw $a0, 0($t0)
      syscall

      #s = s + 1
      la $t0, s
      lw $s0, 0($t0)
      addi $s0, $s0, 1
      sw $s0, 0($t0)

      b while_start
while_end:
      li $v0, 0
      move $sp, $fp
      lw $ra, 8($sp)
      lw $fp, 4($sp)
      lw $s0, 0($sp)
      addiu $sp, $sp, 12
      jr $ra

      .globl square
gsquare:
      # スタックフレームの確保
      addiu $sp, $sp, -12
      sw $ra 8($sp)
      sw $fp 4($sp)
      sw $s0 0($sp)
      move $fp, $sp

      # sq_s = s * s
      la $t0, s
      lw $s0, 0($t0)
      mul $s0, $s0, $s0
      la $t0, sq_s
      sw $s0, 0($t0)

      move $sp, $fp
      lw $ra, 8($sp)
      lw $fp, 4($sp)
      lw $s0, 0($sp)
      addiu $sp, $sp, 12
      jr $ra



