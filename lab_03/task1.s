.text
.globl main
main:
    # Set function arguments
    addi x10, x0, 12       # a = 12
    addi x11, x0, 12       # b = 12

    # Call function
    jal  x1, sum           # Jump to sum, save return address in x1

    # Print result
    addi x11, x10, 0       # Copy sum to x11 for printing
    addi x10, x0, 1        # System call code 1 (print integer)
    ecall                  # Print sum to terminal

    # Stop execution
    j exit          # Jump to exit loop

sum:
    add  x10, x11, x10     # x10 = a + b
    jalr x0, 0(x1)         # Return back to caller using x1

exit:
    jal  x0, exit          # Halt