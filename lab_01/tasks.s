.text
.globl main
main:
    li x1, 5   # x1 = a
    li x2, 0   # x2 = b
    addi x1, x2, 32  
    add x3, x1, x2
    li x4, 5
    sub x5, x3, x4  # X5 = d
    sub x6, x1, x5 # X6 = (a-d)
    sub x7, x2, x1  # X7 = (b-a)
    add x8, x6, x7  # X8 = (a-d) + (b-a)
    add x9, x8, x5  # X9 = (a-d) + (b-a) + d  = e
    add x10, x1, x2
    add x11, x5, x9
    add x9, x10, x11  # X9 = (a+b) + (d+e)
end:
    j end
