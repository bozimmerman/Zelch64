!--------------------------------------------------
!- Saturday, May 20, 2017 12:05:12 AM
!- Import of : 
!- c:\src\zelch64\e.mpreps.prg
!- Commodore 64
!--------------------------------------------------
10 POKE53280,0:POKE53281,0:PRINT"{clear}{yellow}"+CHR$(14)
20 PRINT"Insert your data disk in drive 8"
30 PRINT"and press return"
40 POKE198,0
50 GETA$:IFA$<>CHR$(13)THEN50
60 OPEN8,8,8,"{pound}Mpreps,s,r"
65 INPUT#8,BN$
70 INPUT#8,MD:INPUT#8,MO:FORI=0TOMO:INPUT#8,M1$(I):INPUT#8,M2(I)
80 INPUT#8,M3$(I):NEXT:CLOSE8
100 PRINT"{clear}1) BBS Name:";BN$:PRINT"2) Sub device:";MD,"3)# of modules:";MO+1
105 PRINT"--------------------------"
110 PRINT" # )Filename:Access:Letter"
115 PRINT"--------------------------"
120 FORI=0TOMO:PRINTI+4")"M1$(I)TAB(12)":"M2(I)TAB(19)":"M3$(I):NEXT
130 PRINT"---------------------------------------"
140 PRINT"#) to edit Q)uit or S)ave"
150 GETA$:IFA$="q"THEN60000
155 IFA$="s"THEN2000
160 IFA$="1"THEN1000
170 IFA$="2"THEN1100
180 I=0:IFA$="3"THEN1200
190 IFRIGHT$(STR$(I+4),1)=A$THENA=VAL(A$):GOTO1300
200 I=I+1:IFI>MOTHEN150
210 GOTO190
1000 INPUT"New Name:";BN$:GOTO100
1100 INPUT"New Device:";MD:IFMD<8ORMD>11THEN1100
1110 GOTO100
1200 INPUT"Number:";MO:IFMO<1ORMO>10THEN1200
1210 MO=MO-1:GOTO100
1300 A=A-4:IFA<0ORA>9THEN100
1310 INPUT"filename";M1$(A):IFLEN(M1$(A))>16THEN1310
1320 INPUT"Access level (lowest)";M2(A):IFM1(A)<0ORM1(A)>9THEN1320
1330 INPUT"Command Letter";M3$(A):IFLEN(M3$(A))>1THEN1330
1350 GOTO100
2000 PRINT"Save: Are you sure?":
2010 GETA$:IFA$="n"THEN100
2020 IFA$<>"y"THEN2010
2050 OPEN1,8,15,"s0:{pound}Mpreps":CLOSE1
2060 OPEN8,8,8,"{pound}Mpreps,s,w":PRINT#8,BN$:PRINT#8,MD:PRINT#8,MO:FORI=0TOMO
2070 PRINT#8,M1$(I):PRINT#8,M2(I):PRINT#8,M3$(I)
2080 NEXT:CLOSE8:GOTO100
60000 PRINT"Quit: Are you sure?":
60001 GETA$:IFA$="n"THEN100
60002 IFA$<>"y"THEN60001
60003 PRINT"Insert your system disk and press RETURN":POKE198,0
60004 GETA$:IFA$<>CHR$(13)THEN60004
60005 LOAD"e.menu",8
