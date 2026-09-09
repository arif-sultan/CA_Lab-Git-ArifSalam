.text
.globl main
main:

# giving values to registers
li x19, 1   # f = 1
li x20, 2   # g = 2
li x21, 3   # h = 3
li x22, 4   # i = 4
li x23, 5   # j = 5

bne x22, x23, Else
add x19, x20, x21  # f = g + h
beq x0, x0, end

Else:
    sub x19, x20, x21  # f = g - h



end:
    j end