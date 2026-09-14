.text
.globl main
main:

li x22, 1   # b = 1
li x23, 1   # c = 1

li x5, 1   # choice = 1
li x6, 2   # choice = 2
li x7, 3   # choice = 3
li x8, 4   # choice = 4


beq x20, x5, Add
beq x20, x6, Sub
beq x20, x7, Mul
beq x20, x8, Div
li x21, 0   # default case: x21 = 0
beq x0, x0, end

Add:
    add x21, x22, x23
    beq x0, x0, end

Sub:
    sub x21, x22, x23
    beq x0, x0, end

Mul:
    slli x21, x22, 1
    beq x0, x0, end

Div:
    srli x21, x22, 1
    beq x0, x0, end

end:
    j end