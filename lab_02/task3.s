.text
.globl main
main:


li x23, 0   # sum = 0
li x3, 0x200  # base address of a
li x5, 10
li x22, 0
Loop:
    bge x22, x5, end_loop1
    slli x2, x22, 2     # x2 = i*4
    add x2, x3, x2
    sw x22, 0(x2)
    addi x22, x22, 1
    beq x0, x0, Loop

end_loop1:
    li x22, 0
loop2:
    bge x22, x5, end
    slli x2, x22, 2     # x2 = i*4
    add x2, x3, x2
    lw x6, 0(x2) # x6 = a[i]
    add x23, x23, x6  # sum = sum + a[i]
    addi x22, x22, 1
    beq x0, x0, loop2

end:
    j end