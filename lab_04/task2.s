.text
.globl main

main:
addi x10, x0, 5        # Set input argument n = 5
jal x1, ntri           # Call recursive procedure ntri
j end                  # Jump to end loop to halt program

ntri:
addi sp, sp, -8        # Adjust stack pointer down to allocate 8 bytes
sw x1, 4(sp)           # Save return address (x1) on stack
sw x10, 0(sp)          # Save current argument n (x10) on stack

addi x5, x0, 2         # Set temporary threshold x5 = 2
bge x10, x5, L1        # If n >= 2, jump to recursive case L1

# Base case (n <= 1)
addi x10, x0, 1        # Set return value to 1
addi sp, sp, 8         # Deallocate 8 bytes from stack
jalr x0, 0(x1)         # Return to caller

L1:
addi x10, x10, -1      # Set argument to n - 1
jal  x1, ntri          # Recursive call: ntri(n - 1)
addi x6, x10, 0        # Save result of ntri(n - 1) into x6
lw   x10, 0(sp)        # Restore original argument n from stack
lw   x1, 4(sp)         # Restore return address from stack
addi sp, sp, 8         # Deallocate 8 bytes from stack

add  x10, x10, x6      # Compute result: n + ntri(n - 1)
jalr x0, 0(x1)         # Return result in x10 to caller
end:
    j    end           # Infinite loop to keep program paused