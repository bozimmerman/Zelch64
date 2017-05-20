!--------------------------------------------------
!- Saturday, May 20, 2017 1:53:53 AM
!- Import of : 
!- c:\src\zelch64\zelch.prg
!- Commodore 64
!--------------------------------------------------
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
90 GOTO680
100 MN=PEEK(703)
110 INPUT"{clear}{reverse on}{pink}Enter the MONTH";MN
120 IFMN>12THEN100
130 POKE703,MN
140 DA=PEEK(704)
150 INPUT"{reverse on}{yellow}Enter the DAY";DA
160 IFDA>30THENPRINT"{home}":GOTO130
170 POKE704,DA
250 PRINT
260 PRINT"{reverse on}{light blue}Correct?"
270 GETA$
280 IFA$="n"THEN100
290 IFA$<>"y"THEN270
300 INPUT"{reverse on}{light green}What is the Hour";HR$
310 HR=0:HH=0
320 IFLEN(HR$)>1THENHR=16
330 HH=VAL(RIGHT$(HR$,1))
340 HR=(HR+HH)
350 POKE56331,HR
360 PRINT"{reverse on}{yellow}{cyan}Am or Pm?"
370 GETA$
371 IFA$="p"ANDHR$="12"THENA$="a":GOTO390
372 IFA$="a"ANDHR$="12"THENA$="p"
380 IFA$="p"THENPOKE56331,HROR128:GOTO400
390 IFA$<>"a"THEN370
395 POKE56331,HRAND127
400 INPUT"{reverse on}{white}What is the Minute";H$
410 IFH$=""THEN530
420 H=0
430 IFLEN(H$)>1THENH=16*VAL(LEFT$(H$,1))
440 HH=VAL(RIGHT$(H$,1))
450 H=H+HH
460 POKE56330,H
470 POKE56329,0
480 POKE56328,0
490 PRINT"{reverse on}{light blue}Correct?"
500 GETA$
510 IFA$="n"THEN300
520 IFA$<>"y"THEN500
530 PRINT"{reverse on}{blue}Printer {reverse on}on{reverse off}?"
540 O=0
550 GETA$
560 IFA$="y"THENO=1:POKE709,1:GOTO600
570 IFA$=CHR$(13)THENPOKE709,0:GOTO600
580 IFA$="n"THENPOKE709,0:GOTO600
590 GOTO550
600 PRINT"{clear}Loading program...{black}"
610 PRINT"{home}{down*2}load"+CHR$(34)+"{pound}@1"+CHR$(34)+",8"
615 PRINT"{home}{down*7}run":FORI=631TO633:POKEI,13:NEXTI:POKE198,2:PRINT"{home}";:END
680 PRINT"{clear}{down*3}                {light blue}Z{cyan}e{white}l{yellow}c{pink}h"
690 PRINT"{down}                 {light green}BBS"
700 PRINT"{down*2}             {yellow}Version 1.7b"
710 PRINT"        {white}Freeware by:{yellow}{reverse on}The Zacman"
720 PRINT"{down*8}{green}            RETURN{sh space}for BBS"
730 PRINT"{light green}            (E) for Editor{black}"
740 GETA$
750 IFA$=CHR$(13)THEN100
760 IFA$<>"e"THEN740
770 LOAD"editor 1.7",8
780 END
1000 PRINTCHR$(14)+"Window installed"
1001 LOAD"cursor",8,1
1005 PRINT"Cursor loaded"
1010 LOAD"ascii table",8,1
1015 PRINT"Ascii tables loaded"
1020 LOAD"{pound}v1.7 ml1",8,1
1025 PRINT"System ML loaded"
1030 LOAD"v1.7 ml2",8,1
1035 PRINT"Interupts loaded"
1040 POKE1,55:POKE57722,165
1050 OPEN15,8,15:CMD15,;:PRINT#15,"m-w{ct g}{red}{ct a}{ct o}
1060 CLOSE15:GOTO50
