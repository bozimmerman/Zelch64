!--------------------------------------------------
!- Saturday, May 20, 2017 4:37:02 PM
!- Import of : 
!- c:\src\zelch64\pgm.userdel.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 TX$="{down*2}{f1}(?=Userlist)User to Delete:{ct c}":GOSUB210:GOSUB111
8020 IFI$="?"THENPOKE682,1:GOSUB2340:POKE682,0:GOTO8010
8025 IFI=0THEN2120
8030 C2=INT(I/256):C3=C2*256:C1=I-C3:OPEN1,8,15,"i0":OPEN2,8,3,"{pound}log1":II=I
8040 I=0:GOSUB6:GET#2,A$:INPUT#1,E1
8050 IFA$<>"{pound}"ORE1>0THENI$="UNDEFINED USER ID#"+STR$(II):GOTO8065
8060 INPUT#2,I$
8065 TX$="DELETE "+I$+"?{ct c}":GOSUB210
8070 GOSUB100:IFIN$="n"THENSYSZ,1:SYSZ,2:TX$="y":GOSUB210:GOTO8010
8080 IFIN$<>"y"THEN8070
8090 TX$="y"+CHR$(13)+"{down}{f1}Wiping him OUT...":GOSUB210
8100 I=0:GOSUB6:Q$=CHR$(13):A$="{pound}EMPTY"+Q$+"xxx-xxxx"+Q$+"0"+Q$+"EMPTY"+Q$
8130 A$=A$+"pswd"+STR$(INT(RND(TI)*99)+1)+Q$:PRINT#2,A$
8140 SYSZ,2:SYSZ,1:
8150 OPEN1,8,15,"s0:{pound}mail"+STR$(II):SYSZ,1
8160 TX$="{f1}That doods GONE!":GOSUB210:GOTO8010
