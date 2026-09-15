.text
.globl main
main:
    # Set arguments: g=5, h=4, i=3, j=2
    addi x10, x0, 5
    addi x11, x0, 4
    addi x12, x0, 3
    addi x13, x0, 2

    # Call leaf_example
    jal  x1, leaf_example

    # Print returned result
    addi x11, x10, 0       # Move result to x11 for printing
    addi x10, x0, 1        # Syscall code 1 (print integer)
    ecall                  # Print result to terminal

    jal  x0, exit          # Jump to exit loop

leaf_example:
    # Save x18, x19, x20 to stack
    addi sp, sp, -12       # Allocate 12 bytes on stack
    sw   x18, 8(sp)        # Save x18
    sw   x19, 4(sp)        # Save x19
    sw   x20, 0(sp)        # Save x20

    # Compute: f = (g + h) - (i + j)
    add  x18, x10, x11     # x18 = g + h
    add  x19, x12, x13     # x19 = i + j
    sub  x20, x18, x19     # f = (g + h) - (i + j)

    addi x10, x20, 0       # Return value placed in x10

    # Restore registers from stack
    lw   x20, 0(sp)        # Restore x20
    lw   x19, 4(sp)        # Restore x19
    lw   x18, 8(sp)        # Restore x18
    addi sp, sp, 12        # Deallocate stack space

    jalr x0, 0(x1)         # Return to caller

exit:
    jal  x0, exit          # Halt execution