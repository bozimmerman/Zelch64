* = $c000
; punter protocol by steve punter
; author of this version unknown
kCHKIN = $FFC6
kCHKOUT = $FFC9
kCLRCHN = $FFCC
kCHRIN = $FFCF
kCHROUT = $FFD2
kGETIN = $FFE4
kREADST = $FFB7
kPLOT = $FFF0

Lc000               lda #$00
                    bit $03a9
                    bit $06a9
                    bit $09a9
                    bit $0ca9
                    bit $0fa9
                    nop 
                    jmp Lc01b
                    
                    byte $4c,$d5,$c5,$00,$00,$00 
Lc01b               sta $62
                    tsx 
                    stx $c81c
                    lda #$33
                    clc 
                    adc $62
                    sta $c031
                    lda #$c0
                    adc #$00
                    sta $c032
                    jmp Lc033
                    
Lc033               jmp Lc057
                    
Lc036               jmp Lc417
                    
Lc039               jmp Lc3d9
                    
Lc03c               jmp Lc4e3
                    
Lc03f               jmp Lc532
                    byte $00,$00,$00,$00,$00,$00,$47,$4f 
                    byte $4f,$42,$41,$44,$41,$43 
                    byte $4b,$53,$2f,$42,$53,$59,$4e 
Lc057               sta $c805
                    lda #$00
                    sta $07e5
                    sta $07e6
                    sta $07e7
Lc065               lda #$00
                    sta $c806
                    sta $c807
Lc06d               jsr Sc5e4
                    jsr Sc0f8
                    lda $96
                    bne Lc0cf
                    lda $07e6
                    sta $07e5
                    lda $07e7
                    sta $07e6
                    lda $0200
                    sta $07e7
                    lda #$00
                    sta $c804
                    lda #$01
                    sta $c803
Lc093               lda $c805
                    bit $c803
                    beq Lc0b1
                    ldy $c804
                    ldx #$00
Lc0a0               lda $07e5,x
                    cmp $c048,y
                    bne Lc0b1
                    iny 
                    inx 
                    cpx #$03
                    bne Lc0a0
                    jmp Lc0c4
                    
Lc0b1               asl $c803
                    lda $c804
                    clc 
                    adc #$03
                    sta $c804
                    cmp #$0f
                    bne Lc093
                    jmp Lc065
                    
Lc0c4               lda #$ff
                    sta $c806
                    sta $c807
                    jmp Lc06d
                    
Lc0cf               inc $c806
                    bne Lc0d7
                    inc $c807
Lc0d7               lda $c807
                    ora $c806
                    beq Lc0f2
                    lda $c806
                    cmp #$07
                    lda $c807
                    cmp #$14
                    bcc Lc06d
                    lda #$01
                    sta $96
                    jmp Lc579
                    
Lc0f2               lda #$00
                    sta $96
                    rts 
                    
                    byte $ea 
Sc0f8               tya 
                    pha 
                    lda $029b
                    cmp $029c
                    beq Lc118
                    ldy $029c
                    lda ($f7),y
                    pha 
                    inc $029c
                    lda #$00
                    sta $96
                    pla 
                    sta $0200
                    pla 
                    tay 
                    jmp Lc123
                    
Lc118               lda #$02
                    sta $96
                    lda #$00
                    sta $0200
                    pla 
                    tay 
Lc123               pha 
                    lda #$03
                    sta $ba
                    pla 
                    rts 
                    
Sc12a               ldx #$05
                    jsr kCHKOUT
                    ldx #$00
Lc131               lda $c048,y
                    jsr kCHROUT
                    iny 
                    inx 
                    cpx #$03
                    bne Lc131
                    jmp kCLRCHN
                    
Sc140               sta $c808
                    lda #$00
                    sta $c80b
Lc148               lda #$02
                    sta $62
                    ldy $c808
                    jsr Sc12a
Lc152               lda #$04
                    jsr Lc057
                    lda $96
                    beq Lc162
                    dec $62
                    bne Lc152
                    jmp Lc148
                    
Lc162               ldy #$09
                    jsr Sc12a
                    lda $c80d
                    beq Lc171
                    lda $c808
                    beq Lc190
Lc171               lda $051c
                    sta $c809
                    sta $c817
                    jsr Sc288
                    lda $96
                    cmp #$01
                    beq Lc18f
                    cmp #$02
                    beq Lc162
                    cmp #$04
                    beq Lc18f
                    cmp #$08
                    beq Lc162
Lc18f               rts 
                    
Lc190               lda #$10
                    jsr Lc057
                    lda $96
                    bne Lc162
                    lda #$0a
                    sta $c809
Lc19e               ldy #$0c
                    jsr Sc12a
                    lda #$08
                    jsr Lc057
                    lda $96
                    beq Lc1b1
                    dec $c809
                    bne Lc19e
Lc1b1               rts 
                    
Sc1b2               lda #$01
                    sta $c80b
Lc1b7               lda $c81e
                    beq Lc1c1
                    ldy #$00
                    jsr Sc12a
Lc1c1               lda #$0b
                    jsr Lc057
                    lda $96
                    bne Lc1b7
                    lda #$00
                    sta $c81e
                    lda $c804
                    cmp #$00
                    bne Lc20b
                    lda $c80d
                    bne Lc246
                    inc $c819
                    bne Lc1e3
                    inc $c81a
Lc1e3               jsr Sc36d
                    ldy #$05
                    iny 
                    lda ($64),y
                    cmp #$ff
                    bne Lc205
                    lda #$01
                    sta $c80d
                    lda $c816
                    eor #$01
                    sta $c816
                    jsr Sc36d
                    jsr Sc34d
                    jmp Lc208
                    
Lc205               jsr Sc308
Lc208               lda #$2d
                    byte $2c
Lc20b               lda #$3a
                    jsr Sc5a1
                    ldy #$06
                    jsr Sc12a
                    lda #$08
                    jsr Lc057
                    lda $96
                    bne Lc208
                    jsr Sc36d
                    ldy #$04
                    lda ($64),y
                    sta $c809
                    jsr Sc37a
                    ldx #$05
                    jsr kCHKOUT
                    ldy #$00
Lc232               lda ($64),y
                    jsr kCHROUT
                    jsr Sc601
                    iny 
                    cpy $c809
                    bne Lc232
                    jsr kCLRCHN
                    lda #$00
                    rts 
                    
Lc246               lda #$2a
                    jsr Sc5a1
                    ldy #$06
                    jsr Sc12a
                    lda #$08
                    jsr Lc057
                    lda $96
                    bne Lc246
                    lda #$0a
                    sta $c809
Lc25e               ldy #$0c
                    jsr Sc12a
                    lda #$10
                    jsr Lc057
                    lda $96
                    beq Lc271
                    dec $c809
                    bne Lc25e
Lc271               lda #$03
                    sta $c809
Lc276               ldy #$09
                    jsr Sc12a
                    lda #$00
                    jsr Lc057
                    dec $c809
                    bne Lc276
                    lda #$01
                    rts 
                    
Sc288               ldy #$00
Lc28a               lda #$00
                    sta $c806
                    sta $c807
Lc292               jsr Sc5e4
                    jsr Sc0f8
                    lda $96
                    bne Lc2d8
                    lda $0200
                    sta $0518,y
                    cpy #$03
                    bcs Lc2c2
                    sta $07e5,y
                    cpy #$02
                    bne Lc2c2
                    lda $07e5
                    cmp #$c1
                    bne Lc2c2
                    lda $07e6
                    cmp #$c3
                    bne Lc2c2
                    lda $07e7
                    cmp #$cb
                    beq Lc2cd
Lc2c2               iny 
                    cpy $c809
                    bne Lc28a
                    lda #$01
                    sta $96
                    rts 
                    
Lc2cd               lda #$ff
                    sta $c806
                    sta $c807
                    jmp Lc292
                    
Lc2d8               inc $c806
                    bne Lc2e0
                    inc $c807
Lc2e0               lda $c806
                    ora $c807
                    beq Lc303
                    lda $c806
                    cmp #$06
                    lda $c807
                    cmp #$10
                    bne Lc292
                    lda #$02
                    sta $96
                    cpy #$00
                    beq Lc300
                    lda #$04
                    sta $96
Lc300               jmp Lc579
                    
Lc303               lda #$08
                    sta $96
                    rts 
                    
Sc308               lda $c816
                    eor #$01
                    sta $c816
                    jsr Sc36d
                    ldy #$05
                    lda $c819
                    clc 
                    adc #$01
                    sta ($64),y
                    iny 
                    lda $c81a
                    adc #$00
                    sta ($64),y
                    ldx #$02
                    jsr kCHKIN
                    ldy #$07
Lc32c               jsr kCHRIN
                    sta ($64),y
                    iny 
                    jsr kREADST
                    bne Lc341
                    cpy $c818
                    bne Lc32c
                    tya 
                    pha 
                    jmp Lc34e
                    
Lc341               tya 
                    pha 
                    ldy #$05
                    iny 
                    lda #$ff
                    sta ($64),y
                    jmp Lc34e
                    
Sc34d               pha 
Lc34e               jsr kCLRCHN
                    jsr Sc5d5
                    jsr Lc594
                    jsr Sc5d5
                    ldy #$04
                    lda ($64),y
                    sta $c809
                    jsr Sc37a
                    pla 
                    ldy #$04
                    sta ($64),y
                    jsr Sc389
                    rts 
                    
Sc36d               lda #$18
                    sta $64
                    lda $c816
                    clc 
                    adc #$05
                    sta $65
                    rts 
                    
Sc37a               lda #$18
                    sta $64
                    lda $c816
                    eor #$01
                    clc 
                    adc #$05
                    sta $65
                    rts 
                    
Sc389               lda #$00
                    sta $c812
                    sta $c813
                    sta $c814
                    sta $c815
                    ldy #$04
Lc399               lda $c812
                    clc 
                    adc ($64),y
                    sta $c812
                    bcc Lc3a7
                    inc $c813
Lc3a7               lda $c814
                    eor ($64),y
                    sta $c814
                    lda $c815
                    rol a
                    rol $c814
                    rol $c815
                    iny 
                    cpy $c809
                    bne Lc399
                    ldy #$00
                    lda $c812
                    sta ($64),y
                    iny 
                    lda $c813
                    sta ($64),y
                    iny 
                    lda $c814
                    sta ($64),y
                    iny 
                    lda $c815
                    sta ($64),y
                    rts 
                    
Lc3d9               lda #$00
                    sta $c80d
                    sta $c80c
                    sta $c81f
                    sta $c820
                    lda #$01
                    sta $c81d
                    sta $c816
                    lda #$ff
                    sta $c819
                    sta $c81a
                    jsr Sc37a
                    ldy #$04
                    lda #$07
                    sta ($64),y
                    jsr Sc36d
                    ldy #$05
                    lda #$00
                    sta ($64),y
                    iny 
                    sta ($64),y
Lc40c               jsr Sc1b2
                    beq Lc40c
Lc411               lda #$00
                    sta $0200
                    rts 
                    
Lc417               lda #$01
                    sta $c819
                    lda #$00
                    sta $c81a
                    sta $c81f
                    sta $c820
                    sta $c80d
                    sta $c816
                    sta $051d
                    sta $051e
                    sta $c80c
                    lda #$07
                    sta $051c
                    lda #$00
Lc43d               jsr Sc140
                    lda $c80d
                    bne Lc411
                    jsr Sc499
                    bne Lc486
                    jsr kCLRCHN
                    lda $c809
                    cmp #$07
                    beq Lc46a
                    ldx #$02
                    jsr kCHKOUT
                    ldy #$07
Lc45b               lda $0518,y
                    jsr kCHROUT
                    iny 
                    cpy $c809
                    bne Lc45b
                    jsr kCLRCHN
Lc46a               lda $051e
                    cmp #$ff
                    bne Lc479
                    lda #$01
                    sta $c80d
                    lda #$2a
                    byte $2c
Lc479               lda #$2d
                    jsr Sc5a1
                    jsr Sc5d5
                    lda #$00
                    jmp Lc43d
                    
Lc486               jsr kCLRCHN
                    lda #$3a
                    jsr Sc5a1
                    lda $c817
                    sta $051c
                    lda #$03
                    jmp Lc43d
                    
Sc499               lda $0518
                    sta $c80e
                    lda $0519
                    sta $c80f
                    lda $051a
                    sta $c810
                    lda $051b
                    sta $c811
                    jsr Sc36d
                    lda $c817
                    sta $c809
                    jsr Sc389
                    lda $0518
                    cmp $c80e
                    bne Lc4e0
                    lda $0519
                    cmp $c80f
                    bne Lc4e0
                    lda $051a
                    cmp $c810
                    bne Lc4e0
                    lda $051b
                    cmp $c811
                    bne Lc4e0
                    lda #$00
                    rts 
                    
Lc4e0               lda #$01
                    rts 
                    
Lc4e3               lda #$00
                    sta $c819
                    sta $c81a
                    sta $c81f
                    sta $c820
                    sta $c80d
                    sta $c816
                    sta $c80c
                    lda #$07
                    clc 
                    adc #$01
                    sta $051c
                    lda #$00
Lc504               jsr Sc140
                    lda $c80d
                    bne Lc52c
                    jsr Sc499
                    bne Lc521
                    lda $051f
                    sta $c81b
                    lda #$01
                    sta $c80d
                    lda #$00
                    jmp Lc504
                    
Lc521               lda $c817
                    sta $051c
                    lda #$03
                    jmp Lc504
                    
Lc52c               lda #$00
                    sta $0200
                    rts 
                    
Lc532               lda #$00
                    sta $c80d
                    sta $c80c
                    lda #$01
                    sta $c816
                    sta $c81d
                    lda #$ff
                    sta $c819
                    sta $c81a
                    jsr Sc37a
                    ldy #$04
                    lda #$07
                    clc 
                    adc #$01
                    sta ($64),y
                    jsr Sc36d
                    ldy #$05
                    lda #$ff
                    sta ($64),y
                    iny 
                    sta ($64),y
                    ldy #$07
                    lda $c81b
                    sta ($64),y
                    lda #$01
                    sta $c81e
Lc56e               jsr Sc1b2
                    beq Lc56e
                    lda #$00
                    sta $0200
                    rts 
                    
Lc579               inc $c80c
                    lda $c80c
                    cmp #$03
                    bcc Lc58f
                    lda #$00
                    sta $c80c
                    lda $c80b
                    beq Lc594
                    bne Lc5a0
Lc58f               lda $c80b
                    beq Lc5a0
Lc594               ldx #$00
Lc596               ldy #$00
Lc598               iny 
                    bne Lc598
                    inx 
                    cpx #$78
                    bne Lc596
Lc5a0               rts 
                    
Sc5a1               cmp #$aa
                    beq Lc5d4
                    cmp #$ba
                    bne Lc5b2
                    clc 
                    inc $c81f
                    bcc Lc5b2
                    inc $c820
Lc5b2               clc 
                    ldx #$15
                    ldy #$06
                    jsr kPLOT
                    lda $c81a
                    ldx $c819
                    jsr $bdcd
                    ldx #$15
                    ldy #$14
                    clc 
                    jsr kPLOT
                    lda $c820
                    ldx $c81f
                    jsr $bdcd
Lc5d4               rts 
                    
Sc5d5               jsr $ef7e
                    lda $02a1
                    cmp #$80
                    beq Sc5d5
                    cmp #$92
                    beq Sc5d5
                    rts 
                    
Sc5e4               lda $028d
                    cmp #$02
                    beq Lc5f4
                    lda $dd01
                    and #$10
                    cmp #$10
                    bne Lc5fb
Lc5f4               pla 
                    tsx 
                    cpx $c81c
                    bne Lc5f4
Lc5fb               lda #$01
                    sta $0200
                    rts 
                    
Sc601               lda $02a1
                    and #$01
                    cmp #$01
                    beq Sc601
                    rts 