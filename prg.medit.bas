!--------------------------------------------------
!- Saturday, May 20, 2017 4:11:42 PM
!- Import of : 
!- c:\src\zelch64\prg.medit.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8001 TX$="{clear}{down*2}{f1}SubOp Editing Functions":GOSUB210
8002 TX$="-----------------------":GOSUB210
8003 TX$="{f1}D)elete a message":GOSUB210:TX$="{f1}R)esponse delete":GOSUB210
8004 TX$="{f1}E)dit Opening Msg":GOSUB210
8005 TX$="{down*2}:{ct c}":GOSUB210:GOSUB190:
8010 IFI$="d"THEN8300
8020 IFI$="r"THEN8100
8025 IFI$="e"THEN8400
8030 IFI$=""THENI$="{pound}prg.read":GOTO88
8040 GOTO8001
8100 V1=SD(CS):TX$="Msg #{ct c}":GOSUB210:GOSUB111:IFI=0THEN8600
8110 M=I:T=Z1(M):IFM>NMORT=0THEN8600
8120 OPEN1,V1,15,"s0:msg":PRINT#1,"r0:msg={pound}msg"+STR$(CS)+STR$(M):SYSZ,1:CT=1
8130 TX$="{f1}Storing Bulletin...":GOSUB210:OPEN8,V1,8,"0:msg,s,r"
8140 OPEN9,V1,9,"0:{pound}msg"+STR$(CS)+STR$(M)+",s,w"
8150 SYS38230:IFI$<>CHR$(1)THENPRINT#9,I$:GOTO8150
8160 MM=Z1(M)
8170 TX$="{f1}Save response #"+STR$(CT)+"?{ct c}":GOSUB210:GOSUB190:IFI$=""THEN8170
8180 IFI$="n"THEN8260
8190 IFI$<>"y"THEN8170
8200 PRINT#9,CHR$(1)
8210 SYS38230:IFI$=CHR$(1)THEN8240
8220 IFPEEK(253)=1THENPRINT#9,I$:A=FRE(0):GOTO8280
8230 PRINT#9,I$:GOTO8210
8240 IFCT=MMTHEN8280
8250 CT=CT+1:GOTO8170
8260 SYS38218:Z1(M)=Z1(M)-1:IFZ1(M)=0ORCT=MMTHENGOTO8280
8270 GOTO8240
8280 SYSZ,8:SYSZ,9:OPEN1,V1,15,"s0:msg":SYSZ,1:A=Z1(M):B=Z2(M):I=M:GOSUB4180
8290 GOTO8600
8300 V1=SD(CS):TX$="{f1}Delete Msg #{ct c}":GOSUB210:GOSUB111:IFI=0ORI>NMTHEN8600
8310 TX$="Standby...":GOSUB210:OPEN1,V1,15,"s0:{pound}msg"+STR$(CS)+STR$(I):SYSZ,1
8320 GOSUB5:OPEN8,V1,8,"0:{pound}msg"+STR$(CS)+STR$(I)+",s,w"
8325 PRINT#8,"         DELETED{sh space}MESSAGE!!!!":PRINT#8,CHR$(2):FORQ=1TO4
8330 PRINT#8,CHR$(144):NEXTQ:PRINT#8,"This message has been DELETED."
8335 PRINT#8,"DO{sh space}NOT{sh space}REPLY{sh space}TO{sh space}IT!":SYSZ,8:SYSZ,1:A=0:B=0:GOSUB4180
8350 GOTO8600
8400 UP=0:TX$="Searching...":GOSUB210:GOSUB5:OPEN8,SD(CS),8,"{pound}sigmsg"+STR$(CS+1)
8405 FORI=0TO50:TT$(I)="{black}":NEXTI:LN=0
8410 SYSZ,8:OPEN1,SD(CS),15:INPUT#1,E:SYSZ,1:IFE=0THEN8420
8412 TX$="File Not Found..Editor...":GOSUB210:GOTO8500
8420 TX$="Loading...":GOSUB210:OPEN8,SD(CS),8,"{pound}sigmsg"+STR$(CS+1)
8440 SYS38230:IFPEEK(253)=1THEN8500
8450 IFI$=CHR$(142)+CHR$(147)THENUP=1:GOTO8440
8460 SYS38209,I$:TT$(LN)=I$:LN=LN+1:GOTO8440
8500 FF$="{pound}sigmsg"+STR$(CS+1)
8505 POKE764,3:QD$="":SYSZ,8:SYS38209,I$:TT$(LN)=I$:LN=LN+1:S0=1:V1=SD(CS)
8510 GOSUB2480:POKE764,0:GOTO8001
8600 I$="{pound}prg.read":GOTO88
