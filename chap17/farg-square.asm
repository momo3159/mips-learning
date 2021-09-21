.data
.globl v
v: .word 0
s: .asciiz "\n"

.text
.globl main
main:
  addiu $sp, $sp, -24
  sw $ra, 20($sp)
  sw $fp, 16($sp)
  move $fp, $sp

  # v = gsquare(99)
  li $a0, 99
  jal square
  la $t0, v
  sw $v0, 0($t0)

  # print_int(v)
  la $t0, v
  lw $a0, 0($t0)
  li $v0, 1
  syscall

  # print_string(s)
  la $a0, s # アドレスを渡している
  li $v0, 4
  syscall

  # return 0
  move $sp, $fp
  lw $fp, 16($sp)
  lw $ra, 20($sp)
  addiu $sp, $sp, 24

  li $v0, 0
  jr $ra

.globl square
square:
  # スタックフレームの確保
  addiu $sp, $sp, -30
  sw $ra, 24($sp)
  sw $fp, 20($sp)
  sw $s0, 16($sp)
  move $fp, $sp

  # return n * n
  mul $s0, $a0, $a0
  move $v0, $s0

  move $sp, $fp
  lw $s0, 16($sp)
  lw $fp, 20($sp)
  lw $ra, 24($sp)
  addiu $sp, $sp, 30

  jr $ra
