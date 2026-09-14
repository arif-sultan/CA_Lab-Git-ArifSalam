.text
.globl main
main:

li x22, 1   # i = 1

Loop: slli x10, x22, 3
add x10, x10, x25
lw x9, 0(x10)
bne x9, x24, end
addi x22, x22, 1
beq x0, x0, Loop




end:
    j end