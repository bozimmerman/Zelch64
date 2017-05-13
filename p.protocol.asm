*=$C000

    LDA #$00
    BIT $03A9
    BIT $06A9
    BIT $09A9
    BIT $0CA9
    BIT $0FA9
    NOP
    JMP $C01B
    JMP $C5D5
    BRK
    BRK
    BRK
    STA $62
    TSX
    STX $C81C
    LDA #$33
    CLC
    ADC $62
    STA $C031
    LDA #$C0
    ADC #$00
    STA $C032
    JMP $C033
    JMP $C057
    JMP $C417
    JMP $C3D9
    JMP $C4E3
    JMP $C532
    BRK
    BRK
    BRK
    BRK
    BRK
    BRK
    EOR
    EOR
    WDM
    MVP
    PHK
    EOR
    WDM
    EOR $8D4E,Y
    ORA $C8
    LDA #$00
    STA $07E5
    STA $07E6
    STA $07E7
    LDA #$00
    STA $C806
    STA $C807
    JSR $C5E4
    JSR $C0F8
    LDA $96
    BNE $C0D2
    LDA $07E6
    STA $07E5
    LDA $07E7
    STA $07E6
    LDA $0200
    STA $07E7
    LDA #$00
    STA $C804
    LDA #$01
    STA $C803
    LDA $C805
    BIT $C803
    BEQ $C0B4
    LDY $C804
    LDX #$00
    LDA $07E5,X
    CMP $C048,Y
    BNE $C0B4
    INY
    INX
    CPX #$03
    BNE $C0A3
    JMP $C0C4
    ASL $C803
    LDA $C804
    CLC
    ADC #$03
    STA $C804
    CMP #$0F
    BNE $C096
    JMP $C065
    LDA #$FF
    STA $C806
    STA $C807
    JMP $C06D
    INC $C806
    BNE $C0DA
    INC $C807
    LDA $C807
    ORA $C806
    BEQ $C0F5
    LDA $C806
    CMP #$07
    LDA $C807
    CMP #$14
    BCC $C070
    LDA #$01
    STA $96
    JMP $C579
    LDA #$00
    STA $96
    RTS
    NOP
    TYA
    PHA
    LDA $029B
    CMP $029C
    BEQ $C11B
    LDY $029C
    LDA ($F7),Y
    PHA
    INC $029C
    LDA #$00
    STA $96
    PLA
    STA $0200
    PLA
    TAY
    JMP $C123
    LDA #$02
    STA $96
    LDA #$00
    STA $0200
    PLA
    TAY
    PHA
    LDA #$03
    STA $BA
    PLA
    RTS
    LDX #$05
    JSR $FFC9
    LDX #$00
    LDA $C048,Y
    JSR $FFD2
    INY
    INX
    CPX #$03
    BNE $C134
    JMP $FFCC
    STA $C808
    LDA #$00
    STA $C80B
    LDA #$02
    STA $62
    LDY $C808
    JSR $C12A
    LDA #$04
    JSR $C057
    LDA $96
    BEQ $C165
    DEC $62
    BNE $C155
    JMP $C148
    LDY #$09
    JSR $C12A
    LDA $C80D
    BEQ $C174
    LDA $C808
    BEQ $C193
    LDA $051C
    STA $C809
    STA $C817
    JSR $C288
    LDA $96
    CMP #$01
    BEQ $C192
    CMP #$02
    BEQ $C165
    CMP #$04
    BEQ $C192
    CMP #$08
    BEQ $C165
    RTS
    LDA #$10
    JSR $C057
    LDA $96
    BNE $C165
    LDA #$0A
    STA $C809
    LDY #$0C
    JSR $C12A
    LDA #$08
    JSR $C057
    LDA $96
    BEQ $C1B4
    DEC $C809
    BNE $C1A1
    RTS
    LDA #$01
    STA $C80B
    LDA $C81E
    BEQ $C1C4
    LDY #$00
    JSR $C12A
    LDA #$0B
    JSR $C057
    LDA $96
    BNE $C1BA
    LDA #$00
    STA $C81E
    LDA $C804
    CMP #$00
    BNE $C20E
    LDA $C80D
    BNE $C249
    INC $C819
    BNE $C1E6
    INC $C81A
    JSR $C36D
    LDY #$05
    INY
    LDA ($64),Y
    CMP #$FF
    BNE $C208
    LDA #$01
    STA $C80D
    LDA $C816
    EOR #$01
    STA $C816
    JSR $C36D
    JSR $C34D
    JMP $C208
    JSR $C308
    LDA #$2D
    BIT $3AA9
    JSR $C5A1
    LDY #$06
    JSR $C12A
    LDA #$08
    JSR $C057
    LDA $96
    BNE $C20B
    JSR $C36D
    LDY #$04
    LDA ($64),Y
    STA $C809
    JSR $C37A
    LDX #$05
    JSR $FFC9
    LDY #$00
    LDA ($64),Y
    JSR $FFD2
    JSR $C601
    INY
    CPY $C809
    BNE $C235
    JSR $FFCC
    LDA #$00
    RTS
    LDA #$2A
    JSR $C5A1
    LDY #$06
    JSR $C12A
    LDA #$08
    JSR $C057
    LDA $96
    BNE $C249
    LDA #$0A
    STA $C809
    LDY #$0C
    JSR $C12A
    LDA #$10
    JSR $C057
    LDA $96
    BEQ $C274
    DEC $C809
    BNE $C261
    LDA #$03
    STA $C809
    LDY #$09
    JSR $C12A
    LDA #$00
    JSR $C057
    DEC $C809
    BNE $C279
    LDA #$01
    RTS
    LDY #$00
    LDA #$00
    STA $C806
    STA $C807
    JSR $C5E4
    JSR $C0F8
    LDA $96
    BNE $C2DB
    LDA $0200
    STA $0518,Y
    CPY #$03
    BCS $C2C5
    STA $07E5,Y
    CPY #$02
    BNE $C2C5
    LDA $07E5
    CMP #$C1
    BNE $C2C5
    LDA $07E6
    CMP #$C3
    BNE $C2C5
    LDA $07E7
    CMP #$CB
    BEQ $C2D0
    INY
    CPY $C809
    BNE $C28D
    LDA #$01
    STA $96
    RTS
    LDA #$FF
    STA $C806
    STA $C807
    JMP $C292
    INC $C806
    BNE $C2E3
    INC $C807
    LDA $C806
    ORA $C807
    BEQ $C306
    LDA $C806
    CMP #$06
    LDA $C807
    CMP #$10
    BNE $C295
    LDA #$02
    STA $96
    CPY #$00
    BEQ $C303
    LDA #$04
    STA $96
    JMP $C579
    LDA #$08
    STA $96
    RTS
    LDA $C816
    EOR #$01
    STA $C816
    JSR $C36D
    LDY #$05
    LDA $C819
    CLC
    ADC #$01
    STA ($64),Y
    INY
    LDA $C81A
    ADC #$00
    STA ($64),Y
    LDX #$02
    JSR $FFC6
    LDY #$07
    JSR $FFCF
    STA ($64),Y
    INY
    JSR $FFB7
    BNE $C344
    CPY $C818
    BNE $C32F
    TYA
    PHA
    JMP $C34E
    TYA
    PHA
    LDY #$05
    INY
    LDA #$FF
    STA ($64),Y
    JMP $C34E
    PHA
    JSR $FFCC
    JSR $C5D5
    JSR $C594
    JSR $C5D5
    LDY #$04
    LDA ($64),Y
    STA $C809
    JSR $C37A
    PLA
    LDY #$04
    STA ($64),Y
    JSR $C389
    RTS
    LDA #$18
    STA $64
    LDA $C816
    CLC
    ADC #$05
    STA $65
    RTS
    LDA #$18
    STA $64
    LDA $C816
    EOR #$01
    CLC
    ADC #$05
    STA $65
    RTS
    LDA #$00
    STA $C812
    STA $C813
    STA $C814
    STA $C815
    LDY #$04
    LDA $C812
    CLC
    ADC ($64),Y
    STA $C812
    BCC $C3AA
    INC $C813
    LDA $C814
    EOR ($64),Y
    STA $C814
    LDA $C815
    ROL
    ROL $C814
    ROL $C815
    INY
    CPY $C809
    BNE $C39C
    LDY #$00
    LDA $C812
    STA ($64),Y
    INY
    LDA $C813
    STA ($64),Y
    INY
    LDA $C814
    STA ($64),Y
    INY
    LDA $C815
    STA ($64),Y
    RTS
    LDA #$00
    STA $C80D
    STA $C80C
    STA $C81F
    STA $C820
    LDA #$01
    STA $C81D
    STA $C816
    LDA #$FF
    STA $C819
    STA $C81A
    JSR $C37A
    LDY #$04
    LDA #$07
    STA ($64),Y
    JSR $C36D
    LDY #$05
    LDA #$00
    STA ($64),Y
    INY
    STA ($64),Y
    JSR $C1B2
    BEQ $C40F
    LDA #$00
    STA $0200
    RTS
    LDA #$01
    STA $C819
    LDA #$00
    STA $C81A
    STA $C81F
    STA $C820
    STA $C80D
    STA $C816
    STA $051D
    STA $051E
    STA $C80C
    LDA #$07
    STA $051C
    LDA #$00
    JSR $C140
    LDA $C80D
    BNE $C414
    JSR $C499
    BNE $C489
    JSR $FFCC
    LDA $C809
    CMP #$07
    BEQ $C46D
    LDX #$02
    JSR $FFC9
    LDY #$07
    LDA $0518,Y
    JSR $FFD2
    INY
    CPY $C809
    BNE $C45E
    JSR $FFCC
    LDA $051E
    CMP #$FF
    BNE $C47C
    LDA #$01
    STA $C80D
    LDA #$2A
    BIT $2DA9
    JSR $C5A1
    JSR $C5D5
    LDA #$00
    JMP $C43D
    JSR $FFCC
    LDA #$3A
    JSR $C5A1
    LDA $C817
    STA $051C
    LDA #$03
    JMP $C43D
    LDA $0518
    STA $C80E
    LDA $0519
    STA $C80F
    LDA $051A
    STA $C810
    LDA $051B
    STA $C811
    JSR $C36D
    LDA $C817
    STA $C809
    JSR $C389
    LDA $0518
    CMP $C80E
    BNE $C4E3
    LDA $0519
    CMP $C80F
    BNE $C4E3
    LDA $051A
    CMP $C810
    BNE $C4E3
    LDA $051B
    CMP $C811
    BNE $C4E3
    LDA #$00
    RTS
    LDA #$01
    RTS
    LDA #$00
    STA $C819
    STA $C81A
    STA $C81F
    STA $C820
    STA $C80D
    STA $C816
    STA $C80C
    LDA #$07
    CLC
    ADC #$01
    STA $051C
    LDA #$00
    JSR $C140
    LDA $C80D
    BNE $C52F
    JSR $C499
    BNE $C524
    LDA $051F
    STA $C81B
    LDA #$01
    STA $C80D
    LDA #$00
    JMP $C504
    LDA $C817
    STA $051C
    LDA #$03
    JMP $C504
    LDA #$00
    STA $0200
    RTS
    LDA #$00
    STA $C80D
    STA $C80C
    LDA #$01
    STA $C816
    STA $C81D
    LDA #$FF
    STA $C819
    STA $C81A
    JSR $C37A
    LDY #$04
    LDA #$07
    CLC
    ADC #$01
    STA ($64),Y
    JSR $C36D
    LDY #$05
    LDA #$FF
    STA ($64),Y
    INY
    STA ($64),Y
    LDY #$07
    LDA $C81B
    STA ($64),Y
    LDA #$01
    STA $C81E
    JSR $C1B2
    BEQ $C571
    LDA #$00
    STA $0200
    RTS
    INC $C80C
    LDA $C80C
    CMP #$03
    BCC $C592
    LDA #$00
    STA $C80C
    LDA $C80B
    BEQ $C597
    BNE $C5A3
    LDA $C80B
    BEQ $C5A3
    LDX #$00
    LDY #$00
    INY
    BNE $C59B
    INX
    CPX #$78
    BNE $C599
    RTS
    CMP #$AA
    BEQ $C5D7
    CMP #$BA
    BNE $C5B5
    CLC
    INC $C81F
    BCC $C5B5
    INC $C820
    CLC
    LDX #$15
    LDY #$06
    JSR $FFF0
    LDA $C81A
    LDX $C819
    JSR $BDCD
    LDX #$15
    LDY #$14
    CLC
    JSR $FFF0
    LDA $C820
    LDX $C81F
    JSR $BDCD
    RTS
    JSR $EF7E
    LDA $02A1
    CMP #$80
    BEQ $C5D8
    CMP #$92
    BEQ $C5D8
    RTS
    LDA $028D
    CMP #$02
    BEQ $C5F7
    LDA $DD01
    AND #$10
    CMP #$10
    BNE $C5FE
    PLA
    TSX
    CPX $C81C
    BNE $C5F7
    LDA #$01
    STA $0200
    RTS
    LDA $02A1
    AND #$01
    CMP #$01
    BEQ $C604
    RTS
