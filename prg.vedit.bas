!--------------------------------------------------
!- Saturday, May 20, 2017 4:13:19 PM
!- Import of : 
!- c:\src\zelch64\prg.vedit.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8001 TX$="R)eset Vote,Q)uit,or E)dit vote:{ct c}":GOSUB210:GOSUB190
8002 IFI$="e"THEN8110
8003 IFI$="q"THEN3150
8004 IFI$<>"r"THEN8001
8010 TX$="Reset vote box?{ct c}":GOSUB210:GOSUB190:IFI$<>"y"THEN3150
8020 OPEN1,8,15,"s0:{pound}vote box":SYSZ,1:OPEN8,8,8,"0:{pound}vote box,s,w"
8100 PRINT#8,"start":SYSZ,8:GOTO3150
8110 TX$="{white}Loading Vote!":GOSUB210:OPEN8,8,8,"0:{pound}vote,s,r":INPUT#8,I1$
8120 INPUT#8,I2:FORI=0TOI2:INPUT#8,I1$(I):INPUT#8,I2$(I):NEXTI:SYSZ,8
8130 TX$="{clear}{pink}A)Title:"+I1$+"{yellow}":GOSUB210:TX$="B)Response #:"+STR$(I2+1):GOSUB210
8140 TX$="{cyan}Option{white}/{light blue}Result":GOSUB210:FORI=0TOI2
8150 TX$=STR$(I+1)+"){cyan}"+I1$(I)+"{white}/{light blue}"+I2$(I):GOSUB210:NEXTI
8160 TX$="{light green}(Q/S)/Option:{ct c}":GOSUB210
8170 GOSUB100:IFIN$=""THEN8170
8180 TX$=IN$:GOSUB210:IFVAL(IN$)>0ANDVAL(IN$)<=I2+1THEN8260
8190 IFIN$="a"THENTX$=":{ct c}":GOSUB210:GOSUB190:I1$=I$:GOTO8130
8200 IFIN$="q"THEN3150
8210 IFIN$="s"THEN8280
8220 IFIN$<>"b"THEN8130
8230 TX$=":{ct c}":GOSUB210:GOSUB190:IFI$=""ORLEN(I$)>4THEN8130
8240 I=VAL(I$)-1:IFI<=9ANDI>0THENI2=I:GOTO8130
8250 GOTO8130
8260 I=VAL(IN$)-1:TX$="Option:{ct c}":GOSUB210:GOSUB190:I1$(I)=I$
8270 TX$="Result:{ct c}":GOSUB210:GOSUB190:I2$(I)=I$:GOTO8130
8280 OPEN1,8,15,"s0:{pound}vote":SYSZ,1:OPEN8,8,8,"0:{pound}vote,s,w":PRINT#8,I1$:PRINT#8,I2
8290 FORI=0TOI2:PRINT#8,I1$(I):PRINT#8,I2$(I):NEXTI:SYSZ,8:GOTO3150
