!--------------------------------------------------
!- Friday, May 19, 2017 9:54:46 PM
!- Import of : 
!- c:\src\zelch64\e.menu.prg
!- Commodore 64
!--------------------------------------------------
10 POKE53280,0:POKE53281,0:IFPEEK(828)<>12THENPOKE828,12:DIMT$(50),F$(50)
20 IFT$(1)<>""THEN50
21 OPEN8,8,8,"e.info,s,r"
30 INPUT#8,N
35 FORI=1TON:INPUT#8,T$(I):INPUT#8,F$(I):NEXTI
40 CLOSE8
50 PRINT"{clear}            {light blue} Editors:"
60 PRINT"{down*2}E) Editor editor"
70 PRINT"Q) Load Zelch"
80 FORI=1TON:PRINT"{left}";I;"{left}) ";T$(I):NEXTI
90 GETA$:IFA$="e"THEN500
100 IFVAL(A$)<=NANDVAL(A$)>0THEN200
110 IFA$<>"q"THEN90
120 PRINT"{clear}Loading..."
130 CLR
140 LOAD"zelch",8
200 PRINT"{clear}Loading Editor..."
220 LOADF$(VAL(A$)),8
500 PRINT"{clear}N)umber of Editors:";N
510 PRINT"Q)uit to main"
520 PRINT"S)ave info and quit"
530 PRINT"{down*2}##  Editor Title";TAB(20);"Editor Filename"
540 FORI=1TO40:PRINT"-";:NEXT
550 FORI=1TON:PRINT"{left}";I"{left})";T$(I):PRINT"{up}{right*20}";F$(I):NEXTI
560 GETA$:IFA$="q"THENRUN
570 IFA$="s"THEN1000
580 IFA$="n"THENINPUT"New Number";N:GOTO500
590 A=VAL(A$):IFA=0ORA>NTHEN560
600 INPUT"Editor Title";T$(A):INPUT"Editor Filename";F$(A)
610 GOTO500
1000 OPEN1,8,15,"s0:e.info":CLOSE1
1010 OPEN8,8,8,"e.info,s,w"
1020 PRINT#8,N:FORI=1TON:PRINT#8,T$(I):PRINT#8,F$(I):NEXTI:CLOSE8:RUN
