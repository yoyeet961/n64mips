pixel8_init16:
    // a0 = font_destination
    // a1 = forecolor
    // a2 = backcolor
    // 95 * 64 * 2 = 12,160 = 0x2F80

    // 1100000000000000000000000000000000000000000000000000000000000000
    // 0xC000000000000000

    li t0, PIXEL8_START
    addi t3, r0, 94
_pixel8_init16_newChar:
    ld t1, 0x0(t0) // Loaded Font Character

    addi t2, r0, 63
_pixel8_init16_do_pixel:
    bltzl t1, _pixel8_init16_continue
    sh a1, 0x0(a0)
    sh a2, 0x0(a0)
_pixel8_init16_continue:
    sll t1, t1, 1
    addi a0, a0, 2
    bne t2, r0, _pixel8_init16_do_pixel
    addi t2, t2, -1

    addi t0, t0, 8
    bne t3, r0, _pixel8_init16_newChar
    addi t3, t3, -1


_pixel8_init16_exit:
    jr ra
    nop

pixel8_static16:
    // a0 = font name
    // a1 = framebuffer
    // a2-upper = top (16 bit value)
    // a2-lower = left (16 bit value)
    // a3 = string_label
    // v1 = length (64 KB Max Length)
    bezl a0, _pixel8_static16_exit
    nop
    bezl a1, _pixel8_static16_exit
    nop
    bezl a3, _pixel8_static16_exit
    nop
    blezl v1, _pixel8_static16_exit
    nop

    lb t0, 0x0(a3)
    addi t0, t0, -32
    // 1 pixel = 2 bytes
    // 1 character = 64 pixels
    // 64 * 2 = 128 bytes per character
    

_pixel8_static16_exit:
    jr ra
    nop

PIXEL8_START:
insert "PIXEL8.FNT"
PIXEL8_END: