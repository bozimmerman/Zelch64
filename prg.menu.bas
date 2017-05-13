!--------------------------------------------------
!- Friday, May 12, 2017 11:13:31 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.menu.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8010 TX$="{clear}{f1}ONLINE PROGRAM{sh space}SECTION{down*2}":GOSUB5:FI$="{pound}pgmenu":GOSUB25
8020 GOSUB64:TX$=TX$+"{f1}PRG {f1}"+CHR$(NP+193)+"{white}:{ct c}":GOSUB5
8030 C$="?"+C$(5):GOSUB19:E$="prg:"+IN$:GOSUB9:IFASC(IN$)>192THEN8210
8035 IFASC(IN$)>96THEN8200
8040 ONGGOTO8080,8100,8070,8300,2000
8070 FI$="{pound}section "+CHR$(NP+65):NN=1:VD=DV(1,NP):GOSUB25:GOTO8020
8080 FI$="{pound}pgmenu":NN=1:GOSUB25:GOTO8020
8100 TX$=CR$+"{f1}PROGRAM #{ct c}":GOSUB5:GOSUB30:IFI=0THEN8020
8110 I$="{pound}pgm "+CHR$(NP+65)+STR$(I):OPEN2,DV(1,NP),2,"0:"+I$+",p,r":CLOSE2
8120 INPUT#DV(1,NP),E:IFE>0THENTX$="{f1}FILE{sh space}NOT{sh space}FOUND!":GOSUB5:GOTO8020
8130 TX$="{f1}LOADING...":GOSUB5:GOTO8400
8200 IN$=CHR$(ASC(IN$)+96)
8210 I=ASC(IN$)-193:IFI=NPORAC<AC(1,I)THEN8020
8220 NP=I:TX$=CR$+"{f1}ENTERING:{white}"+NA$(1,NP)+CR$:GOSUB5:GOTO8020
8300 TX$="{f1}{down*2}PRG SECTIONS:":GOSUB5:I=0
8310 IFAC>=AC(1,I)THENTX$="{f1}"+CHR$(I+193)+") "+NA$(1,I):GOSUB5
8320 I=I+1:IFI<=N(1)THEN8310
8330 GOTO8020
8400 LF$=I$:SYS51971:LOADI$,DV(1,NP)
