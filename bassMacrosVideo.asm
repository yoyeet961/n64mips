// N64 MIPS
arch n64.cpu
endian msb
output "bassMacrosVideo.N64", create
// The N64 has a 4KB header.
// When the N64 boots up, it copies the first megabyte of the game code.
fill 1052672 // Set ROM Size. This is 1MB + 4096 for the RAM Size.

origin $00000000
base $80001000 // Entry Point Of Code
include "LIB/A64.INC"
include "LIB/N64.INC" // Include N64 Definitions
include "LIB/N64_HEADER.ASM" // Include 64 Byte Header & Vector Table
include "LIB/COLORS16.INC"
insert "LIB/N64_BOOTCODE.BIN" // Include 4032 Byte Boot Code

Start:

  init()

  ScreenNTSC(320, 240, BPP16, $A0001000)

	nop
	nop
	nop
// Draw a Line (Horizontal)
  // lui t0, LAWN_GREEN16
  // ori t0, LAWN_GREEN16
  // la t1, $A0100000

  // 15 rows from the top
  // 110 columns (110 + 100 + 110 = 320)
  // 100 pixels long

  // 320 Pixels Wide
  // To move down 15 rows, (320 * 15 + 110) * 2
  // 320 * 15 = 4800
  // addi t1, t1, ((320 * 15) + 110) * 2 // ((320 * 15) + 110) * 2 = 9820 or 0x265C
  // addi t2, t1, 200

// Draw a Line (Vertical)
  lui t0, ROYAL_BLUE16
  // ori t0, ROYAL_BLUE16
  la t1, $A0100000

  // 20 rows from the top
  // 100 columns
  // 200 pixels tall

  // 320 Pixels Wide
  addi t1, t1, ((320 * 20) + 100) * 2
  addi t2, r0, 200

Store2Pixels:
  sw t0, 0x0(t1)
  addi t2, t2, -1
  addi t1, t1, 320 * 2
  bne t2, r0, Store2Pixels

Loop:
  j Loop
  nop // Delay Slot