!--------------------------------------------------
!- Saturday, May 20, 2017 2:39:22 AM
!- Import of : 
!- c:\src\zelch64\config.prg
!- Commodore 64
!--------------------------------------------------
5 POKE55,0:POKE56,117:POKE51,0:POKE56,117
10 POKE53280,0:POKE53281,0:PRINTCHR$(14)+"{pink}{clear}{down*2}{right*7}Zelch v2.0 Configurator"
20 PRINT"{down}{right*12}By:{yellow}The Zacman
30 PRINT"{down*5}{white}{right*3}Insert a blank disk in drive 8."
31 PRINT"{right*3}If you have more then one drive,"
32 PRINT"{right*6}insert a blank in drive 9.":POKE198,0
35 PRINT"              HIT{sh space}RETURN"
40 GETA$:IFA$<>CHR$(13)THEN40
50 INPUT"{clear}{light blue}Is this a formatted disk  n{left*3}";A$
60 IFA$="n"THENPRINT"{light blue}Working...":OPEN1,8,15,"n0:Zelch v2.0x,{pound}{pound}":CLOSE1:GOTO90
70 IFA$<>"y"THEN50
80 PRINT"{light blue}Moment...":OPEN1,8,15,"n0:Zelch v2.0x":CLOSE1
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
240 OPEN8,8,8,"{pound}variables,s,w":PRINT#8,N$:PRINT#8,N:PRINT#8,"foicuseqmtvbl"
250 PRINT#8,"0000000755404":PRINT#8,"hsedlcvia"
251 PRINT#8,"lcrsnqpxd":PRINT#8,"000000377":PRINT#8,2:PRINT#8,"General"
252 PRINT#8,0:PRINT#8,8:PRINT#8,20:PRINT#8,"BBS info":PRINT#8,2:PRINT#8,N
253 PRINT#8,20:PRINT#8,"UD info":PRINT#8,5:PRINT#8,N:PRINT#8,20:PRINT#8,0
254 PRINT#8,"UD section":PRINT#8,4:PRINT#8,N:FORI=1TO10:PRINT#8,I
255 PRINT#8,4:NEXTI:CLOSE8:OPEN8,8,8,"{pound}last caller,s,w"
256 PRINT#8,NA$:PRINT#8,"3:50":PRINT#8,0:PRINT#8,0:CLOSE8
257 OPEN8,8,8,"{pound}info,s,w":PRINT#8,"This BBS runs on Zelch v2.0":CLOSE8
258 OPEN8,8,8,"{pound}newuser,s,w":PRINT#8,"Leave feedback with some personal info"
259 CLOSE8:OPEN8,8,8,"{pound}newsfile,s,w":PRINT#8,"ZELCH{sh space}BBS!":CLOSE8
260 CLOSE8:PRINT"{white}Creating Menus...":Q$=CHR$(13)
270 FORI=0TO9:OPEN8,8,8,"{pound}mainmenu"+STR$(I)+",s,w"
280 PRINT#8,"Menu:"+Q$+"O-Off"+Q$+"U-Userlist"+Q$+"I-Info"+Q$+"M-Msg base"
285 PRINT#8,"B-Baud change"+Q$+"S-Status"+Q$+"C-Chat"
290 IFI>=3THENPRINT#8,"E-Email":PRINT#8,"L-Library files"
300 IFI>=5THENPRINT#8,"V-Vote"+Q$+"T-Transfer"
310 IFI>=9THENPRINT#8,"Q-Sysop area"
320 PRINT#8,"F-Feedback":CLOSE8:NEXTI
330 OPEN8,8,8,"{pound}sysopmenu,s,w":PRINT#8,"{clear}D-Disk Channel"+Q$+"L-List Users"
340 PRINT#8,"E-Edit Users"+Q$+"Q-Quit"+Q$+"R-Reset vote"+Q$+"V-Edit vote":CLOSE8
350 OPEN8,8,8,"{pound}msgmkr help,s,w":PRINT#8,"v1.3 commands:"
360 PRINT#8,"ex-edit line #x"+Q$+"c-clear"+Q$+"s-save"+Q$+"d-delete line(s)"
370 PRINT#8,"i-insert lines"+Q$+"l-list with line #'s"+Q$+"v-view"+Q$+"a-abort"
380 PRINT#8,"w-word wrap toggle"+Q$+"u-uppercase toggle":CLOSE8
420 OPEN8,8,8,"{pound}msgmenu,s,w":PRINT#8,"Menu:"
430 PRINT#8,"R-Read msg"+Q$+"RETURN=next msg"+Q$+"P-Post msg"+Q$+"N-New msgs"
440 PRINT#8,"S-Scan msgs"+Q$+"L-List Sigs"+Q$+"C-Change Sigs"+Q$+"Q-Quit":CLOSE8
450 OPEN8,8,8,"{pound}udmenu,s,w":PRINT#8,"{clear}Menu:"+Q$+"U-Upload"+Q$+"D-Download"
460 PRINT#8,"$-Directory"+Q$+"Q-Quit"+Q$+"Change UD"+Q$+"List UD's":CLOSE8
470 OPEN8,8,8,"{pound}emailmenu,s,w":PRINT#8,"Menu:"+Q$+"S-Send Mail"+Q$+"R-Read Mail"
480 PRINT#8,"U-Userlist"+Q$+"Q-Quit":CLOSE8
490 PRINT"{cyan}Creating Msg base..."
530 FORI=0TO2:OPEN1,8,15:OPEN2,8,2,"{pound}Sig"+STR$(I)+",l,"+CHR$(15):FORG=1TO21
540 PRINT#1,"p"CHR$(98)CHR$(G)CHR$(0)CHR$(1):PRINT#2,"0"
550 PRINT#1,"p"CHR$(98)CHR$(G)CHR$(0)CHR$(7):PRINT#2,"0":NEXTG
560 CLOSE2:CLOSE1
575 OPEN8,N,8,"{pound}sigmsg"+STR$(I)+",s,w":PRINT#8,"Sig number"+STR$(I+1):CLOSE8
576 NEXTI
580 PRINT"{light blue}Creating Vote Section.."
590 OPEN8,8,8,"{pound}vote,s,w":PRINT#8,"How do you like it?":PRINT#8,1
600 PRINT#8,"Yes":PRINT#8,"Said they liked it":PRINT#8,"No"
610 PRINT#8,"Will get their access erased":CLOSE8:OPEN8,8,8,"{pound}question,s,w"
620 PRINT#8,"Do you like this program?":CLOSE8:OPEN8,8,8,"{pound}vote box,s,w"
630 PRINT#8,"start":CLOSE8
640 PRINT"{yellow}{clear}Zelch Copy-Some":PRINT"{white}01):{yellow}{pound}v2.0 ml1      :2"
650 FI$="{pound}v2.0 ml1":GOSUB1000:
660 PRINT"{home}{down}{white}02):{yellow}{pound}p.protocol":FI$="{pound}p.protocol":GOSUB1000
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
