.data
source:      .string "Hello"    # String y (source)
destination: .space  10         # String x (destination buffer)

.text
.globl main
main:
    # Set arguments
    la   x10, destination       # x10 = base address of x[]
    la   x11, source            # x11 = base address of y[]

    # Call strcpy
    jal  x1, strcpy             # Call strcpy function

    # Halt execution
    jal  x0, exit

# --- Callee: strcpy Procedure ---
strcpy:
    # Save x19 on stack
    addi sp, sp, -4             # Allocate 4 bytes on stack
    sw   x19, 0(sp)             # Save x19

    addi x19, x0, 0             # i = 0

loop:
    # Get address and character from y[i]
    add  x5, x11, x19           # x5 = &y[i]
    lbu  x6, 0(x5)              # x6 = y[i] (read 1 byte)

    # Copy character to x[i]
    add  x7, x10, x19           # x7 = &x[i]
    sb   x6, 0(x7)              # x[i] = y[i] (write 1 byte)

    # Check if null terminator ('\0' = 0)
    beq  x6, x0, done           # If y[i] == 0, end loop

    # i++ and repeat
    addi x19, x19, 1            # i = i + 1
    jal  x0, loop               # Repeat loop

done:
    # Restore x19 from stack
    lw   x19, 0(sp)             # Restore original x19
    addi sp, sp, 4              # Deallocate stack space

    # Return to caller
    jalr x0, 0(x1)              # Jump back using x1

exit:
    jal  x0, exit               # Infinite loop to inspect state