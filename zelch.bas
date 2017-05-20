!--------------------------------------------------
!- Saturday, May 20, 2017 4:13:38 PM
!- Import of : 
!- c:\src\zelch64\zelch.prg
!- Commodore 64
!--------------------------------------------------
5 POKE53280,0:POKE53281,0:PRINT"{clear}":POKE701,169
10 CLR
15 IFPEEK(716)<>16THENPOKE716,16:LOAD"window.ml",8,1
17 IFPEEK(715)<>16THENPOKE715,16:SYS49152:POKE59639,2:POKE59671,3:POKE57722,96
20 IFPEEK(700)<>16THENPOKE700,16:POKE1,53:GOTO1000
50 PRINT"{clear}"+CHR$(14)+"{yellow}"
51 POKE56334,PEEK(56334)AND254:POKE1,PEEK(1)AND251:POKE788,0:POKE789,203
52 POKE1,PEEK(1)OR4:POKE56334,PEEK(56334)OR1
60 POKE53280,0
70 POKE53281,0
80 IFPEEK(57043)=169THENSYS57043
90 GOTO690
100 MN=0
110 INPUT"{clear}{reverse on}{pink}Enter the MONTH";MN
120 IFMN>12ORMN=0THEN100
130 POKE703,MN
140 DA=0
150 INPUT"{home}{down}{reverse on}{yellow}Enter the DAY";DA
160 IFDA>31ORDA=0THEN140
170 POKE704,DA
250 PRINT
260 PRINT"{home}{down*2}{reverse on}{light blue}Correct?{reverse on} {reverse off}{left}";
270 GETA$
280 IFA$="n"THENPRINT"n":GOTO100
290 IFA$<>"y"THEN270
295 PRINT"y"
300 INPUT"{home}{down*3}{reverse on}{light green}What is the Hour";HR$:HR=VAL(HR$):IFHR=0ORHR>13THEN300
310 HR=0:HH=0
320 IFLEN(HR$)>1THENHR=16
330 HH=VAL(RIGHT$(HR$,1))
340 HR=(HR+HH)
350 POKE56587,HR
360 PRINT"{home}{down*4}{reverse on}{yellow}{cyan}Am or Pm?{reverse on} {reverse off}{left}";
370 GETA$
371 IFA$="p"ANDHR$="12"THENA$="a":GOTO390
372 IFA$="a"ANDHR$="12"THENA$="p"
380 IFA$="p"THENPOKE56587,HROR128:PRINT"p":GOTO400
390 IFA$<>"a"THEN370
391 PRINT"a"
395 POKE56587,HRAND127
400 INPUT"{home}{down*5}{reverse on}{white}What is the Minute";H$:H=VAL(H$):IFH=0ORH>59THEN400
410 IFH$=""THEN490
420 H=0
430 IFLEN(H$)>1THENH=16*VAL(LEFT$(H$,1))
440 HH=VAL(RIGHT$(H$,1))
450 H=H+HH
460 POKE56586,H
470 POKE56585,0
480 POKE56584,0
490 PRINT"{home}{down*6}{reverse on}{light blue}Correct?{reverse on} {reverse off}{left}";
500 GETA$
510 IFA$="n"THENPRINT"n":GOTO300
520 IFA$<>"y"THEN500
530 PRINT"y":PRINT"{reverse on}{blue}Printer {reverse on}on{reverse off}?{reverse on} {reverse off}{left}";
540 O=0
550 GETA$
560 IFA$="y"THENO=1:POKE709,1:PRINT"y":GOTO600
570 IFA$=CHR$(13)THENPOKE709,0:PRINT:GOTO600
580 IFA$="n"THENPOKE709,0:PRINT"n":GOTO600
590 GOTO550
600 PRINT"{clear}Loading program...{black}"
610 PRINT"{home}{down*2}load"+CHR$(34)+"bbs"+CHR$(34)+",8"
612 PRINT"{home}{down*7}fori=631to635:pokei,0:next:run"
615 FORI=631TO633:POKEI,13:NEXTI:POKE198,2:PRINT"{home}";:END
680 A$=" {pink}Z{yellow}e{white}l{cyan}c{light blue}h{black} ":X=1:Y=27
683 PRINT"{home}";TAB(X);A$;"{home}";TAB(Y);A$
685 X=X+1:Y=Y-1:IFX>YTHEN680
687 GETB$:IFB$<>CHR$(13)THEN683
688 GOTO 100
690 PRINT"{clear}               {light blue}Z{cyan}e{white}l{yellow}c{pink}h"
691 PRINT"{down}                {light green}BBS"
700 PRINT"{down*3}            {yellow}Version 3.0"
710 PRINT"{down}{white}    Copyright (C)1988 Bo Zimmerman"
712 PRINT"{down*2}{light green}   Another product of {reverse on}{blue}o{light blue}o{cyan}o{white}Planet>>"
713 PRINT"{up}{down}{white}                      {white*2} {white} {white} {white} {reverse on}Inc.{black}
715 GOSUB1100
720 PRINT"{down*6}{green}            RETURN{sh space}for BBS":GOTO680
1000 PRINTCHR$(14)+"{clear}{pink}Window installed"
1001 LOAD"cursor",8,1
1005 PRINT"{yellow}Cursor loaded"
1010 LOAD"ascii table",8,1
1015 PRINT"{white}Ascii tables loaded"
1020 LOAD"v3.0 ml1",8,1
1025 PRINT"{cyan}System ML loaded"
1030 LOAD"v3.0 ml2",8,1
1035 PRINT"{light blue}Interupts loaded"
1040 LOAD"p.protocol",8,1
1050 POKE1,55:POKE57722,165:POKE644,149:POKE56,149:POKE643,56:POKE55,56:CLR
1060 GOTO50
1100 FORX=1TO8:READFH(X),FL(X):NEXT
1110 WF=64:A=3:D=0:SU=15:R=10:AD=A*16+D:SR=SU*16+R
1120 S=54272:FORI=STOS+24:POKEI,0:NEXT
1130 POKES+24,15:POKES+5,AD:POKES+6,SR
1140 READN:IFN=0THENRETURN
1150 IFN=9THENFORI=1TO45:NEXT:GOTO1140
1160 POKES+1,FH(N):POKES,FL(N):IFWF=64THENPOKES+3,7:POKES+2,150
1170 POKES+4,WF+1:FORT=1TO50:NEXT:POKES+4,WF:GOTO1140
1180 DATA28,49,31,165,33,135,37,162
1190 DATA42,62,44,193,50,60,25,30
1200 DATA8,3,5,7,9,7,5,9,5,3,5,3,8,9,9,9
1210 DATA8,3,5,7,9,7,5,9,5,3,9,3,8,9,8,3,9,9,0
