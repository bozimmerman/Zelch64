!--------------------------------------------------
!- Friday, May 12, 2017 11:03:26 PM
!- Import of : 
!- c:\src\zelch64\bak\zelch.prg
!- Commodore 64
!--------------------------------------------------
1 BV=PEEK(186)
5 POKE53280,0:POKE53281,0:PRINT"{clear}"
15 IFPEEK(716)<>16THENPOKE716,16:LOAD"window.ml",BV,1
17 IFPEEK(715)<>16THENPOKE715,16:SYS49152:POKE59639,2:POKE59671,3:POKE57722,96
20 IFPEEK(700)<>16THENPOKE700,16:GOTO1000
50 PRINT"{clear}"+CHR$(14)+"{yellow}"
60 POKE53280,0
70 POKE53281,0
90 GOTO690
97 PRINT"hit return":
98 GETA$:IFA$<>CHR$(13)THEN98
99 RETURN
100 MN=0
110 INPUT"{clear}{reverse on}{pink}THE MONTH";MN
120 IFMN>12ORMN=0THEN110
130 POKE703,MN
140 DA=0
150 INPUT"{home}{down}{reverse on}{yellow}THE DAY";DA
160 IFDA>31ORDA=0THEN140
170 POKE704,DA
180 INPUT"{home}{down*2}{reverse on}{white}THE YEAR";YR
181 IFYR=0ORYR>99THEN180
182 POKE712,YR
250 PRINT
260 PRINT"{home}{down*3}{reverse on}{light blue}CORRECT?{reverse on} {reverse off}{left}";
270 GETA$
280 IFA$="n"THENPRINT"n":GOTO100
290 IFA$<>"y"THEN270
295 PRINT"y"
300 INPUT"{home}{down*4}{reverse on}{light green}THE HOUR";HR$:HR=VAL(HR$):IFHR=0ORHR>12THEN300
360 PRINT"{home}{down*5}{reverse on}{yellow}{cyan}AM OR PM?{reverse on} {reverse off}{left}";
370 GETA$:IFA$<>"a"ANDA$<>"p"THEN370
371 CH=0:IFA$="p"THENCH=128
372 IFHR=12ANDCH=128THENCH=0:GOTO390
373 IFHR=12ANDCH=0THENCH=128
390 H3=INT(HR/10):H2=HR-(H3*10):POKE56587,(16*H3)+H2+CH
396 PRINTA$+"m"
400 INPUT"{home}{down*6}{reverse on}{white}THE MINUTE";H$:H=VAL(H$):IFH<0ORH>59THEN400
410 IFH$=""THEN490
420 H=0
430 IFLEN(H$)>1THENH=16*VAL(LEFT$(H$,1))
440 HH=VAL(RIGHT$(H$,1))
450 H=H+HH
460 POKE56586,H
470 POKE56585,0
480 POKE56584,0
490 PRINT"{home}{down*7}{reverse on}{light blue}CORRECT?{reverse on} {reverse off}{left}";
500 GETA$
510 IFA$="n"THENPRINT"n":GOTO300
520 IFA$<>"y"THEN500
530 PRINT"y":PRINT"{reverse on}{blue}KILL{sh space}THE{sh space}MONSTER ?{reverse on} {reverse off}{left}";
540 O=0
550 GETA$
560 IFA$="y"THENPOKE713,15:PRINT"y":GOTO600
570 IFA$=CHR$(13)THENPOKE713,0:PRINT:GOTO600
580 IFA$="n"THENPOKE713,0:PRINT"n":GOTO600
590 GOTO550
600 PRINT"{clear}Loading program...{black}"
610 PRINT"{home}{down*2}new"+CHR$(13)+"{down*2}load"+CHR$(34)+"bbs"+CHR$(34)+",";PEEK(186)
612 PRINT"{home}{down*10}run"
615 FORI=631TO634:POKEI,13:NEXTI:POKE198,3:PRINT"{home}";:END
680 A$=" {pink}Z{yellow}e{white}l{cyan}c{light blue}h{black} ":X=1:Y=27
683 PRINT"{home}";TAB(X);A$;"{home}";TAB(Y);A$
685 X=X+1:Y=Y-1:IFX>YTHEN680
687 GETB$:IFB$<>CHR$(13)THEN683
688 GOTO 100
690 PRINT"{clear}               {light blue}Z{cyan}e{white}l{yellow}c{pink}h"
691 PRINT"{down}                {light green}BBS"
700 PRINT"{down*3}            {yellow}Version 3.7"
710 PRINT"{down}{white}    Copyright (C)1989 Bo Zimmerman"
712 PRINT"{down*2}{light green}   Another product of {reverse on}{blue}o{light blue}o{cyan}o{white}Planet>>"
713 PRINT"{up}{down}{white}                      {white*2} {white} {white} {white} {reverse on}Inc{black}
720 PRINT"{down*6}{green}            RETURN{sh space}for BBS":GOTO680
1000 PRINTCHR$(14)+"{clear}{pink}Window installed":POKE1,PEEK(1)AND253
1001 LOAD"cursor",BV,1
1005 PRINT"{yellow}Cursor loaded"
1010 LOAD"ascii table",BV,1
1015 PRINT"{white}Ascii tables loaded"
1020 LOAD"v3.7 ml1",BV,1
1025 PRINT"{cyan}System ML loaded"
1030 LOAD"v3.7 ml2",BV,1
1035 PRINT"{light blue}Interrupts loaded"
1040 LOAD"p.protocol",BV,1
1050 POKE57722,165:POKE644,149:POKE56,149:POKE643,56:POKE55,56:CLR
1060 POKE1,PEEK(1)OR2:GOTO50
