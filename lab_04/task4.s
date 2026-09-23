.text
.globl main

main:
    addi x10, x0, 3        # First input number a = 3
    addi x11, x0, 4        # Second input number b = 4
    jal  x1, sum_of_squares # Call non-leaf procedure
    j    end               # Halt program so registers stay visible

# Non-leaf procedure: computes (a^2 + b^2)
sum_of_squares:
    addi sp, sp, -16       # Allocate 16 bytes on stack
    sw   x1, 12(sp)        # Save return address (ra / x1)
    sw   x10, 8(sp)        # Save argument a
    sw   x11, 4(sp)        # Save argument b

    # First nested call: square(a)
    jal  x1, square        # Call child procedure: returns a^2 in x10
    sw   x10, 0(sp)        # Save result (a^2) on stack

    # Second nested call: square(b)
    lw   x10, 4(sp)        # Load argument b into x10 for square procedure
    jal  x1, square        # Call child procedure: returns b^2 in x10

    # Add both squares: a^2 + b^2
    lw   x5, 0(sp)         # Load saved a^2 into x5
    add  x10, x5, x10      # x10 = a^2 + b^2

    # Restore return address and deallocate stack
    lw   x1, 12(sp)        # Restore original return address
    addi sp, sp, 16        # Pop stack frame
    jalr x0, 0(x1)         # Return to caller (main)

# Leaf child procedure: computes num * num
square:
    mul  x10, x10, x10     # x10 = x10 * x10
    jalr x0, 0(x1)         # Return to parent procedure

end:
    j    end               # Infinite loop to keep execution paused