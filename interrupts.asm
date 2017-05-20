        
        
* = $CB00
        ; .O
        ; .D V3.7 ML2
        JMP CLOCK; LOCK UPS 51968
        JMP WHERE; WHERE TO LOAD PRG FILES 51971
        JMP CLOC1; CRSR 51974
        JMP SETPONT; SOME POKES 51977
        JMP SETIRQ; SET IRQ 51980
        JMP SETP1; RESET BASIC VECTORS 51983
        ;*****************INTERRUPTS
        ; *******CRSR CONTROL
CLOC1
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
        CMP #$1F; SET IF
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
        RTS; **FALLS THRU TO MAIN INTERRUPT
        ;************MAIN INTERRUPT ROUTINE
CLOCK
        SEI; **IGNORE CARRIER IF SYSOP ONLINE
        LDA $02CA
        BNE KEEPIT
        LDA $DD01
        AND #$10
        BNE TOOMUCH; **CARRIER GONE
        LDA #$2A
        STA $0427; ** SET LITTLE STAR!
KEEPIT
        LDA $0380
        BEQ OUTA; **ANYBODY ONLINE
INRR
        LDA $0381
        BEQ TOOMUCH; **TIME UP
        LDA $0382
        CMP $DD0A
        BNE INRC
        JMP OUTA
TOOMUCH
        LDA #$01; *****SET LOGOFF FLAG
        STA $033E
        LDA #$20
        STA $0427; **CLEAR STAR
OUTA
        LDA $DD08; **GET GOING
        JMP ($02DF)
INRC
        LDA $DD0A
        STA $0382
        DEC $0381; **LOOSE ONE TIC
        JMP INRR; BACK TO RECHECK FOR 0 MR
        ;**************WHERE ROUTINE******
WHERE
        JSR SETPT
        LDA #$00
        STA $FB
        LDA $2E ; used to be LDA #$43, in THIS version
        SEC
        SBC #$01
        STA $FC
CLOSEP
        LDX #$00
        LDY #$00
        LDA ($FB),Y
        CMP $02B6
        BNE NEXTXT
        JSR WHETI
        CMP $02B7
        BNE NEXTXT
        JSR WHETI
        CMP $02B8
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
        LDA #$01
        STA $02DC
        RTS
NEXTXT
        LDA $FB
        CLC
        ADC #$01
        STA $FB
        LDA $FC
        ADC #$00
        STA $FC
        JMP CLOSEP
WHETI
        INY
        LDA ($FB),Y
        RTS
SETPONT
        LDA #$69
        STA $2E
        STA $30
        STA $32
        LDA #$00
        STA $2D
        STA $2F
        STA $31
        RTS
SETIRQ
        LDA $0314
        STA $02DF
        LDA $0315
        STA $02E0
        SEI
        LDA #$00
        STA $0314
        LDA #$CB
        STA $0315
        CLI
        RTS
SETPT
        LDY #$00
LOP1
        LDA $002B,Y
        STA $02D1,Y
        INY
        CPY #$0A
        BNE LOP1
        RTS
SETP1
        LDA $02DC
        BEQ SETP2
        LDY #$00
LOP2
        LDA $02D1,Y
        STA $002B,Y
        INY
        CPY #$0A
        BNE LOP2
SETP2
        LDA #$00
        STA $02DC
        RTS
