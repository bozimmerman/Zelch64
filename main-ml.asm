        
        
* = $9538
        ; .O
        ; .D V3.0 ML1
        JMP GETIT; REM 38200
        JMP SEND; REM 38203
        JMP INPT; REM 38206
        JMP SENDBIG; REM 38209
        JMP FILESEND; REM 38212
        JMP TIME; REM 38215
        JMP FILEGET; REM 38218
        JMP CHAP; REM 38221
        JMP DIREC; REM 38224
        JMP HEADER; REM 38227
        JMP GETLINE; REM 38230
        JMP GETINFO; REM 38233
        JMP TERM; REM 38236
        JMP CLOPLEZ; REM 38239
        JMP COUNTFILE; REM 38242
        JMP BLKSFRE; REM 38245
        JMP PRNTNM; REM 38248
        JMP COPYFI; REM 38251
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
JERK
        LDA $02A1
        AND #$01
        BNE JERK
        LDA #$00
        STA $D4
        STA $D8
        LDA $FE
        CMP #$07
        BNE NOSOUND
        JSR SOUND
        LDA $FE
NOSOUND
        CMP #$26
        BEQ NNSSOO
NNNSSO
        CMP #$90
        BEQ TWO
        CMP #$03
        BEQ TWO
        CMP #$93
        BNE STSEN
        JMP CLRHOM
STSEN
        CMP #$13
        BEQ HALF
        CMP #$85
        BNE STSEN3
        JSR COLOR
STSEN3
        NOP
STSEN0
        JSR $FFD2
        LDA $02D0
        BNE HALF
STSEN2
        LDX #$05
        JSR $FFC9
        LDA $02A9
        BEQ FIN2
FIN3
        JSR STAR
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
        LDA $03FF
        BEQ HALF
        LDA #$0A
        JSR $FFD2
        JMP HALF
STAR
        LDA $02C6
        BEQ GOSTAR
        LDA $FE
        CMP #$0D
        BEQ GOSTAR
        CMP #$08
        BEQ GOSTAR
        CMP #$14
        BEQ GOSTAR
        LDA #$2A
        RTS
GOSTAR
        LDA $FE
        RTS
NNSSOO
        LDA #$22
        STA $FE
        JMP NNNSSO
COLOR
        LDX $02AC
        INX
        CPX #$08
        BNE NXCOL
        LDX #$00
NXCOL
        STX $02AC
        LDA $02AD,X
        STA $FE
        RTS
RTINE
        JSR SAVE
        JSR $FFE4
        CMP #$00
        BEQ NXT1
        CMP #$03
        BEQ NXT1
        JMP SYSTORE
NXT1
        LDA $02D0
        BNE GONE
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
        LDA $033D
        BEQ EXOUTR
        RTS
EXOUTR
        LDA $FE
        JSR UPCASE
        STA $FE
        CMP #$22
        BNE OUTHERE
        LDA #$26
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
UPCASE
        LDX $02DB
        CPX #$00
        BEQ RTCASE
        CMP #$0D
        BEQ RTCASE
        CMP #$08
        BEQ RTCASE
        CMP #$14
        BEQ RTCASE
        CMP #$20
        BCC RTYT
        CMP #$40
        BCC RTCASE
RTYT
        CMP #$41
        BCC RTTCASE
        CMP #$60
        BCS RTTCASE
        ORA #$80
RTCASE
        RTS
RTTCASE
        LDA #$00
        RTS
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
        JMP CARON
CREEP
        JSR WRAP
        INC $FB
        JMP TEND
CARON
        LDA $FE
        INC $FB
        CMP #$0D
        BEQ TEND
        LDA $FB
        CMP #$64
        BEQ CREEPE
        LDA $FE
        CMP #$14
        BEQ DELETE
        STA ($FB),Y
        JSR SEND
        LDA $02DE
        CMP $02FA
        BNE LOOP
        JMP CREEP
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
CREEPE
        LDA $FE
        STA ($FB),Y
        INC $FB
        LDA #$03
        STA ($FB),Y
        INC $FB
        JSR SEND
        JMP END
DELETE
        LDX $FB
        DEC $FB
        DEX
        CPX #$04
        BCC JPLOOP
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
JPLOOP
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
TIME
        LDA $DD0B
        STA $FD
        LDA $DD0A
        STA $FE
TIMU
        LDA $DD0B
        LDA $DD08
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
        LDA #$0B
        STA $FB
        LDA $FD
        AND #$10
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        STA $CD04
        LDA $FD
        AND #$0F
        ADC #$30
        STA $CD05
        LDA $FE
        AND #$F0
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        STA $CD07
        LDA $FE
        AND #$0F
        ADC #$30
        STA $CD08
        LDA #$3A
        STA $CD06
        LDA #$4D
        STA $CD0A
        LDA $FD
        AND #$80
        CMP #$00
        BNE TIME1
        LDA #$41
        STA $CD09
        JMP TIMEOUT
TIME1
        LDA #$50
        STA $CD09
TIMEOUT
        LDY #$00
        TYA
        STA ($FB),Y
        JMP FIN1
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
        CMP #$03
        BNE RTNPNT
        RTS
RTNPNT
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
FILESEND
        LDA #$00
        STA $FD
        STA $FC
FILES
        LDX #$08
        JSR $FFC6
        LDX #$00
LOPISS
        STX $CDFF
UUUJ
        JSR $FFE4
        LDX $CDFF
        CMP #$03
        BNE UUJJ
        JSR $FFE4
        LDX $CDFF
        JMP CSEND
UUJJ
        STA $CD00,X
        CMP #$8E
        BNE CMPA
        JSR UPPER
CMPA
        CMP #$0D
        BEQ CSEND
        CMP #$01
        BEQ CSOUT
        LDA $90
        BNE CSOUT
        INX
        JMP LOPISS
CSEND
        LDA #$01
        STA $FD
        STX $CDFF
        LDX #$00
CSENT
        LDA $CD00,X
        STA $FE
        JSR SEND
        JSR RTINE
        LDA $FE
        CMP #$20
        BNE COWQ
        JSR FILEGET
        JMP COW
COWQ
        CMP #$13
        BNE PISS
        JSR PAUSE
PISS
        CPX $CDFF
        BEQ FILES
        INX
        JMP CSENT
CSOUT
        CPX #$00
        BEQ COW
        STX $CDFF
        LDX #$00
CSEOU
        LDA $CD00,X
        STA $FE
        JSR SEND
        CPX $CDFF
        BEQ COW
        INX
        JMP CSEOU
COW
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
UPPER
        LDY #$01
        STY $FC
        RTS
CLOPLEZ
        LDY #$00
        INC $7A
        BNE CLOP1
        INC $7B
CLOP1
        LDA ($7A),Y
        SEC
        SBC #$30
        JSR $F291
        INC $7A
        BNE CLOP2
        INC $7B
CLOP2
        RTS
FILEGET
        LDA #$00
        STA $FD
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
        JSR $FFCC
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
        STA $02D0
        LDA #$12
        STA $FE
        JSR SEND
        LDA #$12
        STA $FE
        JSR SEND
CHAT
        JSR RTINE
        LDA $FE
        BEQ CHAT
        CMP #$88
        BEQ GOTT
        CMP #$92
        BEQ CHAT
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
        JSR $FFCC
        LDA $02CD
        LDY $02CE
        LDX $02CF
        RTS
SAVEE
        STA $02CD
        STY $02CE
        STX $02CF
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
        JSR SAVEE
        LDA $033E
        BEQ CPN
        JSR LOAD
        RTS
CPN
        JSR RTINE
        LDA $FE
        BEQ PAUSE
        CMP #$13
        BEQ PAUSE
        JSR LOAD
        RTS
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
        STA $FB
        JSR $FFE4
        STA $FC
        LDX $FB
        LDA $FC
        JSR $BDCD
        LDX #$05
        JSR $FFC9
        LDX $FB
        LDA $FC
        JSR $BDCD
        LDX #$00
        JSR $FFC9
BEHE
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        CMP #$00
        BEQ CONGO
        CMP #$22
        BEQ QUOTE
KOTE
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
        JSR $FFCC
        RTS
QUOTE
        LDY $FD
        BEQ KOTE
        JSR $FFE4
        CMP $FD
        BEQ YEPP
        JMP KOTE
YEPP
        LDA #$00
        JMP KOTE
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
        JSR $FFCC
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
        JSR $FFCC
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
        JSR $FFCC
        JMP FIN1
TERM
        JSR $FFCC
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
        JSR $FFCC
        LDA $02A9
        BNE CONTERM
        LDX $FE
        LDA $CE00,X
        STA $FE
CONTERM
        LDA #$00
        STA $D4
        STA $D8
        LDA $FE
        JSR $FFD2
        JMP TERM
CLRHOM
        LDX #$03
CLRST
        JSR $E9FF
        CPX #$19
        BEQ CLRCONT
        INX
        JMP CLRST
CLRCONT
        LDX #$00
CLRCO1
        LDA $D9,X
        ORA #$80
        STA $D9,X
        INX
        CPX #$1A
        BEQ CLRGON
        JMP CLRCO1
CLRGON
        LDA #$13
        JSR $FFD2
        LDA #$0D
        JSR $FFD2
        LDA #$0D
        JSR $FFD2
        LDA #$0D
        JSR $FFD2
        JMP STSEN2
SOUND
        LDA #$00
        STA $D404
        LDA #$09
        STA $D405
        LDA #$00
        STA $D406
        LDA #$04
        STA $D418
        LDA #$64
        STA $D401
        LDA #$32
        STA $D400
        LDA #$11
        STA $D404
        RTS
WRAP
        LDA #$00
        STA $02C2
        LDA $02C1
        BNE WRA1
        RTS
WRA1
        LDA $FB
        STA $FD
        LDA $FC
        STA $FE
        LDY #$00
        LDA ($FD),Y
        CMP #$20
        BNE WRA2
        RTS
WRA2
        DEC $FD
        INC $02C2
        LDA $02C2
        CMP #$0A
        BNE WRA3
        RTS
WRA3
        LDA ($FD),Y
        CMP #$20
        BNE WRA2
        INC $02C2
WRA4
        INY
        CPY $02C2
        BEQ WRA5
        LDA ($FD),Y
        STA $0276,Y
        JMP WRA4
WRA5
        LDA $02C2
        STA $C6
        LDA $FD
        STA $FB
LIOP
        LDA #$14
        STA $FE
        JSR SEND
        DEY
        BNE LIOP
        RTS
COUNTFILE
        LDA #$00
        STA $02C2
        LDX #$08
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4
FGLAA
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
COUNTLP
        JSR $FFE4
        LDX $90
        BNE GOCOUNT
        CMP #$00
        BNE COUNTLP
        INC $02C2
        JMP FGLAA
GOCOUNT
        DEC $02C2
        DEC $02C2
        LDX #$00
        JSR $FFC6
        RTS
BLKSFRE
        LDX #$08
        JSR $FFC6
        LDY #$01
BLKSLOP
        JSR SAVEE
        JSR $FFE4
        LDY $02CE
        CPY #$23
        BEQ KEPBLK
        INY
        JMP BLKSLOP
KEPBLK
        STA $02C3
        JSR $FFE4
        STA $02C4
        JSR $FFCC
        RTS
PRNTNM
        LDX #$01
        JSR $FFC9
        LDA #$50
        JSR $FFD2
        LDA #$63
        JSR $FFD2
        LDA $FB
        JSR $FFD2
        LDA $FC
        JSR $FFD2
        LDA $FD
        JSR $FFD2
        LDA #$0D
        JSR $FFD2
        JSR $FFCC
        RTS
COPYFI
        LDX #$08
        JSR $FFC6
        JSR $FFCF
        STA $FE
        LDY $90
        STY $FD
        JSR $FFCC
        LDX #$09
        JSR $FFC9
        LDA $FE
        JSR $FFD2
        JSR $FFCC
        LDY $FD
        BEQ COPYFI
ENDCOPY
        RTS
