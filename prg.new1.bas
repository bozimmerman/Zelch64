!--------------------------------------------------
!- Saturday, May 20, 2017 4:37:34 PM
!- Import of : 
!- c:\src\zelch64\prg.new1.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 SYSZ,1:SYSZ,2
8010 Q$=CHR$(13):TX$="{f1}Enter your HANDLE (17 chars or less)"+Q$+":{ct c}":GOSUB210
8020 POKE731,1:GOSUB190:NN$=I$:IFLEN(I$)>17ORI$=""THEN8010
8030 TX$="{f1}Enter your PHONE{sh space}NUMBER (XXX)/XXX-XXXX"+Q$+":{ct c}":GOSUB210
8040 GOSUB190:PH$=I$:IFLEN(I$)>16ORI$=""THEN8030
8050 TX$="{f1}Enter your NAME (17 chars or less)"+Q$+":{ct c}":GOSUB210
8060 POKE731,1:GOSUB190:RN$=I$:IFLEN(I$)>17ORI$=""THEN8050
8070 TX$="{f1}Enter a PASSWORD (7 chars or less)"+Q$+":{ct c}":GOSUB210
8080 GOSUB190:PS$=I$:IFLEN(I$)>7ORI$=""THEN8070
8220 TX$="{clear}{f1}Handle:"+NN$:GOSUB210:TX$="{f1}Phone:"+PH$:GOSUB210:TX$="{f1}Name:"+RN$
8230 GOSUB210:TX$="{f1}Password:"+PS$:GOSUB210:TX$=Q$+"{f1}Is this correct?{ct c}":GOSUB210
8231 GOSUB100:IFIN$="n"THENTX$=IN$:GOSUB210:GOTO8010
8232 IFIN$<>"y"THEN8231
8235 TX$=Q$+"{f1}Checking Userlog. Standby{f1}.{f1}.{f1}.{ct c}":GOSUB210
8236 C1=1:C2=0:OPEN1,8,15,"i0":OPEN2,8,3,"0:{pound}log1"
8237 I=0:GOSUB6:GET#2,A$:INPUT#1,E1
8238 IFE1>0ORA$<>"{pound}"THEN8245
8239 SYS38233
8240 IFI$="EMPTY"THEN8245
8241 IFI$=NN$THENTX$=Q$+"{f1}Your handle is already used!":GOSUB210:GOTO8005
8242 TX$="{f1}.{ct c}":GOSUB210:C1=C1+1:IFC1=256THENC1=0:C2=C2+1:GOTO8237
8243 GOTO8237
8245 SYSZ,1:SYSZ,2:ID=C1+(256*C2):OU$=Q$:GOSUB120
8259 E$="new:#"+STR$(ID)+NN$:GOSUB12
8260 AC$="0":CA$="0":FORI=0TO9:P$(I)="0":NEXTI:Q$=CHR$(13)
8270 TX$=Q$+Q$+NN$:GOSUB210:TX$="{f1}Your ID is:"+STR$(ID)
8280 GOSUB210:TX$="{f1}Your PASSWORD is:"+PS$:GOSUB210:NA=ID:LC$=" 0"
8285 TX$="{f1}Saving info...":GOSUB210:NA$=NN$
8287 OPEN1,8,15,"i0":OPEN2,8,3,"{pound}log1":C2=INT(ID/256):C3=C2*256:C1=ID-C3
8288 I=95:GOSUB6:PRINT#2,"0":I=0:GOSUB6:SYSZ,2:SYSZ,1
8290 SYSZ,1:SYSZ,2:Y0=1:GOSUB1350:NA$="":TX$="{f1}Press RETURN{ct c}":GOSUB210
8300 GOSUB100:IFIN$<>CHR$(13)THEN8300
8310 TX$=" "+Q$:GOSUB210:FI$="{pound}newuser":GOSUB1200
8315 I$="{pound}prg.new2":GOTO88
