pixel8_init16:
    //a0 = font_destination
    //a1 =  forecolor
    //a2 = backcolor

    li t0, PIXEL8_START
    ld t1, 0x0(t0)

    // 1100000000000000000000000000000000000000000000000000000000000000

    if ((0xC000000000000000 & 0x01) == 1)
    assign forecolor
    else
    assign backcolor

    // Code
    jr ra
    nop

PIXEL8_START:
insert "PIXEL8.FNT"
PIXEL8_END: