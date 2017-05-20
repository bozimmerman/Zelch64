!--------------------------------------------------
!- Saturday, May 20, 2017 4:57:47 PM
!- Import of : 
!- c:\src\zelch64\prg.open.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 PRINT"{clear}{pink}{reverse on}hndl:{reverse off}{white}";NA$;TAB(23);"{reverse on}{light blue}acs:{reverse off}{white}";AC$:SYS38215
8020 PRINT"{reverse on}{yellow}name:{reverse off}{white}";RN$;TAB(23);"{reverse on}{light green}time on:{reverse off}{white}";I$:PRINT"{reverse on}{cyan}id#  {white}{reverse off}";STR$(NA);
8030 PRINTTAB(23);"{reverse on}{cyan}graphics:{white}{reverse off}";:IFPEEK(681)=1THENPRINT"on":GOTO8100
8050 PRINT"off"
8100 POKE1,PEEK(1)AND253:CX=39:POKE699,60:IFP(6)AND1THENCX=79:POKE699,100
8110 POKE762,CX:TX$="{f1}WELCOME "+NA$+"!":GOSUB5:POKE733,PEEK(733)+1:SYS38215
8120 TX$="{f1}YOU{sh space}HAVE LEVEL"+STR$(AC)+" ACCESS":GOSUB5:CA=VAL(CA$)
8130 IFCA>CA(AC)THENTX$="{red}DAILY CALL LIMIT EXCEEDED!":GOSUB5:GOTO1500
8140 TX$="{f1}YOU{sh space}ARE CALLER #"+STR$(LZ):GOSUB5
8150 TX$="{f1}YOU{sh space}MAY MAKE"+STR$((CA(AC))-CA)+" MORE CALLS TODAY":GOSUB5
8160 TX$="{f1}YOU{sh space}HAVE"+STR$(TM(AC))+" MIN. FOR{sh space}THIS{sh space}CALL":GOSUB5
8170 TX$="{f1}LAST{sh space}CALLER WAS "+I1$:GOSUB5:TX$="{f1}LOGGED OFF{sh space}AT "+I2$:GOSUB5
8180 IFPP>0THENTX$="{f1}THERE ARE"+STR$(HN-PP)+" NEW MESSAGE(S)":GOSUB5
8190 TX$="{f1}CHECKING{sh space}FOR{sh space}MAIL...":GOSUB5:I3=0
8200 OPEN3,MD,MD,"0:{pound}mail"+STR$(NA)+",s,r":CLOSE3:INPUT#MD,E
8210 IFE>0THENTX$="{f1}NO MAIL.. (SORRY)":GOSUB5:GOTO8300
8220 TX$="{f1}{ct g}YOU HAVE MAIL WAITING!{ct g}":GOSUB5:
8300 IFAC<4THEN8400
8310 OPEN3,8,8,"0:{pound}newsfile,s,r":CLOSE3:INPUT#8,E
8320 IFE>20THENTX$="{f1}NO NEWS":GOSUB5:GOTO8400
8330 TX$="{f1}SYSTEM NEWS{white}:{ct c}":GOSUB5:OPEN3,8,8,"0:{pound}newsfile,s,r":SYS38212:CLOSE3
8400 IFP(2)<=BAORBA=1200THEN2000
8410 TX$="{f1}CHANGE TO "+STR$(P(2))+" BAUD?{ct c}":GOSUB5
8420 GOSUB11:IFIN$="n"THENTX$=IN$:GOSUB5:GOTO2000
8430 IFIN$<>"y"THEN8420
8440 TX$=IN$+CR$+"{f1}CHANGE AND{sh space}HIT {reverse on}RETURN{reverse off}{ct c}":GOSUB5:I=P(2)
8450 FH=1:GOSUB3040:GOSUB35:GOTO2000
