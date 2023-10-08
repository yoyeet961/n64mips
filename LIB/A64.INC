constant BPP0($0000)
constant BPP16($0002)
constant BPP32($0003)

macro ScreenNTSC(width, height, status, origin) {
// Video Initialization 320x240x16bit
	lui t0, VI_BASE

	li t1, BPP16
	sw t1, VI_STATUS(t0)

	li t1, $A010'0000 // '
	sw t1, VI_ORIGIN(t0)

	li t1, 320
	sw t1, VI_WIDTH(t0)

	li t1, $200
	sw t1, VI_V_INTR(t0)

	li t1, 0
	sw t1, VI_V_CURRENT_LINE(t0)
	
	li t1, $3E52239 
	sw t1, VI_TIMING(t0)

	li t1, $20D         
	sw t1, VI_V_SYNC(t0)

	li t1, $C15         
	sw t1, VI_H_SYNC(t0)

	li t1, $C150C15
	sw t1, VI_H_SYNC_LEAP(t0)

	li t1, $6C02EC        
	sw t1, VI_H_VIDEO(t0)

	li t1, $2501FF        
	sw t1, VI_V_VIDEO(t0)

	li t1, $E0204        
	sw t1, VI_V_BURST(t0)

	li t1, ($100*(320/160))
	sw t1, VI_X_SCALE(t0)

	li t1, ($100*(240/60))
	sw t1, VI_Y_SCALE(t0)
}