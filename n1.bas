!--------------------------------------------------
!- Friday, May 19, 2017 9:56:31 PM
!- Import of : 
!- c:\src\zelch64\n1.prg
!- Commodore 64
!--------------------------------------------------
10 GOTO260
20 SYS49152
40 IFPEEK(830)=1THEN880
50 RETURN
60 IFOU$=""THENRETURN
70 POKE254,ASC(OU$):SYS49155
80 RETURN
90 REM INPUT
110 I$="":SYS49158
120 IFPEEK(830)=1THEN880
140 RETURN
150 IFTX$=""THENRETURN
170 SYS49161,TX$
180 RETURN
190 OU$="{clear}":GOSUB60:D5=0
220 CLOSE1:CLOSE8:OPEN1,8,15:OPEN8,8,8,FI$+",s,r"
230 SYS49164
240 D5=PEEK(253)
250 CLOSE1:CLOSE8:RETURN
260 TX$="Finding a opening. Standby...":GOSUB150
270 CLOSE1:CLOSE2:CLOSE8:OPEN1,8,15:OPEN2,8,2,"{pound}userlog":C1=1:C2=0
280 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(5):GET#2,A$:INPUT#1,E1
285 IFE1<>0ORA$=""THEN320
290 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(5)
293 SYS49185
295 N$=I$:IFN$="EMPTY"THEN320
300 OU$=">":GOSUB60:C1=C1+1:IFC1=256THENC1=0:C2=C2+1:GOTO280
310 GOTO280
320 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(0)
325 CLOSE1:CLOSE2:ID=C1+256*C2:OU$=CHR$(13):GOSUB60
330 TX$="Enter your handle (17 chars or less)"+CHR$(13)+":":GOSUB150
340 GOSUB90:NA$=I$:IFLEN(NA$)>17ORNA$=""THEN330
350 TX$="Enter your phone number (XXX-XXXX)"+CHR$(13)+":":GOSUB150:GOSUB90
360 PH$=I$:IFLEN(PH$)>9ORPH$=""THEN350
370 TX$="Enter your name (17 chars or less)"+CHR$(13)+":":GOSUB150:GOSUB90
380 RN$=I$:IFLEN(RN$)>17ORRN$=""THEN370
390 TX$="Enter a password (7 chars or less)"+CHR$(13)+":":GOSUB150:GOSUB90
400 PS$=I$:IFLEN(PS$)>7ORPS$=""THEN390
410 TX$="{clear}Handle:"+NA$:GOSUB150
422 TX$="Phone:"+PH$:GOSUB150
423 TX$="Name:"+RN$:GOSUB150
424 TX$="Password:"+PS$:GOSUB150
430 TX$="is all this correct?":GOSUB150
440 GOSUB20:IFIN$=""THENGETIN$:IFIN$=""THEN440
450 IFIN$="n"THEN330
460 IFIN$<>"y"THEN440
470 AC$="0":LC$=STR$(MN)+"/"+STR$(DA):TM$="11]00":CA$="0"
475 FORJ=0TO9:P$(J)="0":NEXTJ
480 TX$=NA$:GOSUB150:TX$="your id number is:"+STR$(ID):GOSUB150:
490 TX$="and your password is:"+PS$:GOSUB150:TX$="Saving info...":GOSUB150
500 GOSUB 560
510 GOSUB560:GOSUB1000:TX$="Press RETURN to go on:":GOSUB150:GOSUB90
520 FI$="{pound}newuser":GOSUB190
530 TX$="Hit RETURN to RELOG-ON":GOSUB150
540 GOSUB20:IFIN$<>CHR$(13)THENGETIN$:IFIN$<>CHR$(13)THEN540
550 GOTO900
560 CLOSE1:CLOSE2:CLOSE8:OPEN1,8,15:OPEN2,8,2,"{pound}userlog"
561 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(0)
565 GOTO580
570 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(I):RETURN
580 I=5:GOSUB570:PRINT#2,NA$
590 I=25:GOSUB570:PRINT#2,PH$
600 I=35:GOSUB570:PRINT#2,AC$
610 I=40:GOSUB570:PRINT#2,RN$
620 I=60:GOSUB570:PRINT#2,LC$
640 I=80:GOSUB570:PRINT#2,TM$
650 I=90:GOSUB570:PRINT#2,PS$
660 CT=0
670 FORI=100TO145STEP5
680 GOSUB570:PRINT#2,P$(CT)
690 CT=CT+1:NEXT
695 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(0)
700 CLOSE1:CLOSE2:RETURN
880 NA$="":RL=2520:TX$="Standby..":GOSUB150
890 LOAD"{pound}@1",8,1
900 TX$="Standby...":GOSUB150
910 LOAD"{pound}@1",8,1
1000 OPEN1,8,15:OPEN2,8,2,"{pound}calls"
1010 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(1)
1020 PRINT#2,CA$:CLOSE2:CLOSE1
1030 OPEN1,8,15:OPEN2,8,2,"{pound}calls"
1040 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(1)
1050 PRINT#2,CA$:CLOSE2:CLOSE1
1060 RETURN