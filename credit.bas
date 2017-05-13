!--------------------------------------------------
!- Friday, May 12, 2017 11:09:48 PM
!- Import of : 
!- c:\src\zelch64\bak\credit.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8005 X=0:FORI=0TO9:I1(I)=0:NEXT:I5$="@*##J"
8010 TX$="{clear}{down*3}{f1}CREDIT{sh space}MACHINE!"+CR$+"{down*2}{f1}READY{sh space}TO PLAY{sh space}(Y/N)?{ct c}":GOSUB5:C$="yn"
8020 GOSUB66:IFG=2THEN2000
8025 TX$="{f1}YOU HAVE"+STR$(CC)+" CREDITS.":GOSUB5
8030 TX$="{down*2}{f1}AMOUNT{sh space}TO{sh space}BET (5,10,15,20,25)"+CR$+">{ct c}":GOSUB5:GOSUB30
8040 I9=I:IFI>25ORINT(I/5)<>I/5THENTX$="{down*2}{f1}ILLEGAL{sh space}AMOUNT!":GOSUB5:GOTO2000
8045 IFI>CCTHENTX$="{f1}YOU{sh space}DON'T{sh space}HAVE THAT{sh space}MUCH!":GOSUB5:GOTO2000
8047 D=4:IFI>15THEND=5
8050 TX$="{down*2}{f1}SPACE BAR{sh space}TO{sh space}STOP{sh space}EACH WHEEL:":GOSUB5:TX$="SPINNING!!"+CR$+CR$
8060 GOSUB5:IFPEEK(681)=0THENTX$="!-!  !-!  !-!":GOSUB5:GOTO8070
8065 FORI=0TO2:TX$="{f1}{cm q}{up}{left}{cm a}{cm r}{cm s}{down}{left}{cm w}{down}{left}{cm x}{left*2}{cm e}{left*2}{cm z}{up}{right*4}{ct c}":GOSUB5:NEXTI:TX$="{up}":GOSUB5
8070 IFI1(0)=0THENI1=INT(RND(TI)*D):TX$="{f1}{right}"+MID$(I5$,I1+1,1)+"{right*3}{ct c}":GOSUB5
8080 IFI1(1)=0THENI2=INT(RND(TI)*D):TX$="{f1}{right}"+MID$(I5$,I2+1,1)+"{right*3}{ct c}":GOSUB5
8090 IFI1(2)=0THENI3=INT(RND(TI)*D):TX$="{f1}{right}"+MID$(I5$,I3+1,1)+"{right*3}{ct c}":GOSUB5
8110 GOSUB11:IFIN$=" "THENI1(X)=1:X=X+1:IFX=3THEN9000
8115 OU$=CHR$(20):IFPEEK(681)=1THENOU$="{left}"
8120 FORI=2TO0STEP-1:IFI1(I)=0THENFORII=1TO5:GOSUB21:NEXTII
8125 NEXTI:GOTO8070
9000 CC=CC-I9:IFI1=I2ANDI2=I3THENCC=CC+(I9*3):GOTO9100
9020 TX$=CR$+CR$+"{f1}SORRY, YOU{sh space}DIDN'T WIN":GOSUB5:GOTO9300
9100 TX$=CR$+CR$+"{f1}A WINNER!!!!{ct g*5}":GOSUB5:GOTO9300
9300 TX$="{f1}YOU HAVE"+STR$(CC)+" CREDITS{sh space}REMAINING.":GOSUB5
9305 TX$="{down*3}{f1}PLAY AGAIN (Y/N)?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN2000
9310 GOTO8005
