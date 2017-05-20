        
        
* = $CB00
        ; .O
        ; .S
        ; .D V1.5 ML2
CLOC1
        JSR CLOCK
        LDA #$00
        STA $D4
        STA $D8
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
        JSR CRSR
DIP 
        LDA $02CA
        BNE LEAVE
        LDA $02C9
        BNE OUTA
        LDA $DD01
        AND #$10
        BNE TOOMUCH
        LDA $0380
        BEQ LEAVE
        LDA $DC0B
        CMP $0380
        BNE OUTA
        LDA $0381
        CMP #$57
        BCS CHANGEIT
        LDA $DC0A
        CMP $0381
        BCC OUTA
        LDA #$01
        STA $02C9
TOOMUCH
        LDA #$01
        STA $033E
OUTA
        LDA $DC08
        RTS
CHANGEIT
        LDA #$56
        STA $0381
        JMP DIP
LEAVE
        LDA #$00
        STA $033E
        JMP OUTA
