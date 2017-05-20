!--------------------------------------------------
!- Friday, May 12, 2017 11:14:05 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.open.prg
!- Commodore 64
!--------------------------------------------------
8000 SYS51983:PRINT"{clear}{pink}{reverse on}hndl:{reverse off}{white}";NA$;TAB(22);"{reverse on}{pink}acs :{reverse off}{white}";AC$:SYS38215
8020 PRINT"{reverse on}{yellow}name:{reverse off}{white}";RN$;TAB(22);"{reverse on}{yellow}on  @{reverse off}{white}";I$:PRINT"{reverse on}{white}id  #{white}{reverse off}";STR$(NA);
8030 PRINTTAB(10);"{reverse on}{white}chat{reverse off} ";TAB(16);"{reverse on}gfx:{reverse off}";CHR$(PEEK(681)+32);
8050 PRINTTAB(22);"{reverse on}baud:{reverse off}";BA
8100 POKE1,PEEK(1)AND253:CX=39:POKE699,60:IFP(6)AND1THENCX=79:POKE699,100
8101 GOSUB75:IFVAL(LEFT$(AA$,LEN(AA$)-4))>VAL(LEFT$(LC$,LEN(LC$)-4))THENCA$="0"
8105 IFVAL(CA$)>CA(AC)THENTX$="{red}DAILY CALL LIMIT EXCEEDED!":GOSUB5:GOTO1500
8110 POKE762,CX:TX$="{f1}WELCOME "+NA$+"!":GOSUB5:POKE733,PEEK(733)+1:SYS38215
8120 TX$="{f1}YOU{sh space}HAVE LEVEL"+STR$(AC)+" ACCESS":GOSUB5:CA=VAL(CA$)
8140 TX$="{f1}YOU{sh space}ARE CALLER #"+STR$(LZ):GOSUB5
8150 TX$="{f1}YOU{sh space}MAY MAKE"+STR$((CA(AC))-CA)+" MORE CALLS TODAY":GOSUB5
8170 TX$="{f1}LAST{sh space}CALLER WAS "+I1$+CR$+"{f1}LOGGED OFF{sh space}AT "+I2$:GOSUB5
8200 I3=0:OPEN2,MD,2,"0:{pound}mail"+STR$(NA)+",s,r":GET#2,A$:CLOSE2:INPUT#MD,E
8210 IFE>0THENTX$="{f1}NO MAIL.. (SORRY)":GOSUB5:GOTO8300
8220 TX$="{f1}{ct g}YOU HAVE MAIL WAITING!{ct g}":GOSUB5:
8300 I=P(2):IFI=BAORBA=1200ORI=0THEN8400
8310 TX$="{f1}CHANGE TO "+STR$(P(2))+" BAUD?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN8400
8320 TX$=CR$+"{f1}CHANGE AND{sh space}HIT {reverse on}RETURN{reverse off}{ct c}":GOSUB5:FH=1:GOSUB3040:GOSUB35
8400 TX$=CR$+"{f1}SYSTEM NEWS{white}:{ct c}":GOSUB5:IFAC<4THEN2000
8410 OPEN2,8,2,"0:{pound}newsfile,s,r":INPUT#8,E:IFE<20THENSYS38212:CLOSE2:GOTO2000
8420 IFE>20THENTX$="{f1}NONE FOUND!":GOSUB5:CLOSE2:GOTO2000
