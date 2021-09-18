     .data
# int src = 2001
# .global・・リンカに存在を伝える（グローバル変数、関数などにつける）
     .global src
src: .word   2001

# int dst
     .global dst
dst: .word   0

     .text
     .global main
main:
# dst = src
     la $t0, src
     lw $s0, 0($t0)
     la $t1, dst
     sw $t1, 0($t0)

# return 0
     li $v0, 0
     jr $ra
