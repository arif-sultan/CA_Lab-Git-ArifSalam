.text
.globl main
main:

    li x1, 0x100        
    li x2, 0x200
    li x3, 0x300

    lb x4, 0(x1)
    lh x5, 0(x2)
    add x6, x4, x5
    sw x6, 0(x3)

    lb x4, 1(x1)
    lh x5, 2(x2)
    add x6, x4, x5
    sw x6, 4(x3)

    lb x4, 2(x1)
    lh x5, 4(x2)
    add x6, x4, x5
    sw x6, 8(x3)

    lb x4, 3(x1)
    lh x5, 6(x2)
    add x6, x4, x5
    sw x6, 12(x3)
     
end:
    j end