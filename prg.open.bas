!--------------------------------------------------
!- Saturday, May 20, 2017 4:37:40 PM
!- Import of : 
!- c:\src\zelch64\prg.open.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8001 POKE1,53:PRINT"{clear}{pink}{reverse on}Hndl:{reverse off}{white}";NA$;TAB(23);"{reverse on}{light blue}Acs:{reverse off}{white}";AC$
8010 SYS38215:PRINT"{reverse on}{yellow}Name:{reverse off}{white}";RN$;TAB(23);"{reverse on}{light green}Time on:{reverse off}{white}";I$
8020 PRINT"{reverse on}{cyan}ID#  {white}{reverse off}";STR$(NA);TAB(23);"{reverse on}{cyan}Graphics:{white}{reverse off}";
8025 IFPEEK(681)=1THENPRINT"ON":GOTO8030
8027 PRINT"OFF"
8030 PP=VAL(P$(0))+256*VAL(P$(1))
8040 TX$="{f1}Welcome "+NA$+"!":GOSUB210:POKE733,PEEK(733)+1:SYS38215
8045 TX$="{f1}You have level"+STR$(AC)+" access":GOSUB210:
8050 CA=VAL(CA$):IFPEEK(709)=1THENOPEN4,4,7:PRINT#4,NA$;":";I$:PRINT#4:CLOSE4
8060 IFCA>CA(AC)THENTX$="{red}Daily Call Limit Exceeded!":GOSUB210:GOTO1230
8070 TX$="{f1}You are caller #"+STR$(LZ):GOSUB210:Q$=CHR$(13)
8075 TX$="{f1}You may make"+STR$((CA(AC))-CA)+" more calls today":GOSUB210
8080 TX$="{f1}You have"+STR$(TM(AC))+" min. for this call":GOSUB210
8090 TX$="{f1}Last Caller was "+L1$:GOSUB210:TX$="{f1}Logged Off at "+L2$:GOSUB210
8105 IFPP>0THENTX$="{f1}There are"+STR$(HN-PP)+" new messages.":GOSUB210
8110 TX$="{f1}Checking for mail...":GOSUB210:I3=0:OPEN1,MD,15,"i0"
8120 OPEN8,MD,8,"0:{pound}mail"+STR$(NA)+",s,r":SYSZ,8:INPUT#1,E,E$,E1,E1:SYSZ,1
8130 IFE>0THENTX$="{f1}NO mail.. (SORRY)":GOSUB210:GOTO8150
8140 TX$="{f1}{ct g}You Have Mail Waiting!{ct g}":GOSUB210
8150 IFAC<4THEN8190
8160 OPEN1,8,15,"i0":OPEN8,8,8,"0:{pound}newsfile,s,r":SYSZ,8:INPUT#1,E,E$,E1,E1
8170 SYSZ,1:SYSZ,8:IFE>20THENTX$="{f1}No News":GOSUB210:GOTO8190
8180 TX$="{f1}System {f1}News{white}:{ct c}":GOSUB210:GOSUB5
8185 OPEN8,8,8,"0:{pound}newsfile,s,r":SYS38212:SYSZ,8
8190 IFVAL(P$(2))<=BATHEN2120
8191 TX$="{f1}Change to "+P$(2)+" Baud?{ct c}":GOSUB210:
8192 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO2120
8193 IFIN$<>"y"THEN8192
8194 TX$="y"+CHR$(13)+"{f1}Change and hit {reverse on}RETURN{reverse off}{ct c}":GOSUB210:I=VAL(P$(2))
8195 FH=1:GOSUB6230:GOSUB6370:GOTO2120
