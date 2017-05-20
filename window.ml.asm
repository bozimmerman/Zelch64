*=$C000



    JMP $C006
    JMP $A474
    LDA #$00
    LDX #$A0
    JMP $C03B
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDA #$FF
    LDX #$BF
    CPX $23
    BEQ $C023
    BCS $C02C
    BCC $C029
    CMP $22
    BEQ $C029
    BCS $C02C
    JMP $C062
    LDA #$01
    LDX #$00
    CLC
    ADC $02B8
    TAY
    TXA
    ADC $02B9
    TAX
    TYA
    STA $02B8
    STX $02B9
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDX #$00
    LDY #$00
    LDA ($22),Y
    LDY #$00
    STA ($22),Y
    JMP $C00D
    LDA #$00
    LDX #$E0
    JMP $C097
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDA #$FF
    LDX #$FF
    CPX $23
    BEQ $C07F
    BCS $C088
    BCC $C085
    CMP $22
    BEQ $C085
    BCS $C088
    JMP $C0BE
    LDA #$01
    LDX #$00
    CLC
    ADC $02B8
    TAY
    TXA
    ADC $02B9
    TAX
    TYA
    STA $02B8
    STX $02B9
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDA $02B8
    LDX $02B9
    STA $22
    STX $23
    LDX #$00
    LDY #$00
    LDA ($22),Y
    LDY #$00
    STA ($22),Y
    JMP $C069
    RTS
    BRK
