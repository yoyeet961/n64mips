macro pixel8_init16(destination, forecolor, backcolor) {
    li a0, {destination}
    li a1, {forecolor}
    jal pixel8_init16
    lui a2, {backcolor}
    ori a2, {forecolor}
    nop // Returns to here
}