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

constant red_black($A0201000) // red text, black background
constant fb1($A0100000)

Start:	                 // NOTE: base $80000000
	init()

	ScreenNTSC(320, 240, BPP16, fb1)

	nop
	nop
	nop

	pixel8_init16(red_black, RED16, BLACK16) // red text, black background

	nop
	nop
	nop

	// 8x8 pixel font, 16bpp
	pixel8_static16(red_black, fb1, 16, 16, text, 7)

Loop:  // while(true);
	j Loop
	nop
	
ALIGN(8)
text:
db "ERROR 1"

ALIGN(8)
include "LIB/PIXEL8_UTIL.S"