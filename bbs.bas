!--------------------------------------------------
!- Saturday, May 20, 2017 2:43:05 PM
!- Import of : 
!- c:\src\zelch64\bbs.prg
!- Commodore 64
!--------------------------------------------------
1 PRINTCHR$(14):GOTO25
2 M0=PEEK(701):IFM0=0THENPRINT#5,"at"+A$:GOSUB89:GET#5,A$:GET#5,A$
3 POKE56579,32:POKE56577,0:GET#5,A$:GET#5,A$:RETURN
5 OPEN1,8,15,"i0":SYSZ,1:RETURN
6 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(I):RETURN
7 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(I):SYS38233:RETURN
12 IFP0>50THENP0$(50)="log full":RETURN
13 P0$(P0)=E$:P0=P0+1:RETURN
25 CLOSE5:OPEN5,2,3,CHR$(6)+CHR$(0)+CHR$(0)+CHR$(0):GOSUB6810
30 Z=38239:DIMTT$(55),Z1(50),Z2(50),P0$(50),DA(12):POKE53280,0
40 DA(1)=31:DA(2)=28:DA(3)=31:DA(4)=30:DA(6)=31:DA(7)=31
45 DA(8)=31:DA(9)=30:DA(10)=31:DA(11)=30:DA(12)=31:DA(5)=31
50 IFPEEK(702)<>16THENGOTO230
60 POKE702,0:MN=PEEK(703):DA=PEEK(704)
70 GOTO290
80 M0=PEEK(701):POKE56579,32:POKE56577,0:IFM0=1THENRETURN
81 IFM0=2THENPOKE56577,32:POKE56579,0:RETURN
82 IF(PEEK(56577)AND16)=16THENRETURN
83 GOSUB85:PRINT#5,"+++";:GOSUB89:PRINT#5,"ath0":GOSUB85:GET#5,A$:RETURN
85 T$=TI$
86 IFT$=TI$THEN86
87 RETURN
88 FORI=0TO9:POKE721+I,PEEK(43+I):NEXT:SYS51971:LOADI$,8:
89 GOSUB85:GOSUB85:GOSUB85:RETURN
90 M0=PEEK(701):IFM0=0THENRETURN
91 IFM0=2THENPOKE56579,38:POKE56577,0
92 IFM0=1THENPOKE56579,6:POKE56577,2
93 RETURN
100 IN$="":SYS38200:IFPEEK(830)=1THEN1230
101 IFPEEK(197)=5ANDPEEK(653)=1THEN106
102 IFPEEK(197)=6THEN107
103 IFPEEK(197)<>5THENRETURN
104 PRINTCHR$(13)+"ACS:"+STR$(AC)
105 INPUT"NEW{sh space}ACS";AC:RETURN
106 I=255:GOSUB1700:PRINT"BURST!":RETURN
107 TX$=CHR$(13)+"Hold on...":GOSUB210:PRINT"F1 aborts.."
108 POKE720,1:RETURN
111 I=0:SYS38206:POKE710,0:POKE731,0:IFPEEK(830)>0THEN1230
112 IFI$=""ORLEN(I$)>4THENRETURN
113 FORI8=1TOLEN(I$):IFMID$(I$,I8,1)="e"ANDVAL(LEFT$(I$,1))>0THENI$="0"
114 NEXT:IFVAL(I$)>0THENI=VAL(I$)
115 RETURN
120 IFOU$=""THENRETURN
130 POKE254,ASC(OU$):SYS38203:RETURN
190 SYS38206:POKE710,0:POKE731,0:IFPEEK(830)=1THEN1230
200 RETURN
210 IFTX$=""THENRETURN
220 SYS 38209,TX$:POKE710,0:RETURN
230 PRINT"{yellow}";:MN=PEEK(703):DA=PEEK(704):O=PEEK(709)
240 PRINT"Data disk(s) IN!"
250 PRINT"Press {reverse on}return{reverse off}"
260 GETA$:IFA$<>CHR$(13)THEN260
270 POKE56334,PEEK(56334)AND254:POKE1,PEEK(1)AND251:POKE788,0:POKE789,203
280 POKE1,PEEK(1)OR4:POKE56334,PEEK(56334)OR1
290 OPEN1,8,15,"i0":OPEN8,8,8,"0:{pound}variables,s,r":INPUT#8,BN$:INPUT#1,E1
300 IFE1<>0THENSYSZ,8:SYSZ,1:PRINT"{up*2}";:POKE646,INT(RND(TI)*15)+1:GOTO240
310 INPUT#8,MD,CD$,CC$,CE$,CF$,CG$,SG:DIMSG$(SG),SG(SG),SD(SG),SF(SG)
314 FORI=0TOSG:INPUT#8,SG$(I),SG(I),SD(I),SF(I):NEXTI
315 INPUT#8,UD:DIMUD$(UD),UA(UD),UV(UD)
316 FORI=0TOUD:INPUT#8,UD$(I),UA(I),UV(I):NEXTI:FORI=0TO9:INPUT#8,CA(I),TM(I)
320 NEXTI:INPUT#8,UL,CH$,CI$:INPUT#8,SS:DIMSS(SS),SS$(SS),FL(SS):FORI=0TOSS
330 INPUT#8,SS$(I),SS(I):NEXT:FORI=1TO8:INPUT#8,A$:POKE684+I,ASC(A$):NEXT
340 INPUT#8,M0:POKE701,M0
379 SYSZ,8:SYSZ,1
380 OPEN8,8,8,"0:{pound}last caller,s,r":SYS38230:L1$=I$:SYS38230:L2$=I$:INPUT#8,LZ
389 INPUT#8,HN:SYSZ,8:SYSZ,1:A$="x1e0m0v0":GOSUB2
390 PRINT"{clear}{down*13}{yellow}";BN$:C1=0:POKE682,0:POKE714,0:POKE705,0:GOSUB80
400 POKE53280,0:POKE53281,0:PRINT"{pink}BBS mode: {yellow}{reverse on}F1{reverse off} for menu":POKE829,0
410 PRINT"{cyan}{reverse on}F3{reverse off} to log-on":POKE896,0:POKE720,0
430 PRINT"{light blue}Last caller=";L1$:POKE720,0
440 PRINT"{blue}{yellow}Logged off at:";L2$
450 PRINT"{purple}Calls today:";STR$(PEEK(733))
460 SYS38215:PRINT"{home}{down}{right*2}{white}TIME=";I$+"{black}"
461 IF(PEEK(56577)AND8)=0ANDPEEK(701)>0THEN561
470 A$=LEFT$(I$,2):B$=RIGHT$(I$,2):A=VAL(A$)
480 IFB$="am"ANDPEEK(712)<>15THENIFA=1ORA=12THENPOKE712,15:GOTO1530
490 IFPEEK(712)=15ANDB$="am"ANDA<12ANDA>1THENPOKE712,0
500 GETQ$:IFQ$="{f1}"THEN580
520 IFQ$="{f3}"THENPOKE714,1:POKE830,0:POKE720,1:GOTO690
530 GET#5,R$:IFR$=""THEN460
540 IFR$="5"ORR$=CHR$(181)THENPOKE830,0:POKE714,0:GOSUB6800:GOTO690
550 IFR$="1"ORR$=CHR$(177)THENPOKE830,0:POKE714,0:GOSUB6810:GOTO690
560 GOTO460
561 CT=0:M0=PEEK(701):GOSUB90
562 IF(PEEK(56577)AND16)=0THENR$="1":GOTO550
563 CT=CT+1:IFCT<11THENFORI=0TO1000:NEXT:GOTO562
564 GOSUB80:GOTO460
580 PRINT"{yellow}{clear}MENU"
590 PRINT"1)Return to BBS
600 PRINT"2)Monster mode
610 PRINT"3)Zelch (Zap){sh space}Term"
620 PRINT"4)Read Feedback"
621 PRINT"5)View log"
630 GETA$:IFA$=""THEN630
640 IFA$="1"THEN390
650 IFA$="2"THENDD=1:GOTO1530
660 IFA$="3"THENI$="{pound}prg.term":GOTO88
665 IFA$="4"THENFI$="{pound}feedback":GOSUB5690
667 IFA$="5"THENFI$="{pound}Log!":GOSUB5690
680 GOTO630
690 SYSZ,1:SYSZ,2:CLOSE7:SYSZ,8:FORI=0TO50:GET#5,A$:NEXT
700 POKE681,0:TX$=CHR$(13)+CHR$(13)+"{white*2}connection!!!":GOSUB210:POKE1023,0
701 SYS38215:E$=I$+" Call":GOSUB12
710 TX$=CHR$(13)+CHR$(13)+"hit return:{ct c}":GOSUB210
720 TI$="000000"
730 GOSUB100:IFVAL(TI$)>59THEN1230
740 IFIN$<>CHR$(13)ANDIN$<>CHR$(10)THEN730
745 IFPEEK(714)=1THEN820
750 PRINT"{black}":NA$="":TX$=CHR$(13)+CHR$(13)+"graphics":GOSUB210
755 TX$="is the above word in uppercase?{ct c}":GOSUB210
760 TI$="000000"
770 GOSUB100:IFVAL(TI$)>59THEN1230
780 IFIN$=CHR$(110)THENIN$=CHR$(206)
790 IFIN$=CHR$(121)THENIN$=CHR$(217)
800 IFIN$="n"ORIN$="N"THENTX$=IN$:GOSUB210:GOTO830
810 IFIN$<>"Y"ANDIN$<>"y"THEN770
820 POKE681,1:TX$=IN$:GOSUB210:GOTO839
830 TX$="{f1}Need Linefeeds?{ct c}":GOSUB210:
831 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO839
832 IFIN$<>"y"THEN831
833 TX$="y":GOSUB210:POKE1023,1
839 PRINT"{white}":NN=1:FI$="{pound}opening msg":GOSUB1200:I=5:GOSUB1710:CT=0
840 SYSZ,2:SYSZ,1:SYSZ,8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
850 CT=CT+1:IFCT=6THENTX$="{f1}GOODBYE!":GOSUB210:GOTO1230
855 TX$=CHR$(14)+"{f1}?=Userlist":GOSUB210:TX$="{f1}Type 'NEW' if you have no ID #."
860 NE=0:GOSUB210:TX$=CHR$(13)+"{f1}Enter your ID number :{ct c}":GOSUB210:GOSUB111
861 IFI$="?"THENSYSZ,2:SYSZ,1:FI$="{pound}members":GOSUB1200:CT=CT-1:GOTO840
870 IFI=0ANDI$<>"new"THEN850
880 NA=VAL(I$):IFI$="new"THENSYSZ,1:SYSZ,2:I=20:GOSUB1710:I$="{pound}prg.new1":GOTO88
900 C2=INT(NA/256):I3=C2*256:C1=NA-I3
910 PRINT#1,"p"CHR$(98)CHR$(C1)CHR$(C2)CHR$(90):GET#2,A$:INPUT#1,E1
920 IFA$=""ORE1>0THEN970
930 SYS38233:PS$=A$+I$
940 TX$=CHR$(13)+"{f1}Enter your password  :{ct c}":GOSUB210:POKE710,1:GOSUB190
950 IFI$=PS$THENSYSZ,1:SYSZ,2:GOTO990
970 TX$="{red}Invalid Info!":GOSUB210:GOTO850
990 TX$="{clear}{f1}Loading Info...":GOSUB210:GOSUB1440:AC=VAL(AC$):E$=NA$:GOSUB12
991 I=TM(AC):GOSUB1700:I$="{pound}prg.open":GOTO88
1200 IFNN=1THENOU$="{clear}":GOSUB120
1205 IFPEEK(681)=0THENOU$=CHR$(13):GOSUB120
1210 IFVD<8ORVD>11THENVD=8
1220 GOSUB5:OPEN8,VD,8,"0:"+FI$+",s,r":SYS38212:SYSZ,8:IFPEEK(252)=0THEN1225
1221 TX$="hit return:{ct c}":GOSUB210:GOSUB6370
1225 NN=0:VD=0:RETURN
1230 SYSZ,1:SYSZ,2:SYSZ,8:SYSZ,9:SYSZ,7
1240 POKE1,55:IFPEEK(830)=1THENTX$="{red}Time UP!!":GOSUB210
1250 POKE703,MN:POKE704,DA
1260 IFNA$=""THENPOKE702,16:GOTO1345
1270 FI$="{pound}closing msg":GOSUB1200
1280 IFPEEK(709)=1THENOPEN4,4,7:SYS38215:PRINT#4,"off at:";I$:PRINT#4:CLOSE4
1290 CA$=STR$(VAL(CA$)+1)
1300 SYS38215:TM$=I$:LC$=STR$(MN)+"/"+STR$(DA):C2=INT(NA/256):C3=C2*256
1310 C1=NA-C3:GOSUB1350:TX$="{red}{reverse on}Bye...":GOSUB210:GOSUB80
1311 PRINT"{white}{reverse on}Log...":GOSUB5:OPEN1,8,15:OPEN8,8,8,"0:{pound}Log!,s,r":SYSZ,8
1312 INPUT#1,E:SYSZ,1:IFE=0THEN1317
1313 GOSUB5:OPEN8,8,8,"0:{pound}Log!,s,w":PRINT#8,"start":SYSZ,8
1317 IFP0=0THEN1320
1318 GOSUB5:OPEN8,8,8,"0:{pound}Log!,a":FORI=0TOP0-1:PRINT#8,P0$(I):NEXTI
1319 SYS38215:PRINT#8,"off at:"+I$:PRINT#8,CHR$(1):SYSZ,8:SYSZ,1
1320 OPEN1,8,15,"s0:{pound}last caller":SYSZ,1:SYS38215:GOSUB5
1330 OPEN8,8,8,"0:{pound}last caller,s,w":PRINT#8,NA$+"  ":LC$=LC$+" "+I$:PRINT#8,LC$
1340 PRINT#8,LZ+1:PRINT#8,HN:SYSZ,8:SYSZ,1:POKE702,16
1345 GOSUB6810:IFM0=0THENPRINT#5,"+++":GOSUB85:GOSUB85
1346 GOSUB80
1347 CLOSE5:RUN
1350 SYSZ,1:SYSZ,2:SYSZ,8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
1370 I=5:GOSUB6:PRINT#2,NA$:I=25:GOSUB6:PRINT#2,PH$:I=35:GOSUB6
1380 PRINT#2,AC$:I=40:GOSUB6:PRINT#2,RN$:I=60:GOSUB6
1390 PRINT#1,LC$:I=80:GOSUB6:PRINT#2,TM$:I=90:GOSUB6:PRINT#2,PS$:CT=0
1395 IFY0=1THENY0=0:GOTO1410
1400 I2=INT(HN/256):P$(1)=STR$(I2):I2=I2*256:I1=HN-I2:P$(0)=STR$(I1)
1410 FORI=100TO145STEP5:GOSUB6:PRINT#2,P$(CT):CT=CT+1:NEXT:SYSZ,2:SYSZ,1
1420 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}calls":I=1
1430 GOSUB6:PRINT#2,CA$:SYSZ,1:SYSZ,2:RETURN
1440 EQ=0:SYSZ,2:SYSZ,1:SYSZ,8:OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}userlog"
1470 I=5:GOSUB7:INPUT#1,E1:IFE1>0THENSYSZ,2:SYSZ,1:RETURN
1480 NA$=I$:I=25:GOSUB7:PH$=I$:I=35:GOSUB7:AC$=I$:I=40:GOSUB7:RN$=I$
1490 I=60:GOSUB7:LC$=I$:I=80:GOSUB7:TM$=I$:I=90:GOSUB7:PS$=I$:CT=0
1500 FORI=100TO145STEP5:GOSUB7:P$(CT)=I$:CT=CT+1:NEXT:SYSZ,2:SYSZ,1
1510 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}calls":I=1
1520 GOSUB7:CA$=I$:SYSZ,2:SYSZ,1:RETURN
1530 POKE712,15:PRINT"{clear}{down*3}{reverse on}{green}monster mode":I$="{pound}prg.monster":GOTO88
1700 REM
1710 IFI=0THENI=1
1715 POKE897,I:POKE896,1:RETURN
2120 I$=STR$(PEEK(897))
2121 TX$=CHR$(13)+CHR$(13)+"{f1}TIME LEFT={f1}"+I$+"{f1}:(?):{f1}C{f1}O{f1}M{f1}M{f1}A{f1}N{f1}D{f1}:{ct c}"
2122 GOSUB210:IFPEEK(681)=1THENTX$="{f1}{cm q}{up}{cm r}{down}{cm w}{down}{left*2}{cm e}{left}{up}{ct c}":GOSUB210
2130 GOSUB100:IFIN$=""ORIN$=" "THEN2130
2140 G=0:IFIN$="?"THENFI$="{pound}mainmenu"+STR$(AC):NN=1:GOSUB1200:GOTO2120
2150 FORI=1TOLEN(CD$):IFIN$=MID$(CD$,I,1)THENG=I:IFAC<VAL(MID$(CC$,I,1))THENG=0
2160 NEXTI:IFG=0THEN2130
2161 E$="cmd:"+MID$(CD$,G,1):GOSUB12:TX$=IN$+CHR$(13):GOSUB210
2170 ONGGOTO2200,2250,2190,2270,2340,2440,3735,3150,4050,5165
2175 G=G-10:ONGGOTO5740,6200,6250,6500,7200
2180 GOTO2120
2190 FI$="{pound}info":NN=1:GOSUB1200:GOTO2120
2200 TX$="{f1}FEEDBACK?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)<>"y"THEN2230
2210 FF$="{pound}feedback":QQ$="BY:"+NA$+" ID#"+STR$(NA):SYS38215
2220 QD$="ON:"+STR$(MN)+"/"+STR$(DA)+" AT:"+I$:V1=8:GOSUB2480
2230 IFPEEK(765)<>1THEN2120
2240 POKE765,0:GOTO1230
2250 TX$="{f1}OFF?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)="y"THENPOKE765,1:GOTO2200
2260 GOTO2120
2270 TX$="{f1}Page the SYSOP?{ct c}":GOSUB210:GOSUB190:IFLEFT$(I$,1)<>"y"THEN2120
2280 TX$="Making noises...":GOSUB210:POKE53280,1:FORI=54272TO54296
2290 POKEI,0:NEXTI:POKE54296,15:POKE54277,8:POKE54278,255:POKE54276,21:I2=255
2300 FORI=1TO20:POKE54287,I2:TX$="{f1}>{f1}>{ct c}":GOSUB210:FORI1=255TO0STEP-10
2310 POKE54273,I1:I2=I2-.1:NEXTI1:NEXTI:POKE54278,15:GOTO2120
2320 IFPEEK(682)=0THEN2120
2330 POKE682,0:RETURN
2340 TX$=CHR$(13)+"{f1}{reverse on}USERLIST{reverse off}:{ct c}":GOSUB210:POKE731,1:GOSUB111
2341 IFI>0ORI$=""THEN2390
2345 GOSUB5:OPEN8,8,8,"0:{pound}members,s,r":S$=I$:Q=0:SYS38230:SYS38209,I$
2350 SYS38230:IFI$=""THENSYSZ,8:GOTO2320
2355 Y$=RIGHT$(LEFT$(I$,LEN(I$)-1),LEN(I$)-LEN(STR$(Q))-4)
2360 IFMID$(Y$,1,LEN(S$))=S$THENTX$=I$:GOSUB210
2370 Q=Q+1:GOSUB100:IFIN$=" "THENSYSZ,8:GOTO2320
2380 GOTO2350
2390 GOSUB5:OPEN8,8,8,"0:{pound}members,s,r":SYS38230:SYS38209,I$
2400 SYS38230:IFI$=""THEN2430
2410 X=VAL(RIGHT$(I$,LEN(I$)-1)):IFX<ITHEN2400
2415 SYS38209,I$:SYS38230:IFI$=""THEN2430
2420 GOTO2415
2430 SYSZ,8:GOSUB5:GOTO2320
2440 TX$=CHR$(13)+"{f1}--------------------":GOSUB210:TX$="{f1}Status ":
2450 TX$="{f1}Handle:"+NA$:GOSUB210:TX$="{f1}Real Name:"+RN$:GOSUB210:SYS38215
2460 TX$="{f1}Access:"+AC$:GOSUB210:TX$="{f1}Time:"+I$:GOSUB210
2465 I$=STR$(TM(AC)-PEEK(897)):TX$="{f1}Online:"+I$:GOSUB210
2470 TX$="{f1}--------------------":GOSUB210:GOTO2120
2480 REM MSG MKR:IFUP=1THENOU$=CHR$(142):GOSUB120
2520 IFPEEK(764)<>3THENFORI=0TO50:TT$(I)=CHR$(144):NEXTI:LN=0:UP=0
2521 IFPEEK(764)<>3THENOU$=CHR$(14):GOSUB120
2525 A=FRE(0):IFS1=1THENS1=0:GOTO2540
2526 OU$="{clear}":GOSUB120
2530 POKE705,1:POKE764,0:POKE763,0:TX$="{reverse on}{f1}message maker!{reverse off}":GOSUB210
2540 TX$="{f1}type /h for help"+CHR$(13)+"{f1}50 lines max. go:{white} ":GOSUB210
2550 GOSUB190:IFI$=""THENI$=CHR$(144)
2560 TT$(LN)=I$:K$="":Q$=LEFT$(TT$(LN),2):IFLEFT$(Q$,1)="/"THENK$=RIGHT$(Q$,1)
2570 IFK$=""THEN2610
2580 G=0:FORI=1TOLEN(CE$):IFK$=MID$(CE$,I,1)THENG=I
2590 NEXTI:IFG=0THEN2610
2600 ONGGOTO2630,2640,3070,2970,2960,2900,2950,3040,2840,6660,6670,6700
2610 IFLN>49THENTX$="50 lines MAX. Type /h.":GOSUB210:GOTO2550
2620 LN=LN+1:GOTO2550
2630 FI$="{pound}msgmkr help":GOSUB1200:GOTO2550
2640 TX$="save..(y/n){ct c}":GOSUB210:
2650 GOSUB100:IFIN$=""THEN2650
2660 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2670 IFIN$<>"y"THEN2640
2675 IFS0=1THENS0=0:OPEN1,8,15,"s0:"+FF$:SYSZ,1:GOTO2700
2680 TX$="saving...":GOSUB210:OPEN1,V1,15:OPEN8,V1,8,"0:"+FF$+",s,r":SYSZ,8
2690 INPUT#1,E1:PRINT#1,"i0":SYSZ,1:IFE1<20THEN2710
2700 OPEN8,V1,8,"0:"+FF$+",s,w":GOTO2720
2710 OPEN8,V1,8,"0:"+FF$+",a":PRINT#8,CHR$(1)
2720 IFQQ$<>""ANDQD$<>""THENPRINT#8,QQ$:PRINT#8,QD$:PRINT#8,CHR$(2)
2730 TT$(LN)=CHR$(144):IFUP=1THENPRINT#8,CHR$(142)+CHR$(147)
2735 FORI=0TOLN-1:
2740 PRINT#8,TT$(I):
2750 NEXTI:SYSZ,8:TX$="saved!":GOSUB210
2755 OPEN1,8,15:INPUT#1,E,E$:SYSZ,1:IFE>0THENGOSUB12
2759 GOTO2890
2760 X=1:TX$="change:{ct c}":GOSUB210:GOSUB190:I3=LEN(I$):I4=LEN(TT$(Q))
2770 IFI$=""THEN2550
2780 IFMID$(TT$(Q),X,I3)=I$THEN2810
2790 X=X+1:IFX<=I4THEN2780
2800 TX$="not found!":GOSUB210:GOTO2550
2810 I1=X-1:I2=I4-X-I3+1:I1$=LEFT$(TT$(Q),I1):I2$=RIGHT$(TT$(Q),I2)
2820 TX$="to:{ct c}":GOSUB210:GOSUB190:TT$(Q)=I1$+I$+I2$:IFTT$(Q)=""THENTT$(Q)="{black}"
2830 GOTO2550
2840 TX$="abort..(y/n){ct c}":GOSUB210
2850 GOSUB100:IFIN$=""THEN2850
2860 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2870 IFIN$<>"y"THEN2840
2880 POKE763,1
2890 POKE705,0:QQ$="":QD$="":UP=0
2891 S0=0:FORI=0TO50:TT$(I)="":NEXTI:A=FRE(0):OU$=CHR$(14):GOSUB120:RETURN
2900 TX$="clear..(y/n){ct c}":GOSUB210
2910 GOSUB100:IFIN$=""THEN2910
2920 TX$=IN$:GOSUB210:IFIN$="n"THEN2550
2930 IFIN$<>"y"THEN2900
2940 GOTO2520
2950 GOSUB6450:IFER=1THEN2550
2952 TX$=TT$(Q):GOSUB210
2953 GOSUB100:IFIN$=" "THEN2550
2954 Q=Q+1:IFQ<=LN-1THEN2952
2956 GOTO2550
2960 GOSUB6450:IFER=1THEN2550
2962 TX$=STR$(Q)+"):"+TT$(Q)+CHR$(0):GOSUB210
2963 GOSUB100:IFIN$=" "THEN2550
2964 Q=Q+1:IFQ<=LN-1THEN2962
2965 GOTO2550
2970 TX$="from (0-"+STR$(LN-1)+"){ct c}":GOSUB210:GOSUB111:S1=I:IFS1>LN-1THEN2550
2990 TX$="to ("+STR$(S1)+"-"+STR$(LN-1)+"){ct c}":GOSUB210:GOSUB111:
3010 S2=I:IFS2>LN-1ORS2<S1THEN2550
3020 S3=S2-S1+1:FORI=S1TOLN-S3+1:TT$(I)=TT$(I+S3):NEXTI:LN=LN-S3:IFLN<0THENLN=0
3030 A=FRE(0):GOTO2550
3040 GOSUB6450:IFER=1THEN2550
3050 S1=Q:IFLN+1>50THEN2550
3060 FORI=LNTOS1+1STEP-1:TT$(I)=TT$(I-1):NEXTI:TT$(S1)="{black}":LN=LN+1:GOTO2550
3070 GOSUB6450:IFER=1THEN2550
3090 SYS38209,TT$(Q):TX$="e)dit or r)ewrite?{ct c}":GOSUB210
3100 GOSUB100:IFIN$=""THEN3100
3110 TX$=IN$:GOSUB210:IFIN$="e"THEN2760
3120 IFIN$<>"r"THEN2550
3130 TX$="rewrite: ":GOSUB210:GOSUB190:IFI$<>""THENTT$(Q)=I$:
3140 GOTO2550
3150 IFAC>6THENTX$=CHR$(13)+"{f1}SysOp:{ct c}":GOSUB210
3155 GOSUB100:IFIN$=""ORIN$=" "ORIN$=CHR$(13)THEN3155
3156 TX$=IN$:GOSUB210:IFIN$="q"THEN2120
3160 IFIN$="?"THENFI$="{pound}sysopmenu":NN=1:GOSUB1200:GOTO3150
3170 IFIN$="d"THENDV=8:GOTO3230
3180 IFIN$="u"THENPOKE682,1:GOSUB2340:POKE682,0:GOTO3150
3190 IFIN$="e"THENI$="{pound}prg.user":GOTO88
3215 IFIN$="m"THENYY=0:I$="{pound}prg.mtedit":GOTO88
3216 IFIN$="t"THENYY=1:I$="{pound}prg.mtedit":GOTO88
3217 IFIN$="v"THENI$="{pound}prg.vedit":GOTO88
3220 GOTO3150
3230 TX$=CHR$(13)+STR$(DV)+":{ct c}":GOSUB210:GOSUB190:IFI$=""THEN3150
3240 Q$=LEFT$(I$,1):IFQ$="@"ANDLEN(I$)>2THENQ$=RIGHT$(I$,LEN(I$)-2):GOTO3320
3250 IFQ$="w"ANDLEN(I$)>2THENFF$=RIGHT$(I$,LEN(I$)-2):GOTO3370
3260 IFQ$="e"ANDLEN(I$)>2THENFF$=RIGHT$(I$,LEN(I$)-2):GOTO3400
3270 IFQ$="@"THENI$="":GOTO3300
3280 IFQ$="$"THENPOKE253,0:GOSUB5:OPEN8,DV,0,I$:SYS38224:SYSZ,8:SYSZ,1:GOTO3230
3285 IFQ$="%"THEN6480
3290 IFLEN(I$)<4ANDVAL(I$)>7ANDVAL(I$)<11THENDV=VAL(I$):GOTO3230
3300 OPEN1,DV,15,I$:INPUT#1,E1,E1$,E2,E3:SYSZ,1
3310 TX$=STR$(E1)+","+E1$+","+STR$(E2)+","+STR$(E3):GOSUB210:GOTO3230
3320 OPEN1,DV,15,"i0":SYSZ,1:OPEN8,DV,8,"0:"+Q$+",s,r"
3330 SYS38212:IFPEEK(253)=0THENSYSZ,8:SYSZ,1:GOTO3230
3340 TX$=CHR$(14)+"{white}C)ont or S)kip:{ct c}":GOSUB210:GOSUB190:IFI$="c"ORI$=""THEN3330
3350 IFI$="s"THENSYS38218:GOTO3340
3360 GOTO3340
3370 QQ$="":QD$="":S0=1:V1=DV:GOSUB2480:POKE764,0:GOTO3230
3400 TX$="Searching for "+FF$:GOSUB210:OPEN8,DV,8,"0:"+FF$+",s,r":GET#8,I$:UP=0
3405 IFST>0THENTX$="File Not Found":GOSUB210:GOTO3450
3406 TX$="Loading":GOSUB210
3410 QQ$="":SYSZ,8:OPEN8,DV,8,"0:"+FF$+",s,r":LN=0:FORI=0TO50:TT$(I)="{black}":NEXTI
3420 SYS38230:IFPEEK(253)=1THEN3440
3425 IFI$=CHR$(142)+CHR$(147)THENUP=1:SYS38209,I$:GOTO3420
3430 SYS38209,I$:TT$(LN)=I$:LN=LN+1:GOTO3420
3440 QD$="":SYSZ,8:SYS38209,I$:A=FRE(0):TT$(LN)=I$:LN=LN+1:POKE764,3:GOTO3370
3450 SYSZ,8:GOTO3230
3735 TX$="{clear}{down*2}{f1} Email Section...":GOSUB210:I$="{pound}prg.email":GOTO88
3737 FI$="{pound}emailmenu":GOSUB1200
3740 TX$="{f1}Email:{ct c}":Q$=CHR$(13):GOSUB210
3750 GOSUB100:IFIN$="q"THEN2120
3760 IFIN$="?"THENFI$="{pound}emailmenu":NN=1:GOSUB1200:GOTO3740
3770 IFIN$="r"THENWH=0:GOTO8090
3780 IFIN$="u"THENPOKE682,1:GOSUB2340:POKE682,0:GOTO3740
3800 IFIN$="s"THEN8010
3805 GOTO3750
4050 CS=0:TX$="{clear}{f1}{down}Sig System!{white}":GOSUB210:I$="{pound}prg.read":GOTO88
4055 GOSUB4060:GOTO4260
4060 TX$=CHR$(13)+"{f1}{down}Entering Sig "+CHR$(193+CS):GOSUB210:VD=SD(CS)
4070 CM=0:I1=0:I2=0:J0=0:FI$="{pound}sigmsg"+STR$(CS+1):GOSUB1200:OPEN1,8,15,"i0"
4072 OPEN2,8,2,"{pound}Sig"+STR$(CS+1)
4075 FORI=1TONM:Z1(I)=0:Z2(I)=0:NEXTI:GOTO 4090
4080 PRINT#1,"p"CHR$(98)CHR$(J)CHR$(0)CHR$(I):SYS38233:RETURN
4090 J=1:I=1:GOSUB4080:NM=VAL(I$):I=7:GOSUB4080:MP=VAL(I$):FORJ=2TONM+1
4100 I=1:GOSUB4080:Z1(J-1)=VAL(I$):I=7:GOSUB4080:Z2(J-1)=VAL(I$)
4110 I1=I1+Z1(J-1):IFZ2(J-1)>PPTHENJ0=J0+1:
4120 NEXTJ:SYSZ,2:SYSZ,1:Q$=CHR$(13)
4130 TX$=Q$+"{f1}"+STR$(NM)+" {reverse on}Bulletins and "+STR$(I1)+" Responses":GOSUB210
4140 TX$="{f1}"+STR$(J0)+" {reverse on}New Bulletins/Replys{reverse off}":GOSUB210:RETURN
4150 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}Sig"+STR$(CS+1):GOTO4170
4160 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(J):RETURN
4170 I=1:J=1:GOSUB4160:PRINT#2,NM:J=7:GOSUB4160:PRINT#2,MP
4175 SYSZ,2:SYSZ,1:RETURN
4180 OPEN1,8,15,"i0":OPEN2,8,2,"0:{pound}Sig"+STR$(CS+1):I=I+1:J=1:GOSUB4160
4190 PRINT#2,A:J=7:GOSUB4160:PRINT#2,B:SYSZ,2:SYSZ,1:RETURN
4260 IFWI=1THENCM=CM+1:GOTO4800
4265 IFKD=1THEN6620
4270 TX$=CHR$(14)+CHR$(13)+"{f1}{reverse on}Sig{reverse off} {f1}"+CHR$(193+CS)+"{white}:{ct c}":GOSUB210:G=0
4280 GOSUB100:IFIN$=""ORIN$=" "THEN4280
4285 IFIN$=CHR$(13)THEN6650
4286 IFASC(IN$)>192ANDASC(IN$)<219THEN4360
4287 IFASC(IN$)>96ANDASC(IN$)<123THEN4359
4290 IFIN$="?"THENFI$="{pound}msgmenu":NN=1:GOSUB1200:GOTO4270
4300 FORI=1TOLEN(CF$):IFIN$=MID$(CF$,I,1)THENG=I:IFAC<VAL(MID$(CG$,I,1))THENG=0
4305 NEXTI:IFG>0THENE$="msg:"+MID$(CF$,G,1):GOSUB12:TX$=IN$:GOSUB210
4310 IFG>0THENONGGOTO4330,8005,4720,4790,2120,4840,4940,6600
4320 GOTO4280
4330 TX$="{f1}Sigs: ":GOSUB210:FORI=0TOSG:IFSG(I)>ACTHEN4350
4340 TX$="{f1}("+CHR$(I+193)+"):"+SG$(I):GOSUB210
4350 NEXTI:GOTO4260
4359 IN$=CHR$(ASC(IN$)+96)
4360 I=ASC(IN$)-193:IFI>SG ORI=CSTHEN4260
4370 IFSG(I)>ACTHEN4260
4380 CS=I:GOSUB4060:GOTO4260
4690 TX$="{f1}Num to Skip:{ct c}":GOSUB210:GOSUB111:IFI=0THEN8050
4700 I9=I:IFI9>Z1(CM)THEN8190
4710 GOTO8100
4720 I=1:GOSUB5:IFI>NMTHEN4260
4730 OPEN8,SD(CS),8,"0:{pound}msg"+STR$(CS)+STR$(I)
4735 SYS38227:IFLEN(I$)<3THEN4750
4740 I$=RIGHT$(I$,LEN(I$)-2):I$="{f1}"+I$
4750 SYSZ,8:SYSZ,1:TX$="{f1}Msg #"+STR$(I)+":{f1}"+STR$(Z1(I))+" Responses"
4760 GOSUB210:SYS38209,I$:GOSUB100:IFIN$=" "THEN4260
4770 I=I+1:IFI>NMORI<1THEN4260
4780 GOTO4730
4790 CM=1:WI=0:TX$="{f1}READ NEW...":GOSUB210
4800 IFCM>NMTHENWI=0:GOTO4260
4805 G=3:IFZ2(CM)>PPTHENWI=1:GOTO8020
4810 CM=CM+1:GOTO4800
4840 V1=SD(CS):TX$="{f1}Post a Message?{ct c}":GOSUB210
4850 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO4260
4860 IFIN$<>"y"THEN4850
4865 TX$="y":GOSUB210:Q$=CHR$(13)
4870 QQ$="{clear}{f1}POSTED BY:"+NA$+"{reverse off}{f1} ID#"+STR$(NA)+Q$+"{f1}ON:"+STR$(MN)+"/"+STR$(DA)
4880 TX$=Q$+"Subject:{ct c}":GOSUB210:GOSUB190:S$=I$:IFI$=""THEN4260
4890 SYS38215:QD$="{f1}TIME:"+I$+"{f1} SUBJECT:"+S$+Q$:IFSF(CS)>NMTHENNM=NM+1
4900 S0=1:MP=MP+1:IFMP>SF(CS)THENMP=1
4910 FF$="{pound}msg"+STR$(CS)+STR$(MP):GOSUB2480:IFPEEK(763)=1THENNM=NM-1:GOTO4260
4920 GOSUB4150:I=MP:Z1(MP)=0:Z2(MP)=HN+1:HN=HN+1
4930 A=Z1(MP):B=Z2(MP):GOSUB4180:GOTO4260
4940 IFVAL(P$(5))=CS+1ORVAL(P$(5))=100THEN4945
4941 GOTO4270
4945 I$="{pound}prg.medit":GOTO88
5165 TX$="{clear}{down}{f1}Upload/Download system!":GOSUB210:I$="{pound}prg.udsec":GOTO88
5166 TX$="{down}{f1}In UD"+STR$(CU+1):GOSUB210:GOTO5170
5169 FORI=0TO5000:NEXT
5170 TX$="{down*2}{f1}U{f1}/{f1}D{white}"+STR$(CU+1)+":{ct c}":GOSUB210
5180 GOSUB100:IFIN$=""THEN5180
5190 G=0:IFIN$="?"THENFI$="{pound}udmenu":NN=1:GOSUB1200:GOTO5170
5200 FORI=1TOLEN(CH$):IFMID$(CH$,I,1)=IN$THENG=I:IFVAL(MID$(CI$,I,1))>ACTHENG=0
5210 NEXTI:IFG=0THEN5180
5220 TX$=IN$:GOSUB210:ONGGOTO8100,2120,5270,5460,8200,8300,8400
5270 POKE512,0:TX$="{f1}UPLOAD!":GOSUB210:GOSUB6391:IFER=1THEN5170
5310 FI$=I$:IFLEFT$(I$,1)<>"{pound}"THENFI$=CHR$(64+CU)+I$
5315 IFLEFT$(I$,1)="{pound}"ANDAC<9THEN5170
5320 GOSUB5640:IFER=1THEN5170
5325 GOSUB8500
5330 TX$="{clear}{down}{f1}O.K. Go To Send!!":GOSUB210:FI$=FI$+"w":QY=1:GOTO5451
5420 SYS49173:SYS49161:IFPEEK(512)=1THEN5620
5421 IFFH=0THENE$="ul:"+FI$:GOSUB12:P$(3)=STR$(VAL(P$(3))+1)
5430 OPEN1,UV(CU),15,"i0":OPEN2,UV(CU),2,"0:"+FI$:INPUT#1,E:IFE>0THEN5620
5440 FORI=1TO1300:NEXTI:SYS61310:SYS49173:SYS49155
5450 FORX=1TO1000:NEXTX:POKE668,PEEK(667):YU=1:GOTO5620
5451 TI$="000000"
5452 GETA$:IFA$="a"THEN5620
5453 IFPEEK(830)=1THEN1230
5455 IFVAL(TI$)>40THEN5620
5456 GET#5,A$:IFA$="a"ORA$="A"THEN5620
5457 IFA$<>"g"ANDA$<>"o"ANDA$<>"k"THEN5452
5458 IFQY=1THENQY=0:GOTO5420
5459 GOTO5600
5460 POKE512,0:TX$="{f1}DOWNLOAD!":GOSUB210:GOSUB6391:IFER=1THEN5170
5490 FI$=I$:GOSUB5640:IFII$<>"{pound}"THENFI$=CHR$(64+CU)+FI$
5495 IFII$="{pound}"ANDAC<7THEN5170
5500 FI$=FI$+"r":OPEN1,UV(CU),15,"i0":OPEN2,UV(CU),2,"0:"+FI$:INPUT#1,E
5510 IFE>1THENSYSZ,1:SYSZ,2:GOTO5170
5520 TX$="{clear}{down}{f1}O.K. Go To Receive!!":GOSUB210:QY=0:GOTO5451
5600 POKE51227,TY:SYS49173:SYS49164:IFPEEK(512)=1THEN5620
5601 IFFH=0THENE$="dl:"+FI$:GOSUB12:P$(4)=STR$(VAL(P$(4))+1)
5610 SYS49173:POKE51224,255:SYS49158
5620 QY=0:SYSZ,1:SYSZ,2
5625 IFFH=1THENFH=0:GOTO9000
5630 IFYU=0THEN5169
5631 OPEN8,UV(CU),0,"$0:z=u":SYS38245:SYSZ,8:IFPEEK(707)>20ORPEEK(708)>0THEN5170
5632 OPEN1,UV(CU),15,"s0:"+LEFT$(FI$,LEN(FI$)-4):PRINT#1,"v":SYSZ,1:GOTO5170
5640 ER=0:TX$="{f1}P)RG{f1} or {f1}S)EQ{white}:{ct c}":GOSUB210
5650 GOSUB100:IFIN$=""THEN5650
5655 IFIN$=CHR$(13)THENER=1
5660 TX$=IN$:GOSUB210:IFIN$="p"THENFI$=FI$+",p,":TY=1:RETURN
5670 IFIN$="s"THENFI$=FI$+",s,":TY=2:RETURN
5680 GOTO5640
5690 GOSUB5:PRINT"{clear}":POKE720,1:OPEN8,8,8,"0:"+FI$+",s,r"
5700 SYS38212:IFPEEK(253)=0THENSYSZ,8:POKE720,0:PRINT:PRINT"Delete?";:GOTO5736
5710 PRINT"Hit RETURN:"
5720 GETA$:IFA$<>CHR$(13)THEN5720
5730 GOTO5700
5736 GETA$:IFA$="y"THENPRINT"y":OPEN1,8,15,"s0:"+FI$:SYSZ,1:GOTO390
5737 IFA$<>"n"THEN5736
5738 PRINT"n":GOTO390
5740 I$="{pound}prg.vote":GOTO88
6200 IFPEEK(659)=8THENTX$="1200 baud...":GOSUB210:GOTO2120
6201 TX$="{f1}Baud is:"+STR$(BA):GOSUB210:TX$="{f1}New Baud (RETURN):{ct c}":GOSUB210
6210 GOSUB111:IFI=0THEN2120
6220 IFI<200ORI>500THEN2120
6225 TX$="{f1}Change baud and hit RETURN{ct c}":GOSUB210:POKE659,6
6230 BA=I:A=1022730/BA/2:GOSUB6249:POKE51196,I1:POKE51197,I2:A=1022730/BA
6240 GOSUB6249:POKE665,I1:POKE666,I2:A=1022730/BA/2-100:GOSUB6249
6241 POKE661,I1:POKE662,I2:POKE659,6
6244 IFFH=1THENFH=0:RETURN
6245 GOSUB100:IFIN$<>CHR$(13)THEN6245
6248 GOTO2120
6249 I2=INT(A/256):I3=I2*256:I1=A-I3:RETURN
6250 TX$="{clear}{f1}Text Library Subsection"+CHR$(13)+CHR$(13):GOSUB210
6251 FI$="@txt 0":VD=UL:GOSUB1200
6252 TX$=CHR$(14)+"{f1}File #{f1}:?:{f1}Q=QUIT{white}:{ct c}":GOSUB210:GOSUB190:IFI$=""THEN6252
6253 IFI$="q"ORLEN(I$)>4THEN2120
6254 IFI$="?"THENA=0:GOTO6260
6255 A=VAL(I$):IFA<1THEN6252
6260 FI$="@txt"+STR$(A):NN=1:VD=UL:GOSUB1200:GOTO6252
6370 GOSUB100:IFIN$<>CHR$(13)THEN6370
6371 TX$=" ":GOSUB210:RETURN
6391 ER=0:TX$="{f1}Filename:{ct c}":GOSUB210:GOSUB190:IFI$=""ORLEN(I$)>14THENER=1
6392 FORL=1TOLEN(I$):L$=MID$(I$,L,1):IFL$="*"ORL$=","ORL$="?"ORL$="$"THENER=1
6394 IFL$=":"ORL$=";"ORL$="#"ORL$="{ct c}"THENER=1
6395 NEXTL:RETURN
6450 Q=0:ER=0:E$=RIGHT$(TT$(LN),LEN(TT$(LN))-2):IFLEN(E$)>4THENER=1:GOTO6470
6460 Q=VAL(E$):IFQ>LN-1ORQ<0THENTX$="bad #":GOSUB210:ER=1
6470 RETURN
6480 I$=RIGHT$(I$,LEN(I$)-1):OPEN8,DV,0,"$"+I$:SYS38242:SYSZ,8
6490 TX$=STR$(PEEK(706))+" files counted":GOSUB210:GOTO3230
6500 I$="{pound}prg.var":GOTO88
6600 TX$="{f1}ALL{sh space}NEW...":GOSUB210:KD=0
6605 IFJ0>0THENG=3:KD=1:GOTO4790
6606 GOTO6620
6610 GOSUB4060:IFJ0>0THENG=3:KD=1:GOTO4790
6620 CS=CS+1:IFCS>SGTHENTX$="{f1}ALL{sh space}NEW COMPLETE.":GOSUB210:CS=CS-1:KD=0:GOTO4260
6625 IFSG(CS)>ACTHENTX$="{f1}ALL{sh space}NEW{sh space}COMPLETE.":GOSUB210:CS=CS-1:KD=0:GOTO4260
6630 GOTO6610
6650 TX$=" ":GOSUB210:CM=CM+1:G=3:GOTO8020
6660 IFPEEK(681)=1ANDUP=0THENUP=1:OU$=CHR$(142):GOSUB120:GOTO2550
6661 UP=0:OU$=CHR$(14):GOSUB120:GOTO2550
6670 IFK$="w"ANDPEEK(705)=1THENPOKE705,0:TX$="w/w off":GOSUB210:GOTO2550
6671 POKE705,1:TX$="w/w on":GOSUB210:GOTO2550
6700 TX$=CHR$(13)+"Working...":GOSUB210:FORT=0TOLN:IFTT$(T)="{black}"THEN6740
6710 Y=0:I$=TT$(T):FORI=1TOLEN(I$):IFMID$(I$,I,1)<>" "ANDY=0THENY=I
6715 NEXTI:I$=RIGHT$(I$,LEN(I$)-(Y-1)):I=LEN(I$):FORX=0TO((20-(I/2))-1)
6720 I$=" "+I$:NEXTX:TT$(T)=I$
6740 NEXTT:TX$="Done":GOSUB210:GOTO2550
6800 RESTORE:FORI=659TO666:READA:POKEI,A:NEXT:DATA8,0,70,1,0,9,55,3
6801 BA=1200:POKE51196,168:POKE51197,6:RETURN
6810 RESTORE:FORI=1TO8:READA:NEXT:FORI=659TO666:READA:POKEI,A:NEXT
6815 DATA 6,0,69,6,0,9,82,13
6816 POKE51196,168:POKE51197,6:BA=300:RETURN
7200 I$="{pound}prg.menu":GOTO88
7999 PRINT"{ct z}{ct x}{ct c}"
8000 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8010 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8011 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8012 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8013 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8014 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8015 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8016 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8017 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8018 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8019 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8020 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8021 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8022 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8023 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8024 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8025 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8026 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8027 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8028 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8029 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8030 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8031 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8032 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8033 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8034 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8035 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8036 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8037 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8038 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8039 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8040 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8041 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8042 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8043 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8044 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8045 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8046 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8047 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8048 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8049 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8050 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8051 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8052 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8053 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8054 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8055 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8056 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8057 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8058 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8059 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8060 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8061 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8062 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8063 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8064 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8065 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8066 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8067 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8068 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8069 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8070 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8071 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8072 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8073 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8074 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8075 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8076 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8077 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8078 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8079 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8080 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8081 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8082 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8083 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8084 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8085 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8086 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8087 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8088 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8089 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8090 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8091 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8092 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8093 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8094 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8095 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8096 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8097 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8098 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8099 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8100 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8101 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8102 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8103 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8104 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8105 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8106 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8107 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8108 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
8109 ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
