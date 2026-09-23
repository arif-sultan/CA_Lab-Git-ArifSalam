.data
arr:    .word 9, 3, 7, 1, 5     # Array to be sorted
len:    .word 5                 # Number of elements in the array

.text
.globl main

main:
    la   x10, arr               # x10 = base address of array 'arr'
    la   x5, len                # Load address of len
    lw   x11, 0(x5)             # x11 = len (number of elements = 5)

    jal  x1, bubble             # Call bubble sort procedure
    j    end                    # Jump to end loop to halt cleanly

bubble:
    # Safety check: if (a == NULL || len == 0) return;
    beq  x10, x0, bubble_done   # Return if base address is NULL
    beq  x11, x0, bubble_done   # Return if array length is 0

    addi x12, x0, 0             # Outer loop index: i = 0

outer_loop:
    bge  x12, x11, bubble_done  # If i >= len, sorting is done
    addi x13, x12, 0            # Inner loop index: j = i

inner_loop:
    bge  x13, x11, next_i       # If j >= len, inner loop done for this i

    # Calculate address of a[i] = a + (i * 4)
    slli x5, x12, 2             # x5 = i * 4 (byte offset)
    add  x5, x10, x5            # x5 = exact address of a[i]
    lw   x6, 0(x5)              # x6 = a[i]

    # Calculate address of a[j] = a + (j * 4)
    slli x7, x13, 2             # x7 = j * 4 (byte offset)
    add  x7, x10, x7            # x7 = exact address of a[j]
    lw   x28, 0(x7)             # x28 = a[j]

    # Compare: if !(a[i] < a[j]), skip swap
    bge  x6, x28, skip_swap     # If a[i] >= a[j], do not swap

    # Swap elements: temp = a[i]; a[i] = a[j]; a[j] = temp;
    sw   x28, 0(x5)             # Store a[j] into address of a[i]
    sw   x6, 0(x7)              # Store a[i] into address of a[j]

skip_swap:
    addi x13, x13, 1            # j++
    beq  x0, x0, inner_loop     # Repeat inner loop

next_i:
    addi x12, x12, 1            # i++
    beq  x0, x0, outer_loop     # Repeat outer loop

bubble_done:
    jalr x0, 0(x1)              # Return to caller

end:
    j    end                    # Infinite loop to keep execution paused