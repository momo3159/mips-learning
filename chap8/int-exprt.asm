       .data
       .globl num1
num1:  .word   123
       .globl num2
num2:  .word   4
       .globl num3
num3:  .word   10
       .globl num4
num4:  .word   5
       .globl value
value: .word   0

       .text
       .globl main
main:
       la  $t0, num1
       lw  $t1, 0($t0)
       la  $t0, num2
       lw  $t2, 0($t0)
       add $s0, $t1, $t2
       la  $t0, num3
       lw  $t1, 0($t0)
       la  $t0, num4
       lw  $t2, 0($t0)
       sub $s1, $t1, $t2
       mul $s0, $s0, $s1
       la  $t0, value
       sw  $s0, 0($t0)

       li  $v0, 0
       jr  $ra


