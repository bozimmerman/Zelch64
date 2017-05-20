* = $c000

; windowing setup ml

bREADY = $a474

Lc000               jmp Lc006
                    
Lc003               jmp bREADY
                    
Lc006               lda #$00
                    ldx #$a0
                    jmp Lc03b
                    
Lc00d               lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    lda #$ff
                    ldx #$bf
                    cpx $23
                    beq Lc023
                    bcs Lc02c
                    bcc Lc029
Lc023               cmp $22
                    beq Lc029
                    bcs Lc02c
Lc029               jmp Lc062
                    
Lc02c               lda #$01
                    ldx #$00
                    clc 
                    adc $02b8
                    tay 
                    txa 
                    adc $02b9
                    tax 
                    tya 
Lc03b               sta $02b8
                    stx $02b9
                    lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    ldx #$00
                    ldy #$00
                    lda ($22),y
                    ldy #$00
                    sta ($22),y
                    jmp Lc00d
                    
Lc062               lda #$00
                    ldx #$e0
                    jmp Lc097
                    
Lc069               lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    lda #$ff
                    ldx #$ff
                    cpx $23
                    beq Lc07f
                    bcs Lc088
                    bcc Lc085
Lc07f               cmp $22
                    beq Lc085
                    bcs Lc088
Lc085               jmp Lc0be
                    
Lc088               lda #$01
                    ldx #$00
                    clc 
                    adc $02b8
                    tay 
                    txa 
                    adc $02b9
                    tax 
                    tya 
Lc097               sta $02b8
                    stx $02b9
                    lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    lda $02b8
                    ldx $02b9
                    sta $22
                    stx $23
                    ldx #$00
                    ldy #$00
                    lda ($22),y
                    ldy #$00
                    sta ($22),y
                    jmp Lc069
                    
Lc0be               rts 
                    
                    byte $00 