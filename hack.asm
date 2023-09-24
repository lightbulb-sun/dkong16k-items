incbin "dkong16k.col"

FREE_ROM:               equ     $b900
CUR_LEVEL:              equ     $70a6
ITEM_POINTS_LEVEL_1:    equ     300
ITEM_POINTS_LEVEL_2:    equ     500
ITEM_POINTS_LEVEL_3:    equ     800

myorg: macro addr
        seek    addr-$8000
        org     addr
endm

myorg $8c9c
        call    injection

myorg FREE_ROM
injection:
        ld      a, (CUR_LEVEL)
        dec     a
        jr      z, .level1
        dec     a
        jr      z, .level2
.level3:
        ld      bc, ITEM_POINTS_LEVEL_3/10
        ret
.level1:
        ld      bc, ITEM_POINTS_LEVEL_1/10
        ret
.level2:
        ld      bc, ITEM_POINTS_LEVEL_2/10
        ret
