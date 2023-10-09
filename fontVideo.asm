// N64 Lesson 02 Simple Initialize
arch n64.cpu
endian msb
output "fontVideo.N64", create
// 1024 KB + 4 KB = 1028 KB
fill $0010'1000 // Set ROM Size '

origin $00000000
base $80000000

include "LIB/N64.INC"
//include "LIB/N64_GFX.INC"
include "LIB/A64.INC"
include "LIB/COLORS16.INC"
include "LIB/PIXEL8_UTIL.INC"
include "LIB/N64_HEADER.ASM"
insert "LIB/N64_BOOTCODE.BIN"


Start:	                 // NOTE: base $80000000
	init()

	ScreenNTSC(320, 240, BPP16, $A0100000)

	nop
	nop
	nop

	pixel8_init16($A0130000, RED16, BLACK16) // red text, black background

Loop:  // while(true);
	j Loop
	nop
	
ALIGN(8)
include "LIB/PIXEL8_UTIL.S"