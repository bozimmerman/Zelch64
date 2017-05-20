!--------------------------------------------------
!- Saturday, May 20, 2017 2:17:41 PM
!- Import of : 
!- c:\src\zelch64\prg.new.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8001 IFPEEK(681)=1THENTX$="{white}Change to {reverse on}Standard Ascii{reverse off} for the":GOSUB210
8002 IFPEEK(681)=1THENTX$="NEW USER process then hit {reverse on}RETURN{reverse off}":GOSUB210
8003 IFPEEK(681)=1THENGOSUB100:IFIN$<>CHR$(13)THEN8003
8004 POKE681,0
8005 T1=1:T2=0:GOSUB1700:TX$=CHR$(13)+"Finding an opening. Standby...{ct c}":GOSUB210
8060 C1=1:C2=0:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
8070 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(5):GET#2,A$:INPUT#1,E1
8080 IFE1>0ORA$=""THEN8130
8090 SYS38233:I$=A$+I$
8100 IFI$="EMPTY"THEN8130
8110 OU$=".":GOSUB120:C1=C1+1:IFC1=256THENC1=0:C2=C2+1:GOTO8070
8120 GOTO8070
8130 CLOSE1:CLOSE2:ID=C1+(256*C2):OU$=CHR$(13):GOSUB120:Q$=CHR$(13)
8140 TX$="Enter your HANDLE (17 chars or less)"+Q$+":{ct c}":GOSUB210
8150 GOSUB190:NN$=I$:IFLEN(I$)>17ORI$=""THEN8140
8160 TX$="Enter your PHONE{sh space}NUMBER (XXX-XXXX)"+Q$+":{ct c}":GOSUB210
8170 GOSUB190:PH$=I$:IFLEN(I$)>9ORI$=""THEN8160
8180 TX$="Enter your NAME (17 chars or less)"+Q$+":{ct c}":GOSUB210
8190 GOSUB190:RN$=I$:IFLEN(I$)>17ORI$=""THEN8180
8200 TX$="Enter a PASSWORD (7 chars or less)"+Q$+":{ct c}":GOSUB210
8210 Q$=CHR$(13):GOSUB190:PS$=I$:IFLEN(I$)>9ORI$=""THEN8200
8220 TX$=Q$+Q$+"Handle:"+NN$:GOSUB210:TX$="Phone:"+PH$:GOSUB210:TX$="Name:"+RN$
8230 GOSUB210:TX$="Password:"+PS$:GOSUB210:TX$=Q$+"Is this correct?{ct c}":GOSUB210
8240 GOSUB100:IFIN$="n"THEN8140
8250 IFIN$<>"y"THEN8240
8251 E$="new:#"+STR$(ID)+NN$:GOSUB12
8260 AC$="0":LC$=STR$(MN)+"/"+STR$(DA):SYS38215:TM$=I$:CA$="0":FORI=0TO9
8270 P$(I)="0":NEXTI:TX$=NA$:GOSUB210:TX$=CHR$(13)+"Your ID is:"+STR$(ID):
8280 GOSUB210:TX$="Your PASSWORD is:"+PS$:GOSUB210:TX$="Saving info...":GOSUB210
8290 NA$=NN$:Y0=1:GOSUB1350:Y0=1:GOSUB1350:NA$="":TX$="Press RETURN{ct c}":GOSUB210
8300 GOSUB100:IFIN$<>CHR$(13)THEN8300
8310 TX$=" "+Q$:GOSUB210:FI$="{pound}newuser":GOSUB1200
8315 GOSUB6700:GOTO750
