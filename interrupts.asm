        
        
* = $CB00
        ; .O
        ; .D V2.4 ML2
        JMP CLOC1
        JMP WHERE
CLOC1
        JSR CLOCK
        JSR CRSR
        JMP $EA31
CRSR
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
        RTS
NXT5
        SEC
        SBC #$1F
        ASL
        ASL
        ASL
        STA $D000
        LDA #$01
        STA $D010
        RTS
CLOCK
        LDA $02CA
        BNE LEAVE
        LDA $DD01
        AND #$10
        BNE TOOMUCH
        LDA $0380
        BEQ OUTA
        LDA $0380
        CMP $DD0B
        BNE OUTA
        LDA $0381
        CMP $DD0A
        BEQ TOOMUCH
        JMP OUTA
TOOMUCH
        LDA #$01
        STA $033E
OUTA
        LDA $DD08
        RTS
LEAVE
        LDA #$00
        STA $033E
        JMP OUTA
WHERE
        LDA #$00
        STA $FB
        LDA #$50
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
