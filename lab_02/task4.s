.text
.globl main
main:
addi x7, x0, 0          # i = 0

outer_loop:
    bge  x7, x5, end        # if (i >= a) exit outer loop
    addi x29, x0, 0         # j = 0

inner_loop:
    bge  x29, x6, end_inner  # if (j >= b) exit inner loop

    add  x28, x7, x29       # x28 = i + j
    slli x30, x29, 4        # byte offset = (4 * j) * 4 bytes = j * 16 (shift left by 4)
    add  x30, x10, x30      # x30 = &D[4 * j]
    sw   x28, 0(x30)        # D[4 * j] = i + j

    addi x29, x29, 1        # j++
    jal  x0, inner_loop     # repeat inner loop

end_inner:
    addi x7, x7, 1          # i++
    jal  x0, outer_loop     # repeat outer loop

end: