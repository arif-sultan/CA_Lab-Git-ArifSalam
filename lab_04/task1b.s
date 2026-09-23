.text
.globl main
main:
    li   x10, 5             # Load argument n = 5
    jal  x1, fact_iter      # Call iterative factorial (stores return address in x1)
    j    end                # Pause execution cleanly at the end
fact_iter:
    li   x5, 1              # acc = 1
while:
    ble  x10, x0, base      # If n <= 0, exit loop
    mul  x5, x5, x10        # acc = acc * n
    addi x10, x10, -1       # n = n - 1
    beq  x0, x0, while      # Jump back to while loop
base:
    addi x10, x5, 0         # Return acc in x10
    jalr x0, 0(x1)          # Return to caller (main)
end: 
    j    end                # Halts execution here so you can snip the registers