!--------------------------------------------------
!- Saturday, May 20, 2017 2:44:30 PM
!- Import of : 
!- c:\src\zelch64\prg.monster.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 PRINT"user update":LO=1:HI=512:PRINT"Counting users...":C=HI/2
8550 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog":FORR=0TO8
8560 C2=INT(C/256):C3=C2*256:C1=C-C3:I=5:GOSUB6:INPUT#1,E:GET#2,A$:GOSUB6
8580 IFA$=""ORE>0THENHI=C:D=HI-LO:D=D/2:C=C-D:GOTO8590
8585 LO=C:D=HI-LO:D=D/2:C=C+D
8590 PRINT"{home}{down*6}";STR$(INT(C));"  ":NEXTR:SYSZ,2:SYSZ,1
8620 PRINTCHR$(13)+"Saving Calls..."
8630 OPEN1,8,15,"s0:{pound}calls":OPEN2,8,2,"0:{pound}calls,l,"+CHR$(6)
8640 FORX=1TOC+3:C2=INT(X/256):C3=C2*256:C1=X-C3
8650 I=1:GOSUB6:PRINT#2,"0":GOSUB6:NEXTX:SYSZ,1:SYSZ,2
8660 PRINT"Validating Disk...":SYSZ,1:OPEN1,8,15,"v0":SYSZ,1
8670 IFDD=0THENDA=DA+1:IFDA>DA(MN)THENMN=MN+1:DA=1:IFMN=13THENMN=1
8675 IFDD=0THENPOKE733,0
8680 DD=0:POKE703,MN:POKE704,DA:POKE709,O
8690 GOTO390
