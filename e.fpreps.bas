!--------------------------------------------------
!- Friday, May 19, 2017 9:53:53 PM
!- Import of : 
!- c:\src\zelch64\e.fpreps.prg
!- Commodore 64
!--------------------------------------------------
1 GOTO5
2 OPEN1,8,15:INPUT#1,E1,E2$,E3,E4:PRINTE1,E2$,E3,E4:CLOSE1:END
5 POKE53280,0:POKE53281,0:DIMSG$(50),SG(50),SD(50),FS(50)
10 PRINT"{yellow}"CHR$(14);:PRINT"{clear}Put your data disk in drive 8"
20 PRINT"and press {reverse on}Return{reverse off}"
30 POKE198,0
40 GETA$:IFA$<>CHR$(13)THEN40
50 OPEN8,8,8,"{pound}Fpreps,s,r":INPUT#8,SG
60 IFST<>0THENCLOSE8:GOTO160
70 FORI=0TOSG:INPUT#8,SG$(I):INPUT#8,SG(I):INPUT#8,SD(I):INPUT#8,FS(I)
80 NEXTI:CLOSE8
100 PRINT"{clear} 1) Edit prep file
110 PRINT" 2) Edit RECORD file"
115 PRINT" 3) Quit"
120 PRINT"{down*3}Choose:"
130 GETA$:IFA$=""THEN130
140 IFA$="2"THEN5000
150 IFA$="1"THEN160
155 IFA$="3"THEN10000
157 GOTO130
160 PRINT"{clear}1) Number of sigs:";SG+1
170 PRINT"{down}======================================="
180 PRINT" # ) NAME             =SEC=DVC=# MSGS
190 PRINT"======================================="
200 FORI=0TOSG:PRINTI+2")"+SG$(I);:PRINTTAB(22)"="SG(I);:PRINTTAB(25)"="SD(I);
210 PRINTTAB(28)"=  "FS(I):NEXT
220 PRINT"======================================="
230 PRINT"{down}(S)ave (Q)uit  Choose:"
240 GETA$:IFA$=""THEN240
250 IFA$="1"THENINPUT"New #";SG:SG=SG-1:GOTO160
260 IFA$="s"THEN1000
270 IFA$="q"THENRUN
280 IFVAL(A$)>1ANDVAL(A$)-2<=SGTHENA=VAL(A$)-2:GOTO300
290 GOTO240
300 INPUT"Name of Sig";SG$(A)
310 INPUT"Security of sig";SG(A):IFSG(A)<0ORSG(A)>9THEN310
320 INPUT"Device of Sig";SD(A):IFSD(A)<8ORSD(A)>11THEN320
330 INPUT"Max # of msgs";FS(A)
340 GOTO160
1000 PRINT"Save: Are you SURE?"
1010 GETA$:IFA$="n"THEN160
1020 IFA$<>"y"THEN1010
1030 OPEN1,8,15,"s0:{pound}Fpreps":CLOSE1
1040 OPEN8,8,8,"{pound}Fpreps,s,w"
1050 PRINT#8,SG
1060 FORI=0TOSG:PRINT#8,SG$(I):PRINT#8,SG(I):PRINT#8,SD(I):PRINT#8,FS(I)
1070 NEXTI:CLOSE8
1080 GOTO160
1500 REM
1600 END
5000 PRINT"{clear}1) Create Msg index files"
5003 PRINT"2) Create {pound}index.File"
5020 GETA$:IFA$="1"THEN6000
5025 IFA$="2"THEN6200
5040 GOTO5020
6000 PRINT"{clear}Enter Sig #{sh space}to Create..(1 - "+STR$(SG+1)+")"
6010 PRINT"Note: This function WILL{sh space}ERASE"
6020 PRINT"Previous records in the sig file"
6030 PRINT"you choose."
6040 PRINT"Choose (# or Q)uit:"
6050 GETA$:IFA$="q"THENRUN
6060 IFVAL(A$)>0ANDVAL(A$)-1<=SGTHENA=VAL(A$)-1:GOTO6100
6070 GOTO6050
6100 FI$="{pound}Sig"+STR$(A):OPEN1,SD(A),15,"s0:"+FI$:CLOSE1
6110 OPEN8,SD(A),8,FI$+",s,w"
6115 FORI=0TOFS(A):PRINT#8,"0":PRINT#8,"0":NEXTI
6130 CLOSE8:GOTO6000
6200 PRINT"working!":OPEN1,8,15,"s0:{pound}index.File":OPEN2,8,2,"{pound}index.File,l,"+CHR$(10)
6201 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(1):PRINT#2,"0"
6205 FORI=2TOSG+2
6210 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(1):PRINT#2,CHR$(255)
6220 NEXTI:CLOSE1:CLOSE2:GOTO5000
10000 PRINT"Put your SYSTEMS disk in drive 8"
10001 PRINT"and press RETURN"
10002 GETA$:IFA$<>CHR$(13)THEN10002
10005 PRINT"standby..."
10010 LOAD"e.menu",8
