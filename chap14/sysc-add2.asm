.data
.globl n1
n1:  .word 0
.globl n2
n2:  .word 0
_s1: .asciiz "Please input two numbers.\n"
_s2: .asciiz "Number 1 = "
_s3: .asciiz "Number 2 = "
_s4: .asciiz "Sum = "
_s5: .asciiz "\nEnd.\n"

.text
.globl main
main:
li $v0, 4
la $a0, _s1
syscall

li $v0, 4
la $a0, _s2
syscall

li $v0, 5
syscall
la $t0, n1
sw $v0, 0($t0)

li $v0, 4
la $a0, _s3
syscall

li $v0, 5
syscall
la $t0, n2
sw $v0, 0($t0)

li $v0, 4
la $a0, _s4
syscall

li $v0, 1
la $t0, n1
lw $s0, 0($t0)
la $t0, n2
lw $s1, 0($t0)
add $a0, $s0, $s1
syscall

li $v0, 4
la $a0, _s5
syscall

li $v0, 0
jr $ra