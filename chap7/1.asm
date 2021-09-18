     .data
# .global・・リンカに存在を伝える（グローバル変数、関数などにつける）
     .globl src
src: .word   2001
     .globl dst
dst: .word   0

     .text
     .globl main
main:
# dst = src
     la $t0, src
     lw $s0, 0($t0)
     la $t1, dst
     sw $s0, 0($t1)

# return 0
     li $v0, 0
     jr $ra

