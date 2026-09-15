.data
v:  .word 10, 20, 30, 40       # Array elements

.text
.globl main
main:
    # Set arguments
    la   x10, v                # Base address of array v
    addi x11, x0, 1            # k = 1 (swap v[1] and v[2])

    # Call swap function
    jal  x1, swap              # Jump to swap, save return address in x1

    # End of main
    jal  x0, exit              # Jump to exit

swap:
    # Find address of v[k]
    slli x5, x11, 2            # Offset = k * 4
    add  x5, x10, x5           # x5 = address of v[k]

    # Load both elements
    lw   x6, 0(x5)             # temp = v[k]
    lw   x7, 4(x5)             # x7 = v[k+1]

    # Store them in opposite locations
    sw   x7, 0(x5)             # v[k] = v[k+1]
    sw   x6, 4(x5)             # v[k+1] = temp

    # Return to main
    jalr x0, 0(x1)             # Return using x1

exit:
    jal  x0, exit              # Halt execution