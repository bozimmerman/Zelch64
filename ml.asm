        
        
* = $C000
        ; .O
        ; .S
        ; .D \V1.0 ML
        JMP GETIT; REM 49152
        JMP SEND; REM 49155
        JMP INPT; REM 49158
        JMP SENDBIG; REM 49161
        JMP FILESEND; REM 49164
        JMP CLOC1; REM 49167
        JMP FILEGET; REM 49170
        JMP CHAP; REM 49173
        JMP DIREC; REM 49176
        JMP HEADER; REM 49179
        JMP GETLINE; REM 49182
        JMP GETINFO; REM 49185
        JMP TERM; REM 49188
REST
        LDA $7A; *********
        STA $02A7
        LDA $7B
        STA $02A8
        LDA #$CD
        STA $7B
        STA $FC
        LDA #$00
        STA $7A
        STA $FB
        RTS
GETIT
        JSR REST; *BEGINNING
        JSR RTINE
        LDA #$49
        STA $CD00
        LDA #$4E
        STA $CD01
        LDA #$24
        STA $CD02
        LDA #$B2
        STA $CD03
        LDA #$22
        STA $CD04
        LDA $FE
        BEQ YUCK
        JMP FINI
YUCK
        LDA #$22
        STA $CD05
        LDA #$00
        STA $CD06
FIN1
        JSR $A9A5
        LDA $02A7
        STA $7A
        LDA $02A8
        STA $7B
        RTS
FINI
        STA $CD05
        LDA #$22
        STA $CD06
        LDA #$00
        STA $CD07
        JMP FIN1
SEND
        JSR SAVE
        LDA $FE
        CMP #$90
        BEQ TWO
        JSR $FFD2
        LDA $02A9
        BEQ FIN2
FIN3
        LDX #$05
        JSR $FFC9
        LDA $FE
        JSR $FFD2
        JMP TWO
FIN2
        LDX $FE
        LDA $CF00,X
        STA $FE
        JMP FIN3
TWO     
        LDA $FE
        CMP #$0D
        BEQ THREE
HALF
        JSR LOAD
        RTS
THREE
        LDA #$0A
        JSR $FFD2
        JMP HALF
RTINE
        JSR SAVE
        JSR $FFE4
        CMP #$00
        BEQ NXT1
        CMP #$03
        BEQ NXT1
        JMP SYSTORE
NXT1
        LDX #$05
        JSR $FFC6
        JSR $FFE4
        CMP #$00
        BEQ GONE
        CMP #$03
        BEQ GONE
        JMP USERSTORE
SYSTORE
        STA $FE
        CMP #$85
        BNE COC
        JSR CHAP
COC     
        CMP #$89
        BNE EXOUT
        LDA #$01
        STA $033E
        JMP EXOUT
USERSTORE
        STA $FE
        LDA $02A9
        BEQ ALEND
EXOUT
        LDA $FE
        CMP #$22
        BNE OUTHERE
        LDA #$27
        STA $FE
OUTHERE
        JSR LOAD
        RTS
GONE
        LDA #$00
        STA $FE
        JMP OUTHERE
ALEND
        LDX $FE
        LDA $CE00,X
        STA $FE
        JMP EXOUT
INPT
        JSR REST
        JSR CLEAR
        LDY #$03
        STY $FB
        LDA #$00
        STA $02DE
        LDA #$49
        STA $CD00
        LDA #$24
        STA $CD01
        LDA #$B2
        STA $CD02
        LDA #$22
        STA $CD03
LOOP
        JSR RTINE
        LDA $033E
        BNE END
        LDY #$00
        LDA $FE
        BEQ LOOP
        JSR CKGOOD
        LDA $02DE
        CMP #$27
        BNE CARON
        JSR SEND
        LDA $FE
        INC $FB
        STA ($FB),Y
        INC $FB
        LDA #$0D
        STA $FE
        JSR SEND
        JMP END
CARON
        LDA $FE
        INC $FB
        CMP #$0D
        BEQ TEND
        LDA $FB
        CMP #$F0
        BEQ END
        LDA $FE
        CMP #$14
        BEQ DELETE
        STA ($FB),Y
        JSR SEND
        JMP LOOP
END     
        LDA #$22
        LDY #$00
        STA ($FB),Y
        INC $FB
        LDA #$00
        STA ($FB),Y
        JMP FIN1
TEND
        LDA #$0D
        STA $FE
        JSR SEND
        JMP END
DELETE
        LDX $FB
        DEC $FB
        DEX
        CPX #$04
        BCC LOOP
        LDA ($FB),Y
        DEC $FB
        CMP #$91
        BNE NXT6
        LDA #$11
        STA $FE
        JSR SEND
        JMP LOOP
NXT6
        CMP #$11
        BNE NXT7
        LDA #$91
        STA $FE
        JSR SEND
        JMP LOOP
NXT7
        CMP #$9D
        BNE NXT0
        LDA #$1D
        STA $FE
        JSR SEND
        JMP LOOP
NXT0
        CMP #$1D
        BEQ DEL
        CMP #$20
        BCC NODEL
        CMP #$80
        BCC DEL
        CMP #$A0
        BCC NODEL
        CMP #$FF
        BCC DEL
NODEL
        CMP #$FF
        BEQ DEL
        JMP LOOP
DEL     
        LDA #$14
        STA $FE
        JSR SEND
        DEC $02DE
        JMP LOOP
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
        NOP
        NOP
        NOP
SENDBIG
        INC $7A
        BNE BEGIG
        INC $7B
BEGIG
        JSR $B08B
        LDY #$00
LALE
        LDA ($47),Y
        STA $00FB,Y
        INY
        CPY #$03
        BCC LALE
        LDY #$00
LOOPUP
        LDA ($FC),Y
        STA $FE
        JSR SEND
        INY
        CPY $FB
        BEQ AWOUT
        JMP LOOPUP
AWOUT
        CMP #$3A
        BNE RTNPNT
        RTS
RTNPNT
        LDA #$0D
        STA $FE
        JSR SEND
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
FILESEND
        LDA #$00
        STA $FD
        STA $02CC
FILES   
        JSR RTINE
        LDA $FE
        CMP #$20
        BEQ DATSALL
        CMP #$13
        BNE PISS
        JMP PAUSE
PISS
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        STA $FE
        LDA $90
        BNE DAIT
        JSR $FFE4
        STA $FB
        LDA $90
        BEQ CSEND
        JSR SEND
        LDA $FB
        STA $FE
        JMP DAIT
CSEND
        LDX #$00
        JSR $FFC6
        LDA $FE
        CMP #$01
        BEQ DATSALL
        LDA $FB
        CMP #$01
        BNE CONSEND
        JSR SEND
        JMP DATSALL
CONSEND
        LDA #$01
        STA $FD
        JSR SEND
        LDA $FB
        STA $FE
        JSR SEND
        JMP FILES
DATSALL
        LDX #$00
        JSR $FFC6
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
DAIT
        LDX #$00
        JSR $FFC6
        JSR SEND
        JMP DATSALL
CLOC1
        JSR CLOCK
        LDA #$00
        STA $D4
        STA $D8
        JMP $EA31
FILEGET
        LDA #$00
        STA $FD
        STA $02CC
        LDX #$08
        JSR $FFC6
FILET
        JSR $FFE4
        STA $FE
        LDA $90
        BNE OVER
        LDA $FE
        CMP #$01
        BEQ OVER
        JMP FILET
OVER
        LDX #$00
        JSR $FFC6
        RTS
CHAP
        LDY #$00
        LDA $033D
        CMP #$01
        BNE CNCHP
        RTS
CNCHP
        LDA #$01
        STA $033D
        LDA #$12
        STA $FE
        JSR SEND
        LDA #$00
        STA $D020
CHAT
        JSR RTINE
        LDA $FE
        BEQ CHAT
        CMP #$88
        BEQ GOTT
        JSR SEND
        LDA #$12
        STA $FE
        JSR SEND
        JMP CHAT
GOTT
        LDA #$92
        STA $FE
        JSR SEND
        LDA #$00
        STA $033D
        RTS
SAVE
        STA $02CD
        STY $02CE
        STX $02CF
LOAD
        LDX #$00
        JSR $FFC6
        LDX #$00
        JSR $FFC9
        LDA $02CD
        LDY $02CE
        LDX $02CF
        RTS
CLEAR
        LDY #$00
        LDA #$00
        STA ($FB),Y
        INC $FB
        LDA $FB
        CMP #$FE
        BNE CLEAR
        RTS
PAUSE
        LDA $033E
        BEQ CPN
        RTS
CPN     
        JSR RTINE
        LDA $FE
        BEQ PAUSE
        CMP #$13
        BEQ PAUSE
        JMP PISS
DIREC
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4
FGLA
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4
        LDA $90
        CMP #$40
        BEQ GOGONE
        JSR $FFE4
        JSR $FFE4
BEHE
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        CMP #$00
        BEQ CONGO
        STA $FE
        LDX #$00
        JSR $FFC6
        LDA $FE
        JSR SEND
        JSR RTINE
        LDA $FE
        CMP #$20
        BEQ GOGONE
        JMP BEHE
CONGO   
        LDX #$00
        JSR $FFC6
        LDA #$0D
        STA $FE
        JSR SEND
        JMP FGLA
GOGONE
        LDX #$00
        JSR $FFC6
        RTS
HEADER
        LDX #$08
        JSR $FFC6
        JSR REST
        JSR CLEAR
        LDA #$00
        STA $FD
        LDA #$49
        STA $CD00
        LDA #$24
        STA $CD01
        LDA #$B2
        STA $CD02
        LDA #$22
        STA $CD03
        LDA #$04
        STA $FB
HELOOP  
        JSR $FFE4
        STA $FE
        LDA $90
        BNE ERR1
        LDA $FE
        CMP #$02
        BEQ OUTHE
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP HELOOP
OUTHE   
        LDA #$22
        STA ($FB),Y
        INC $FB
        LDA #$00
        STA ($FB),Y
        LDX #$00
        JSR $FFC6
        JMP FIN1
ERR1
        LDA #$01
        STA $FD
        JMP OUTHE
GETLINE
        LDX #$08
        JSR $FFC6
        JSR REST
        JSR CLEAR
        LDA #$00
        STA $FD
        LDA #$49
        STA $CD00
        LDA #$24
        STA $CD01
        LDA #$B2
        STA $CD02
        LDA #$22
        STA $CD03
        LDA #$04
        STA $FB
GELOOP
        JSR $FFE4
        STA $FE
        LDA $90
        BNE ERR2
        LDA $FE
        CMP #$0D
        BEQ OUTGE
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP GELOOP
OUTGE
        LDA #$22
        STA ($FB),Y
        INC $FB
        LDA #$00
        STA ($FB),Y
        LDX #$00
        JSR $FFC6
        JMP FIN1
ERR2
        LDA #$01
        STA $FD
        JMP OUTGE
CKGOOD
        LDA $FE
        CMP #$9D
        BNE STGOOD
        LDA $02DE
        BEQ STGOOD
        DEC $02DE
STGOOD
        LDA $FE
        CMP #$1D
        BEQ GOD1
        CMP #$20
        BCC GOD2
        CMP #$80
        BCC GOD1
        CMP #$A0
        BCC GOD2
        CMP #$FF
        BCC GOD1
        RTS
GOD1
        INC $02DE
GOD2
        RTS
GETINFO
        LDX #$02
        JSR $FFC6
        JSR REST
        JSR CLEAR
        LDA #$49
        STA $CD00
        LDA #$24
        STA $CD01
        LDA #$B2
        STA $CD02
        LDA #$22
        STA $CD03
        LDA #$04
        STA $FB
GEINFO
        JSR $FFE4
        STA $FE
        LDA $FB
        CMP #$15
        BEQ OUTIN
        LDA $FE
        CMP #$0D
        BEQ OUTIN
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP GEINFO
OUTIN
        LDA #$22
        STA ($FB),Y
        INC $FB
        LDA #$00
        STA ($FB),Y
        LDX #$00
        JSR $FFC6
        JMP FIN1
TERM
        LDX #$00
        JSR $FFC6
        LDX #$00
        JSR $FFC9
        JSR $FFE4
        CMP #$00
        BEQ NXTERM
        CMP #$03
        BEQ NXTERM
        STA $FE
        CMP #$86
        BNE N2TERM
        LDA $02A9
        EOR #$01
        STA $02A9
        JMP NXTERM
N2TERM
        CMP #$89
        BNE N3TERM
        RTS
N3TERM  
        LDA $02A9
        BNE N4TERM
        LDX $FE
        LDA $CF00,X
        STA $FE
N4TERM
        LDX #$05
        JSR $FFC6
        LDX #$05
        JSR $FFC9
        LDA $FE
        JSR $FFD2
NXTERM
        LDX #$05
        JSR $FFC6
        LDX #$05
        JSR $FFC9
        JSR $FFE4
        CMP #$00
        BEQ TERM
        CMP #$03
        BEQ TERM
        STA $FE
        LDX #$00
        JSR $FFC6
        LDX #$00
        JSR $FFC9
        LDA $02A9
        BNE CONTERM
        LDX $FE
        LDA $CE00,X
        STA $FE
CONTERM
        LDA $FE
        JSR $FFD2
        JMP TERM
