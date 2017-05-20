        
        
* = $CB00
        ; .O
        ; .D V3.0 ML2
        JMP CLOC1
        JMP WHERE
CLOC1
        SEI
        LDA #$01
        STA $D015
        LDA #$0D
        STA $07F8
        LDA $0286
        STA $D027
        LDA $D6
        CLC
        ASL
        ASL
        ASL
        ADC #$32
        STA $D001
        LDA $D3
        CMP #$28
        BCC NXT4
        SEC
        SBC #$28
NXT4
        CMP #$1F
        BCS NXT5
        ASL
        ASL
        ASL
        ADC #$08
        STA $D000
        LDA #$00
        STA $D010
        JMP CLOCK
NXT5
        SEC
        SBC #$1F
        ASL
        ASL
        ASL
        STA $D000
        LDA #$01
        STA $D010
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
