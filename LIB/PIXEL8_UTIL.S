pixel8_init16:
    //a0 = font_destination
    //a1 = forecolor
    //a2 = backcolor

    // 1100000000000000000000000000000000000000000000000000000000000000
    // 0xC000000000000000

    li t0, PIXEL8_START
    ld t1, 0x0(t0) // Loaded Font Character

    addi t2, r0, 64

_pixel8_init16_do_pixel:
    bltzl t1, _pixel8_init16_continue
    sh a1, 0x0(a0)
    sh a2, 0x0(a0)
    sll t1, t1, 1

_pixel8_init16_continue:
    bne t2, r0, _pixel8_init16_do_pixel
    addi t1, t1, -1

    // Code
    jr ra
    nop

PIXEL8_START:
insert "PIXEL8.FNT"
PIXEL8_END: