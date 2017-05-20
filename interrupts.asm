        
        
* = $CB00
        ; .O
        ; .D V3.1 ML2
        JMP CLOCK
        JMP WHERE
CLOCK
        LDA $02CA
        BNE KEEPIT
        LDA $DD01
        AND #$10
        BNE TOOMUCH
        LDA #$2A
        STA $0427
KEEPIT
        LDA $0380
        BEQ OUTA
INRR
        LDA $0381
        BEQ TOOMUCH
        LDA $0382
        CMP $DD0A
        BNE INRC
        JMP OUTA
TOOMUCH
        LDA #$01
        STA $033E
        LDA #$20
        STA $0427
OUTA
        LDA $DD08
        JMP $EA31
INRC
        LDA $DD0A
        STA $0382
        DEC $0381
        JMP INRR
WHERE
        LDA #$20
        STA $FB
        LDA #$4E
        STA $FC
LOOPP
        LDX #$00
        LDY #$00
        LDA ($FB),Y
        CMP #$1A
        BNE NEXTXT
        INY
        LDA ($FB),Y
        CMP #$18
        BNE NEXTXT
        INY
        LDA ($FB),Y
        CMP #$03
        BNE NEXTXT
        LDA $FB
        CLC
        ADC #$05
        STA $FB
        LDA $FC
        ADC #$00
        STA $FC
        LDX $FB
        LDY $FC
        STX $2B
        STY $2C
        RTS
NEXTXT
        LDA $FB
        CLC
        ADC #$01
        STA $FB
        LDA $FC
        ADC #$00
        STA $FC
        JMP LOOPP
