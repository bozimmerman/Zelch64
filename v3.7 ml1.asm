        * = $9538

        JMP GETIT; 38200,1000,(GET 1 CHARACTER)
        JMP SEND; 38203,2000,(SEND 1 CHARACTER)
        JMP INPT; 38206,3000,(INPUT 1 KEY/MDM LINE)
        JMP SENDBIG; 38209,4000,(SEND 1 KEY/MDM LINE)
        JMP FILESEND; 38212,5000,(SEND DISK FILE OUT)
        JMP TIME; 38215,6000,(CURRENT TIME VARIABLE)
        JMP FILEGET; 38218,7000,(SKIP ONE FILE (RESPONSE,ETC))
        JMP CHAP; 38221,8000,(CHAT MODE SUB)
        JMP DIREC; 38224,9000,(SEND DIREC FORMAT OUT)
        JMP FN; 38227,10000,(READ POSTED BULLETIN FN)
        JMP GETLINE; 38230,11000,(GET 1 SEQ FILE LINE)
        JMP GETLINE; 38233,11000,(GET 1 REL FILE LINE)
        JMP TERM; 38236,13000,(TERMINAL PROGRAM)
        JMP BLOCKS; 38239,14000,(HOW MANY BLKS IS A FILE)
        JMP COUNTFILE; 38242,15000,(COUNT # FILES ON A DISK)
        JMP FILESTART; 38245,16000,(START FILESEND ROUTINE)
        JMP BASIC; 38248,17000,(BASIC PROGRAMMING MODULE)
        JMP COPYFI; 38251,18000,(SEND ONE DRIVE TO ANOTHER)
        ; ***********GET ONE CHARACTER ROUTINE*********
GETIT
        JSR RTINE; **GET IT
        LDA #$FF
        STA $02C7
        LDA $FE
        BNE SUMTHN; **SOMETHING HIT!
        LDA #$00
        STA $FB
        JMP DEFINE
SUMTHN
        STA $CDFF
        LDA #$01
        STA $FB
        JMP DEFINE
        ; ********SEND 1 CHARACTER************
SEND
        JSR SAVE
JERK
        LDA $02A1
        AND #$01
        BNE JERK; **WAIT TILL CLEAR
        LDA #$00
        STA $D4
        STA $D8
        LDA $FE
        CMP #$07
        BNE NOBEEP
        JSR BEEP
        LDA $FE; **BEEP
NOBEEP
        CMP #$8D
        BNE NNNSSO
        JMP NNSSOO; **CONVERT CODE TO QUOTE
NNNSSO
        CMP #$2B
        BEQ HALF; ** NO PLUS SIGNS
        CMP #$90
        BEQ HALF; **NO BLACK
        CMP #$03
        BEQ HALF; ** NO NOTHING
        CMP #$13
        BEQ HALF; **NO HOME
        CMP #$85
        BNE STSEN0
        JSR CYCLE; **COLOR CYCLE
STSEN0
        LDA $02D0
        BNE SYSSEND; **CHECK LOCAL - SEND TO MODEM
        JSR STAR
        STA $FE
        LDA $02A9
        BNE USERSEND
        LDX $FE
        LDA $CF00,X
        STA $FE; **ASCII
USERSEND
        LDX #$05
        JSR $FFC9
        LDA $FE
        JSR $FFD2; **USERSEND
        LDA $FE
        CMP #$0D
        BNE SYSSEND
        LDA $02AA
        BEQ SYSSEND
        LDA #$0A
        JSR $FFD2; **LINEFEEDS
SYSSEND
        JSR $FFCC
        LDA $FE
        CMP #$93
        BNE SYSSEND2
        JMP CLRHOM
SYSSEND2
        LDA $02A9
        BNE STSENA
        LDA $02D0
        BEQ SYSASCII
        LDX $FE
        LDA $CF00,X
        STA $FE
SYSASCII
        LDX $FE
        LDA $CE00,X
        STA $FE; **ASCII
STSENA
        LDA $FE
        JSR $FFD2
HALF
        LDA #$00
        STA $D015
        JSR LOAD
        RTS
STAR
        LDA $02C6
        BEQ NOSTAR; **HIDDEN LETTERS
        LDA $FE
        CMP #$0D
        BEQ NOSTAR
        CMP #$08
        BEQ NOSTAR
        CMP #$14
        BEQ NOSTAR
        LDA #$2A
        STA $FE; **STAR
NOSTAR
        LDA $FE
        RTS
NNSSOO
        LDA #$22
        STA $FE
        JMP NNNSSO; **POUND TO QUOTE
CYCLE
        LDX $02AC
        INX; **COLOR CYCLE
        CPX #$08
        BNE NXCOL
        LDX #$00
NXCOL   
        STX $02AC
        LDA $02AD,X
        STA $FE
        RTS
        ; ************INPUT LINE FROM KEYBOARD/MODEM*********
INPT
        JSR REST
        JSR CLEAR
        TAY
        STA $02DE; **CURRENT COLUMN
INPTLP
        JSR RTINE
        LDA $033E
        BNE TEND; **CARRIER DROPPED
        LDA $FE
        BEQ INPTLP; **NULL
        JSR CKGOOD
        LDA $FE
        CMP #$0D
        BEQ TEND; **RETURN
        CMP #$14
        BEQ INSTDEL; **BACKSPACE
        LDA $FB
        CMP $02BB
        BEQ CREEPE; **60 SAVES YET
        LDY #$00
        LDA $FE
        STA ($FB),Y
        INC $FB; **STORE
        JSR SEND
        LDA $02DE
        CMP $02FA
        BNE INPTLP; **WRAP/RETURN YET
        JSR WRAP
TEND
        LDA #$0D
        STA $FE; **HIT RETURN
        JSR SEND
        JMP DEFINE
CREEPE
        LDA $FE
        STA ($FB),Y; **ADD LINK
        INC $FB
        LDA #$03
        STA ($FB),Y
        INC $FB
        JSR SEND
        JMP DEFINE
INSTDEL
        LDA $FB; **BACKSPACE
        CMP #$00
        BEQ JPINPTLP
        DEC $FB
        LDA ($FB),Y
        CMP #$91
        BNE NXT6; **CRSR UP
        LDA #$11
        STA $FE
        JSR SEND
        JMP INPTLP
NXT6
        CMP #$11
        BNE NXT7; ** CRSR OPENWN
        LDA #$91
        STA $FE
        JSR SEND
JPINPTLP
        JMP INPTLP
NXT7
        CMP #$9D
        BNE NXT0; **CRSR LEFT
        LDA #$1D
        STA $FE
        JSR SEND
        JMP INPTLP
NXT0
        CMP #$1D
        BEQ DEL; **CRSR RIGHT
        CMP #$8D
        BEQ DEL
        CMP #$20
        BCC NODEL; **NO - LISTS-ETC.
        CMP #$80
        BCC DEL
        CMP #$A0
        BCC NODEL
        CMP #$FF
        BCC DEL
NODEL
        CMP #$FF
        BEQ DEL
        JMP INPTLP
DEL     
        LDA #$14
        STA $FE
        JSR SEND
        DEC $02DE
        JMP INPTLP
        ; *************SEND LINE TO SCREEN/MODEM*********
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
LPUP
        LDA ($FC),Y
        STA $FE
        JSR SEND
        INY
        CPY $FB
        BEQ AWOUT
        JMP LPUP
AWOUT
        CMP #$03
        BNE RTNPNT
        RTS
RTNPNT
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
        ; ***********SEND WHOLE FILE TO SCREEN/MODEM***********
FILESEND
        LDA #$00
        STA $FD
        STA $FC
FILES
        LDX #$02
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
        BEQ CSOUT; **OUT ON END OF FILE MARKER
        LDA $90
        BNE CSOUT
        INX
        CPX #$FD
        BNE LOPISS
        DEX
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
CSEAU
        LDA $CD00,X
        STA $FE
        JSR SEND
        CPX $CDFF
        BEQ COW
        INX
        JMP CSEAU
COW 
        LDA #$0D
        STA $FE
        JSR SEND
        RTS
UPPER
        LDY #$01
        STA $FC
        RTS
        ; ************CURRENT TIME INTO VARIABLE*************
TIME
        LDA $DD0B
        STA $FD
        LDA $DD0A
        STA $FE
TIMU
        LDA $DD0B
        LDA $DD08
        JSR REST
        JSR CLEAR; **SET UP
        LDA #$07
        STA $FB; **LENGTH
        LDA $FD
        AND #$10
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        STA $CD00
        LDA $FD
        AND #$0F
        ADC #$30
        STA $CD01
        LDA #$3A
        STA $CD02
        LDA $FE
        AND #$F0
        LSR
        LSR
        LSR
        LSR
        ADC #$30
        STA $CD03
        LDA $FE
        AND #$0F
        ADC #$30
        STA $CD04
        LDA #$4D
        STA $CD06
        LDA $FD
        AND #$80
        CMP #$00
        BNE TIME1
        LDA #$41
        STA $CD05
        JMP DEFINE
TIME1
        LDA #$50
        STA $CD05
        JMP DEFINE
        ; ********GET ONE DISK LINK FILE*******
FILEGET
        LDA #$00
        STA $FD
        LDX #$02
        JSR $FFC6
FILET
        JSR $FFE4
        STA $FE
        LDA $90
        BNE OVER; **END OF SEQ FILE
        LDA $FE
        CMP #$01
        BEQ OVER; **END OF LINKED FILE
        JMP FILET
OVER
        JSR $FFCC
        RTS
        ; ************CHAT MODE*********
CHAP
        LDY #$00
        LDA #$20
        STA $045E; **TURN =$ CHAT FLAG
        LDA #$00
        STA $02D0; **LOCAL OFF
        LDA $033D
        CMP #$01
        BNE CNCHP; **ALREADY IN CHAT
        RTS
CNCHP
        LDA #$01
        STA $033D
        LDA $0381
        STA $02AB
        LDA #$12
        STA $FE
        JSR SEND
CHAT
        JSR RTINE
        LDA $FE
        BEQ CHAT; **NULL
        CMP #$88
        BEQ GOTT; **GET
        CMP #$92
        BEQ CHAT; **NO NO-RVS
        JSR SEND
        LDA #$12
        STA $FE
        JSR SEND
        JMP CHAT
GOTT
        LDA #$92
        STA $FE
        JSR SEND
        LDA $02AB
        STA $0381
        LDA #$00
        STA $033D
        STA $033E
        RTS
        ; ************SEND DIRECTORY
DIREC
        LDX #$02
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4; **GET USELESS
FGLA
        LDX #$02
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4; **GET USELESS
        LDA $90
        CMP #$40
        BEQ GOGONE; **END OF DIREC
        JSR $FFE4
        STA $FB
        JSR $FFE4
        STA $FC
        LDX $FB
        LDA $FC
        JSR $BDCD; **BLOCKS
        LDX #$05
        JSR $FFC9
        LDX $FB
        LDA $FC
        JSR $BDCD; **BLOCKS
        LDX #$00
        JSR $FFC9
BEHE
        LDX #$02
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
        JSR RTINE; **SPACE BAR
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
        ; ************READ POSTED MESSAGE HEADER**********
FN 
        LDA #$02
        STA $02E1
DISGET
        LDX #$02
        JSR $FFC6
        JSR REST
        JSR CLEAR
        LDA #$00
        STA $FD
HELOP
        JSR $FFE4
        STA $FE
        LDA $90
        BNE ERR1
        LDA $FB
        CMP #$FD
        BEQ ERR1
        LDA $FE
        CMP $02E1
        BEQ OUTHE
        LDY #$00
        STA ($FB),Y
        INC $FB
        JMP HELOP
ERR1
        LDA #$01
        STA $FD
OUTHE
        JSR $FFCC
        JMP DEFINE
        ; ***********GET ONE LINE FROM DISK******
GETLINE
        LDA #$0D
        STA $02E1
        JMP DISGET
        ; *************TERMINAL PROGRAM
TERM
        JSR $FFCC
        JSR $CB06
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
        BNE N3TERM; ***GET F/
        RTS
N3TERM
        LDA $02A9
        BNE N4TERM; **GFX
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
        ; ********COUNT BLKS IN FILE
BLOCKS
        LDX #$02
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
BPSEEP 
        JSR $FFE4
        CMP #$00
        BNE BPSEEP
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        STA $FB
        JSR $FFE4
        STA $FC
BPSEEP2
        JSR $FFE4
        CMP #$00
        BNE BPSEEP2
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        STA $02C3
        JSR $FFE4
        STA $02C4
        JSR $FFCC
        RTS
        ; ************COUNT FILES ON DISK*******
COUNTFILE
        LDA #$00
        STA $02C2
        LDX #$02
        JSR $FFC6
        JSR $FFE4
        JSR $FFE4; ***GET USELESS
FGLAA
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4
        JSR $FFE4; **MORE USELESS
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
        ; ********BLOCKS FREE ON DISK
FILESTART
        RTS
        ; ********BASIC PROGRAMMING
BASIC
        RTS
        ; *********COPY DRIVE TO DRIVE
COPYFI
        LDA #$78
        STA $FD
        LDA #$04
        STA $FE
        LDA #$00
        STA $FC
COPLOP
        LDX #$02
        JSR $FFC6
        JSR $FFCF
        LDY #$00
        STA ($FD),Y
        CLC
        LDA $FD
        ADC #$01
        STA $FD
        LDA $FE
        ADC #$00
        STA $FE
        LDA $90
        BNE COPSND
        LDA $FE
        CMP #$07
        BNE COPLOP
        LDA $FD
        CMP #$E7
        BNE COPLOP
        JMP COPSND1
COPSND
        STA $FC
COPSND1
        LDA $FD
        STA $02B9
        LDA $FE
        STA $02BA
        LDA #$78
        STA $FD
        LDA #$04
        STA $FE
        JSR $FFCC
        LDX #$03
        JSR $FFC9
COPLOP2
        LDY #$00
        LDA ($FD),Y
        JSR $FFD2
        CLC
        LDA $FD
        ADC #$01
        STA $FD
        LDA $FE
        ADC #$00
        STA $FE
        LDA $FD
        CMP $02B9
        BNE COPLOP2
        LDA $FE
        CMP $02BA
        BNE COPLOP2
        JSR $FFCC
        LDA $FC
        BEQ COPYFI
        RTS
        ; **************SYSTEM ROUTINES***********************
        ; *****SET UP FOR VARIABLE DEFINITION
REST
        LDA #$CD
        STA $FC
        LDA #$00
        STA $FB
        LDA #$00
        STA $02C7
        RTS
        ; ************GET A LETTER FROM MODEM/KEYBOARD
RTINE
        JSR SAVE
        JSR $FFE4
        CMP #$00
        BEQ NXT1
        JMP SYSTORE
NXT1
        LDA $02D0
        BNE GONE
        LDX #$05
        JSR $FFC6
        JSR $FFE4
        STA $FE
        JSR $FFCC
        LDA $FE
        CMP #$00
        BEQ GONE
        CMP #$03
        BEQ GONE
        JMP USERSTORE
SYSTORE
        STA $FE
        CMP #$85
        BNE COC; **CHAT
        JSR CHAP
COC 
        CMP #$8C
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
        LDA #$8D
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
        ; *******************- SUB ROUTINE***********
CKGOOD
        LDA $FE
        CMP #$9D
        BNE STGOOD
        LDA $02DE
        BEQ STGOOD
        DEC $02DE
STGOOD
        LDA $FE
        CMP #$8D
        BEQ GOD1
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
        ; *****************ASSORTED ROUTINES******
SAVE
        STA $02CD
        STY $02CE
        STX $02CF
        JSR $CB06
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
        JSR $CB06
        RTS
CLEAR
        LDY #$00
        LDA #$00
        STA ($FB),Y
        INC $FB
        LDA $FB
        CMP #$FD
        BNE CLEAR
        LDA #$00
        STA $FB
        RTS
PAUSE
        JSR SAVEE
PAP 
        LDA $033E
        BEQ CPN
        JSR LOAD
        RTS
CPN 
        JSR $CB06
        JSR RTINE
        LDA $FE
        BEQ PAP
        CMP #$13
        BEQ PAP
        JSR LOAD
        RTS
        ; *************CLEAR WITHOUT HOME
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
        JMP HALF
        ; ****************BEEP!
BEEP
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
        ; *************WORD WRAP
WRAP
        LDA #$00
        STA $02C2
        LDA $02C1
        BNE WRA1
        RTS
WRA1
        LDA $FB
        STA $FD
        DEC $FD
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
        LDY #$00
WRA4
        INY
        CPY $02C2
        BEQ WRA5
        LDA ($FD),Y
        STA $0276,Y
        JMP WRA4
WRA5
        LDX $02C2
        DEX
        STX $C6
        LDA $FD
        STA $FB
        DEY
LIOP
        LDA #$14
        STA $FE
        JSR SEND
        DEY
        BNE LIOP
        RTS
        ; *********DEFINE VARIABLES*****
DEFINE
        LDA $02C7
        BEQ DEFINPT
        LDA #$FF
        STA $690A
        LDA #$CD
        STA $690B
        LDA $FB
        STA $6909
        RTS
DEFINPT
        LDA #$00
        STA $6903
        LDA #$CD
        STA $6904
        LDA $FB
        STA $6902
        RTS
