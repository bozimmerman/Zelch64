!--------------------------------------------------
!- Saturday, May 20, 2017 4:11:30 PM
!- Import of : 
!- c:\src\zelch64\pgm 3 1.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 TX$="{down*2}{f1}(?=Userlist)User to Delete:{ct c}":GOSUB210:GOSUB111
8020 IFI$="?"THENPOKE682,1:GOSUB2340:POKE682,0:GOTO8010
8025 IFI=0THEN2120
8030 C2=INT(I/256):C3=C2*256:C1=I-C3:OPEN1,8,15,"i0":OPEN2,8,3,"{pound}userlog":II=I
8040 I=5:GOSUB6:GET#2,A$:INPUT#1,E1
8050 IFA$=""ORE1>0THENSYSZ,1:SYSZ,2:TX$="{f1}No record found!":GOSUB210:GOTO8010
8060 I=5:GOSUB7:TX$="Delete "+I$+"?{ct c}"
8065 GOSUB210
8070 GOSUB100:IFIN$="n"THENSYSZ,1:SYSZ,2:TX$="y":GOSUB210:GOTO8010
8080 IFIN$<>"y"THEN8070
8090 TX$="y"+CHR$(13)+"{down}{f1}Wiping him OUT...":GOSUB210
8100 I=5:GOSUB6:PRINT#2,"EMPTY":I=25:GOSUB6:PRINT#2,"xxx-xxxx":I=35:GOSUB6
8110 PRINT#2,"0":I=40:GOSUB6:PRINT#2,"REAL{sh space}NAME":I=60:GOSUB6:PRINT#2,"1/ 1"
8120 I=80:GOSUB6:PRINT#2,"12:00am":I=90:GOSUB6
8130 PRINT#2,"pswd"+STR$(INT(RND(TI)*99)+1):FORI=100TO145STEP5:GOSUB6
8140 PRINT#2,"0":NEXTI:SYSZ,2:SYSZ,1:
8150 OPEN1,8,15,"s0:{pound}mail"+STR$(II):SYSZ,1
8160 TX$="{f1}That doods GONE!":GOSUB210:GOTO8010
