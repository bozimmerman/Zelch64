!--------------------------------------------------
!- Friday, May 12, 2017 11:17:00 PM
!- Import of : 
!- c:\src\zelch64\bak\wheel.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983:A=RND(-TI)
8010 TX$="{clear}{down*3}{f1}WHEEL OF{sh space}FORTUNE!":GOSUB5:TX$="{down*2}{f1}READY TO{sh space}PLAY?{ct c}":GOSUB5
8020 C$="yn":GOSUB66:IFG=2THEN2000
8035 RESTORE
8040 READA$:IFA$<>"qu"THEN8040
8050 TT$(0)=A$:FORI=1TO15:READTT$(I):NEXT
8060 TX$="{f1}OK, CHOOSING{sh space}A{sh space}PUZZLE...":GOSUB5:A=INT(RND(TI)*89)+1:I1=0:I5$=""
8070 OPEN2,DV(1,NP),8,"{pound}wheel,s,r":FORI=1TOA:INPUT#2,I1$:INPUT#2,I2$:NEXTI:CLOSE2
8075 I4$="":FORI=1TOLEN(I1$):Z1(I)=0:IFMID$(I1$,I,1)=" "THENZ1(I)=1
8077 NEXTI
8080 TX$="{down*2}PUZZLE:{ct c}":GOSUB5:FORI=0TO15:IFI2$=TT$(I)THENI5$=TT$(I+1)
8090 NEXTI:TX$=I5$+CR$+"{f1}CASH:"+STR$(I1)+CR$+"{f1}LETTERS TRYED:"+I4$:GOSUB5
8095 TX$="":FORI=1TOLEN(I1$):IFZ1(I)=1THENTX$=TX$+MID$(I1$,I,1):GOTO8097
8096 TX$=TX$+"X"
8097 NEXTI:GOSUB5
8100 TX$="{f1}S)PIN, {f1}G)UESS, {f1}Q)UIT, OR {f1}B)UY{sh space}A VOWEL:{ct c}":GOSUB5:
8105 IFLEN(I4$)>25THENTX$="FORTUNE{sh space}ERROR!":GOSUB5:GOTO2000
8110 C$="qsgb":GOSUB66:ONGGOTO2000,8200,8300,8150
8150 A=0:IFI1<15THENTX$="{f1}COSTS 15 BUCKS!":GOSUB5:GOTO8080
8160 I1=I1-15:TX$="{f1}VOWEL PLEASE:{ct c}":GOSUB5:C$="aeiou":GOSUB66:GOTO8231
8180 TX$="{f1}TRY A, E, I, O, OR U!!!":GOSUB5:I1=I1+10:GOTO8160
8190 IFI1>0THENI1=0
8195 TX$="{f1}BANKRUPT!!":GOSUB5:GOTO8080
8200 TX$="{f1}SPINNING THE WHEEL...":GOSUB5:A=INT(RND(TI)*18):IFA=0THEN8190
8210 TX$="{f1}OK, FOR"+STR$(A*2)+" BUCKS.":GOSUB5:A=A*2
8220 TX$="{f1}CHOOSE A CONSONANT:{ct c}":GOSUB5:C$="bcdfghjklmnpqrstvwxyz":GOSUB66
8231 I$=IN$:C=0:FORI=1TOLEN(I4$):IFI$=MID$(I4$,I,1)THENC=I
8232 NEXTI:IFC>0THENTX$="{f1}ALREADY{sh space}USED!!":GOSUB5:GOTO8220
8240 B=0:FORI=1TOLEN(I1$):IFMID$(I1$,I,1)=I$THENZ1(I)=1:B=B+1
8250 NEXTI:I1=I1+(A*B):A$=STR$(B):IFB=0THENA$=" NO":I1=I1-INT(A/4)
8260 TX$="{f1}THERE ARE"+A$+" '"+I$+"'s.":GOSUB5:I4$=I4$+I$:GOTO8080
8300 TX$="{f1}GUESS THE{sh space}PUZZLE:{ct c}":GOSUB5:GOSUB7:IFI$<>I1$THEN8390
8310 TX$="{f1}CORRECT!":GOSUB5:IFI1<=0THEN8380
8320 TX$="{f1}YOUR WINNINGS GIVE YOU A{sh space}TOTAL":GOSUB5
8330 A=INT(I1/20):TX$="{f1}OF"+STR$(A)+" EXTRA U/D CREDITS.":GOSUB5:CC=CC+A
8335 TX$="{f1}PLAY AGAIN SOON!":GOSUB5:GOTO2000
8380 TX$="{f1}SORRY{sh space}YOU{sh space}DIDN'T WIN ANYTHING...":GOSUB5:GOTO2000
8390 TX$=CR$+"{f1}THE{sh space}PUZZLE{sh space}WAS:"+CR$+I1$:GOSUB5
8395 TX$="{f1}INCORRECT{sh space}GUESS! GAME{sh space}OVER!":GOSUB5:GOTO2000
9000 DATA "qu","QUOTE","ph","PHRASE","th","THING","pe","PERSON OR PEOPLE"
9010 DATA "fc","FICTIONAL CHARACTER","pl","PLACE","ti","TITLE"
9020 DATA "oc","OCCUPATION","la","LANDMARK"
