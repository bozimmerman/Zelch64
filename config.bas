!--------------------------------------------------
!- Saturday, May 20, 2017 12:04:02 AM
!- Import of : 
!- c:\src\zelch64\config.prg
!- Commodore 64
!--------------------------------------------------
5 POKE55,0:POKE56,117:POKE51,0:POKE56,117
10 POKE53280,0:POKE53281,0:PRINTCHR$(14)+"{pink}{clear}{down*2}{right*7}Zelch v1.5a Configurator"
20 PRINT"{down}{right*12}By:{yellow}The Zacman
30 PRINT"{down*5}{white}{right*3}Insert a blank disk and hit RETURN":POKE198,0
40 GETA$:IFA$<>CHR$(13)THEN40
50 INPUT"{clear}{light blue}Is this a formatted disk  n{left*3}";A$
60 IFA$="n"THENPRINT"{light blue}Working...":OPEN1,8,15,"n0:Zelch v1.5x,{pound}{pound}":CLOSE1:GOTO90
70 IFA$<>"y"THEN50
80 PRINT"{light blue}Moment...":OPEN1,8,15,"n0:Zelch v1.5x":CLOSE1
90 OPEN1,8,15,"i":CLOSE1:
91 POKE19,65:INPUT"{white}Name of your BBS:";N$:POKE19,0
100 POKE19,65:INPUT"{home}{down*3}{pink}Your handle:";NA$:POKE19,0:IFNA$=""ORLEN(NA$)>17THEN100
110 POKE19,65:INPUT"{home}{down*4}{yellow}Your name:";RN$:POKE19,0:IFRN$=""ORLEN(RN$)>17THEN110
120 POKE19,65:INPUT"{home}{down*5}{white}Your fone:";PH$:POKE19,0:IFPH$=""ORLEN(PH$)>8THEN120
130 POKE19,65:INPUT"{home}{down*6}{light green}Your pass:";PS$:POKE19,0:IFPS$=""ORLEN(PS$)>7THEN130
135 PRINT"{home}{down*7}{green}More then one drive (y/n)?"
136 GETA$:IFA$="n"THENN=8:GOTO140
137 IFA$="y"THENN=9:GOTO140
138 GOTO136
140 PRINT"{clear}{pink}Creating User log..."
150 OPEN1,8,15:OPEN2,8,2,"{pound}userlog,l,"+CHR$(150):GOTO170
160 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(I):RETURN
170 I=5:GOSUB160:PRINT#2,NA$:I=5:GOSUB160:PRINT#2,NA$
180 I=25:GOSUB160:PRINT#2,PH$:I=35:GOSUB160:PRINT#2,"9"
190 I=40:GOSUB160:PRINT#2,RN$:I=60:GOSUB160:PRINT#2,"3/ 1"
200 I=80:GOSUB160:PRINT#2,"3:50":I=90:GOSUB160:PRINT#2,PS$
205 FORI=100TO145STEP5:GOSUB160:PRINT#2,"0":NEXTI:CLOSE2:CLOSE1
210 OPEN1,8,15:OPEN2,8,2,"{pound}calls,l,"+CHR$(6)
220 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(1):PRINT#2,"0":CLOSE1:CLOSE2
230 PRINT"{yellow}Creating Main Files..."
231 OPEN8,8,8,"{pound}opening msg,s,w":PRINT#8,"Welcome to "+N$:CLOSE8
232 OPEN8,8,8,"{pound}closing msg,s,w":PRINT#8,"Thanx for calling "+N$:CLOSE8
240 OPEN8,8,8,"{pound}Mpreps,s,w":PRINT#8,N$:PRINT#8,N:PRINT#8,6
250 PRINT#8,"{pound}e1":PRINT#8,3:PRINT#8,"e"
251 PRINT#8,"{pound}v1":PRINT#8,5:PRINT#8,"v"
252 PRINT#8,"{pound}j1":PRINT#8,9:PRINT#8,"z"
253 PRINT#8,"{pound}f1":PRINT#8,5:PRINT#8,"m"
254 PRINT#8,"{pound}d1":PRINT#8,5:PRINT#8,"t"
255 PRINT#8,"{pound}q1":PRINT#8,9:PRINT#8,"q"
256 CLOSE8:OPEN8,8,8,"{pound}last caller,s,w":PRINT#8,NA$:PRINT#8,"3:50":PRINT#8,1
257 CLOSE8:OPEN8,8,8,"{pound}info,s,w":PRINT#8,"This BBS runs on Zelch v1.5":CLOSE8
258 OPEN8,8,8,"{pound}newuser,s,w":PRINT#8,"Leave feedback with some personal info"
259 CLOSE8:OPEN8,8,8,"{pound}newsfile,s,w":PRINT#8,"Suprise!":CLOSE8
260 CLOSE8:PRINT"{white}Creating Menus...":Q$=CHR$(13)
270 FORI=0TO9:OPEN8,8,8,"{pound}mainmenu"+STR$(I)+",s,w"
280 PRINT#8,"Menu:"+Q$+"O-Off"+Q$+"U-Userlist"+Q$+"I-Info"
290 PRINT#8,"S-Status"+Q$+"C-Chat":IFI>=3THENPRINT#8,"E-Email"
300 IFI>=5THENPRINT#8,"V-Vote"+Q$+"M-Message Base"+Q$+"T-Transfer"
310 IFI>=9THENPRINT#8,"Z-Msg Editor"+Q$+"Q-Sysop area"
320 PRINT#8,"F-Feedback":CLOSE8:NEXTI
330 OPEN8,8,8,"{pound}sysopmenu,s,w":PRINT#8,"{clear}D-Disk Channel"+Q$+"L-List Users"
340 PRINT#8,"E-Edit Users"+Q$+"Q-Quit":CLOSE8
350 OPEN8,8,8,"{pound}msgmkr help,s,w":PRINT#8,"v1.0 commands:"
360 PRINT#8,"ex-edit line #x"+Q$+"a-abort"+Q$+"s-save"+Q$+"d-delete line(s)"
370 PRINT#8,"i-insert lines"+Q$+"l-list with line #'s"+Q$+"v-view"
380 CLOSE8
390 OPEN8,8,8,"{pound}editmenu,s,w":PRINT#8,"E-Edit Edit seq file"+Q$+"R-Read msg"
400 PRINT#8,"S-Response delete"+Q$+"D-Delete msg"+Q$+"L-List Sigs"+Q$+"C-Sig #"
410 PRINT#8,"Q-Quit":CLOSE8
420 OPEN8,8,8,"{pound}msgmenu,s,w":PRINT#8,"Menu:"
430 PRINT#8,"R-Read msg"+Q$+"RETURN=next msg"+Q$+"P-Post msg"+Q$+"N-New msgs"
440 PRINT#8,"S-Scan msgs"+Q$+"L-List Sigs"+Q$+"C-Change Sigs"+Q$+"Q-Quit":CLOSE8
450 OPEN8,8,8,"{pound}udmenu,s,w":PRINT#8,"{clear}Menu:"+Q$+"U-Upload"+Q$+"D-Download"
460 PRINT#8,"$-Directory"+Q$+"Q-Quit":CLOSE8
470 OPEN8,8,8,"{pound}emailmenu,s,w":PRINT#8,"Menu:"+Q$+"S-Send Mail"+Q$+"R-Read Mail"
480 PRINT#8,"U-Userlist"+Q$+"Q-Quit":CLOSE8
490 PRINT"{cyan}Creating Msg base..."
500 OPEN8,8,8,"{pound}Fpreps,s,w":PRINT#8,2:PRINT#8,"General":PRINT#8,5:PRINT#8,N
510 PRINT#8,20:PRINT#8,"BBS info":PRINT#8,5:PRINT#8,N:PRINT#8,20
520 PRINT#8,"Debate":PRINT#8,5:PRINT#8,N:PRINT#8,20:CLOSE8
530 OPEN1,8,15:OPEN2,8,2,"{pound}index.File,l,"+CHR$(10)
540 PRINT#1,"p"CHR$(98)CHR$(1)CHR$(0)CHR$(1):PRINT#2,"0"
550 FORI=2TO4:PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(1):PRINT#2,CHR$(255)
560 CLOSE2:CLOSE1:FORI=0TO2:OPEN8,N,8,"{pound}Sig"+STR$(I)+",s,w":FORX=0TO20
570 PRINT#8,"0":PRINT#8,"0":NEXTX:CLOSE8
575 OPEN8,N,8,"{pound}sigmsg"+STR$(I)+",s,w":PRINT#8,"Sig number"+STR$(I+1):CLOSE8
576 NEXTI
580 PRINT"{light blue}Creating Vote Section.."
590 OPEN8,8,8,"{pound}vote,s,w":PRINT#8,"How do you like it?":PRINT#8,1
600 PRINT#8,"Yes":PRINT#8,"Said they liked it":PRINT#8,"No"
610 PRINT#8,"Will get their access erased":CLOSE8:OPEN8,8,8,"{pound}question,s,w"
620 PRINT#8,"How do you like this program?":CLOSE8:OPEN8,8,8,"{pound}vote box,s,w"
630 PRINT#8,1:PRINT#8,0:CLOSE8
640 PRINT"{yellow}{clear}Zelch Copy-Some":PRINT"{white}01):{yellow}{pound}@1            :12":FI$="{pound}@1":GOSUB1000
650 PRINT"{home}{down}{white}02):{yellow}{pound}b1    ":FI$="{pound}b1":GOSUB1000
660 PRINT"{home}{down}{white}03):{yellow}{pound}v1    ":FI$="{pound}v1":GOSUB1000
670 PRINT"{home}{down}{white}04):{yellow}{pound}q1    ":FI$="{pound}q1":GOSUB1000
680 PRINT"{home}{down}{white}05):{yellow}{pound}d1    ":FI$="{pound}d1":GOSUB1000
690 PRINT"{home}{down}{white}06):{yellow}{pound}f1    ":FI$="{pound}f1":GOSUB1000
700 PRINT"{home}{down}{white}07):{yellow}{pound}j1    ":FI$="{pound}j1":GOSUB1000
710 PRINT"{home}{down}{white}08):{yellow}{pound}n1    ":FI$="{pound}n1":GOSUB1000
720 PRINT"{home}{down}{white}09):{yellow}{pound}e1    ":FI$="{pound}e1":GOSUB1000
730 PRINT"{home}{down}{white}10):{yellow}{pound}m1    ":FI$="{pound}m1":GOSUB1000
740 PRINT"{home}{down}{white}11):{yellow}{pound}p.protocol    ":FI$="{pound}p.protocol":GOSUB1000
750 PRINT"{home}{down}{white}12):{yellow}{pound}v1.5 ml1        ":FI$="{pound}v1.5 ml1":GOSUB1000
760 PRINT"{home}{down*5}{light green}Have Fun!":END
1000 PRINT"{home}{down*2}Put in your SYSTEM disk (RETURN)        ":POKE198,0:FL=0:WH=0
1005 POKE198,0:PRINT"           {up}"
1010 GETA$:IFA$<>CHR$(13)THEN1010
1020 OPEN1,8,15,"i":OPEN8,8,8,FI$+",p,r":PRINT"Reading..."
1120 GET#8,A$:IF(ST AND 64)THENFL=1
1125 IFA$=""THENA$=CHR$(0)
1130 WH=WH+1:POKE30000+WH,ASC(A$):IFFL=1THENCLOSE8:POKE198,0:GOTO1500
1140 GOTO1120
1500 PRINT"{home}{down*2}Put in your  DATA  disk (RETURN)        ":PRINT"           {up}"
1501 GETA$:IFA$<>CHR$(13)THEN1501
1502 Q$=CHR$(13):PRINT#1,"i":OPEN9,8,8,FI$+",p,w":I=1:PRINT"Writing..."
1505 PRINT#9,CHR$(PEEK(30000+I));:I=I+1
1506 IFI<=WHTHEN1505
1510 CLOSE1:CLOSE9:RETURN