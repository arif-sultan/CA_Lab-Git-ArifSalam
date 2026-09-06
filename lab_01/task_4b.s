  .text
  .globl main
  main:
      li x1, 0x100
      li x2, 0x200
      li x3, 0x300

      # --- test data setup (not in original file) ---
      li x7, 10
      sb x7, 0(x1)        # a[0] = 10
      li x7, -5
      sb x7, 1(x1)        # a[1] = -5
      li x7, 20
      sb x7, 2(x1)        # a[2] = 20
      li x7, -30
      sb x7, 3(x1)        # a[3] = -30

      li x8, 100
      sh x8, 0(x2)        # b[0] = 100
      li x8, 200
      sh x8, 2(x2)        # b[1] = 200
      li x8, 300
      sh x8, 4(x2)        # b[2] = 300
      li x8, 400
      sh x8, 6(x2)        # b[3] = 400
      # --- end test data setup ---

      lb x4, 0(x1)
      lh x5, 0(x2)
      add x6, x4, x5
      sw x6, 0(x3)

      lb x4, 1(x1)
      lh x5, 2(x2)
      add x6, x4, x5
      sw x6, 4(x3)

      lb x4, 2(x1)
      lh x5, 4(x2)
      add x6, x4, x5
      sw x6, 8(x3)

      lb x4, 3(x1)
      lh x5, 6(x2)
      add x6, x4, x5
      sw x6, 12(x3)

  end:
      j end

