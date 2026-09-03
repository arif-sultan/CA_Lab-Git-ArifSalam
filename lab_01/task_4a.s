.text
.globl main
main:
    li x1, 0x100        # base pointer for the 0x100 side
    li x2, 0x1F0         # base pointer for the 0x1F0 side

    sw  x10, 0(x1)        # store x10 as a full (unsigned) word at 0x100
    sw  x11, 0(x2)        # store x11 as a full (unsigned) word at 0x1F0

    lhu x12, 0(x1)        # load unsigned halfword from 0x100 → x12
    lh  x13, 0(x2)        # load (signed) halfword from 0x1F0 → x13
    lb  x14, 0(x2)        # load signed byte from 0x1F0 → x14
end:
    j end