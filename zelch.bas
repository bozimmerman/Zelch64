!--------------------------------------------------
!- Friday, May 19, 2017 9:52:57 PM
!- Import of : 
!- c:\src\zelch64\b - zelch.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
10 CLR
20 IFPEEK(700)<>16THENPOKE700,16:LOAD"{pound}cursor",8,1
30 IFPEEK(706)<>16THENPOKE706,16:LOAD"{pound}ascii table",8,1
40 IFPEEK(707)<>16THENPOKE707,16:LOAD"{pound}v1.0 ml",8,1
50 PRINT"{clear}"+CHR$(14)+"{yellow}"
60 POKE53280,0
70 POKE53281,251
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
310 HR=0
320 IFLEN(HR$)>1THENHR=16
330 HH=VAL(RIGHT$(HR$,1))
340 HR=(HR+HH)
350 POKE56331,HR
360 PRINT"{reverse on}{yellow}{cyan}Am or Pm?"
370 GETA$
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
610 LOAD"{pound}@1",8
680 PRINT"{clear}{down*3}                {light blue}Z{cyan}e{white}l{yellow}c{pink}h"
690 PRINT"{down}                 {light green}BBS"
700 PRINT"{down*2}             {yellow}Version 1.0a"
710 PRINT"        {white}Freeware by:{yellow}{reverse on}The Zacman"
720 PRINT"{down*8}{green}            RETURN{sh space}for BBS"
730 PRINT"{light green}            (E) for Editor"
740 GETA$
750 IFA$=CHR$(13)THEN100
760 IFA$<>"e"THEN740
770 LOAD"e.menu",8
780 END
