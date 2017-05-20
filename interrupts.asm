        
        
* = $CB00
        ; .O
        ; .D V2.3 ML2
        JMP CLOC1
        JMP RELOAD
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
RELOAD
        LDA #$07
        LDX #$08
        LDY #$01
        JSR $FE00
        INC $7A
        BNE BELOD
        INC $7B
BELOD
        JSR $B08B
        LDY #$00
LIP 
        LDA ($47),Y
        STA $00FB,Y
        INY
        CPY #$03
        BCC LIP
        LDA $FB
        LDX $FC
        LDY $FD
        JSR $FDF9
        LDX #$00
        LDY #$00
        LDA #$00
        JSR $F49E
        RTS
