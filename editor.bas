!--------------------------------------------------
!- Saturday, May 20, 2017 4:36:39 PM
!- Import of : 
!- c:\src\zelch64\editor.prg
!- Commodore 64
!--------------------------------------------------
10 CLR:DIMSG$(50),SG(50),SD(50),SF(50),UD$(20),UA(20),UV(20),FL(50),FL$(16)
11 DIMSS$(50),SS(50)
20 POKE53280,0:POKE53281,0:PRINTCHR$(14)+"{yellow}Put Data disk in drive 8 and"
30 PRINT"hit RETURN":POKE198,0
40 GETA$:IFA$<>CHR$(13)THEN40
50 OPEN1,8,15:OPEN8,8,8,"{pound}variables,s,r":INPUT#8,BN$:INPUT#1,E1
60 IFE1>0THENCLOSE8:CLOSE1:GOTO130
70 INPUT#8,MD,CD$,CC$,CE$,CF$,CG$,SG:FORI=0TOSG:INPUT#8,SG$(I),SG(I),SD(I),SF(I)
80 NEXTI:INPUT#8,UD:FORI=0TOUD:INPUT#8,UD$(I),UA(I),UV(I):NEXTI
90 FORI=0TO9:INPUT#8,CA(I),TM(I):NEXTI
100 INPUT#8,UL,CH$,CI$:IFST>0THEN120
110 INPUT#8,SS:FORI=0TOSS:INPUT#8,SS$(I),SS(I):NEXT:FORI=1TO8:INPUT#8,FL$(I)
111 NEXT:INPUT#8,M0
120 CLOSE8:CLOSE1
130 PRINT"{clear}{yellow}Menu:"
140 PRINT"1) Main editor"
150 PRINT"2) User editor"
160 PRINT"3) Sig record creator"
170 GETA$:IFA$="3"THEN230
180 IFA$="2"THEN350
190 IFA$="1"THEN1240
200 GOTO170
220 OPEN1,8,15:INPUT#1,E1,E2$,E3,E4:PRINTE1;E2$;E3;E4:CLOSE1:END
230 POKE19,65:INPUT"Enter Sig to create:";I:POKE19,0:PRINT
240 IFI-1<0ORI-1>SGTHEN130
250 PRINT"Sig"+STR$(I)+", are you sure?":POKE198,0:D=I-1
260 GETA$:IFA$="n"THEN130
270 IFA$<>"y"THEN260
280 OPEN1,8,15,"s0:{pound}Sig"+STR$(D+1):OPEN2,8,2,"{pound}Sig"+STR$(D+1)+",l,"+CHR$(15)
290 PRINT"Working...":GOTO310
300 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(J):RETURN
310 I=1:J=1:GOSUB300:PRINT#2,"0":J=7:GOSUB300:PRINT#2,"0":
320 FORX=0TOSF(D):I=X+2:J=1:GOSUB300:PRINT#2,"0":J=7:GOSUB300:PRINT#2,"0"
330 NEXTX:CLOSE2:CLOSE1:GOTO130
340 END
350 REM
360 CLOSE2:CLOSE1:IFFL=1THENFL=0:I2=1:I1=0:GOTO3700
365 IFFL=2THENFL=1:GOTO3700
370 PRINT"{clear}1) Create new user log"
380 PRINT"2) Edit Main User Info"
390 PRINT"3) Display  Users"
400 PRINT"4) Add a user"
405 PRINT"5) Edit User Variables"
410 PRINT"6) Exit"
420 GETA$:IFA$="1"THEN840
430 IFA$="3"THEN480
440 IFA$="6"THEN1070
445 IFA$="5"THEN3500
450 IFA$="4"THEN1080
460 IFA$<>"2"THEN420
470 GOTO600
480 S1=1:INPUT"start at record";S1
490 PRINT"space aborts..."
500 OPEN1,8,15:OPEN2,8,2,"{pound}log1"
510 I1=INT(S1/256):I3=I1*256:I2=S1-I3:
520 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):GET#2,A$:INPUT#1,E1
530 IFE1<>0ORA$<>"{pound}"THEN580
550 INPUT#2,NA$:PRINT"#";S1;" ";NA$:GETA$:IFA$=" "THEN580
560 S1=S1+1:GOTO510
570 GOTO510
580 CLOSE2:CLOSE1:PRINT"hit any key"
590 POKE198,0:WAIT197,64,64:GOTO360
600 INPUT"ENTER{sh space}THE{sh space}RECORD{sh space}TO{sh space}EDIT";S1:I1=INT(S1/256):I3=I1*256:I2=S1-I3
610 OPEN1,8,15:OPEN2,8,2,"{pound}log1"
620 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):INPUT#1,E1:GET#2,A$
630 IFE1=0ANDA$="{pound}"THEN670
640 PRINT"NO RECORD":CLOSE1:CLOSE2:FORI=0TO1000:NEXT:GOTO360
670 INPUT#2,NA$,PH$,AC$,RN$,PA$:CLOSE2:CLOSE1
710 PRINT"NAME:";NA$:PRINT"PHONE:";PH$:PRINT"ACCESS LVL:";AC$:
720 PRINT"REAL NAME:";RN$
730 PRINT"PASSWORD:";PA$:FORI=0TO9
740 PRINT"Edit this record?"
750 GETA$:IFA$="n"THENCLOSE2:CLOSE1:GOTO360
760 IFA$<>"y"THEN750
770 INPUT"NAME:";NA$:INPUT"PHONE:";PH$:INPUT"ACCESS LVL:";AC$:
780 INPUT"REAL NAME:";RN$
790 INPUT"PASSWORD:";PA$:FORI=0TO9
800 PRINT"Save this record?"
810 GETA$:IFA$="n"THEN710
820 IFA$<>"y"THEN810
830 OPEN1,8,15:OPEN2,8,2,"{pound}log1":GOTO1000
840 PRINT"Delete old userlog and make new one"
850 PRINT"ok? (y/n)"
860 GETA$:IFA$="n"THEN360
870 IFA$<>"y"THEN860
880 INPUT"HANDLE (20 chars)";NA$
890 INPUT"PHONE ";PH$
900 AC$="9":INPUT"REAL NAME(20 chars)";RN$
910 INPUT"PASSWORD (7 chars)";PA$
930 PRINT"CORRECT (Y/N)"
940 GETA$:IFA$="n"THEN880
950 IFA$<>"y"THEN940
960 OPEN1,8,15,"s0:{pound}log1,log2":I2=1:I1=0
970 OPEN2,8,2,"{pound}log1,l,"+CHR$(100):FL=1
1000 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(95):PRINT#2,"e"
1001 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0)
1005 Q$=CHR$(13):A$="{pound}"+NA$+Q$+PH$+Q$+AC$+Q$+RN$+Q$+PA$
1010 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):PRINT#2,A$
1040 CLOSE2:CLOSE1
1050 PRINT"Hit any key"
1060 POKE198,0:WAIT197,64,64:GOTO360
1070 GOTO130
1080 PRINT"Finding a Record...":OPEN1,8,15:OPEN2,8,2,"{pound}log1":I2=1:I1=0
1090 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):INPUT#1,E:GET#2,A$
1100 IFE>0ORA$<>"{pound}"THEN1140
1110 INPUT#2,A$:IFA$="EMPTY"THEN1140
1120 I2=I2+1:IFI2=256THENI2=0:I1=I1+1
1130 GOTO1090
1140 CLOSE1:CLOSE2:INPUT"HANDLE";NA$:IFLEN(NA$)>17ORNA$=""THEN1140
1150 INPUT"REAL NAME";RN$:IFLEN(RN$)>20ORRN$=""THEN1150
1160 INPUT"PHONE";PH$:IFLEN(PH$)>20ORPH$=""THEN1160
1170 INPUT"ACCESS";AC$:IFLEN(AC$)>2ORAC$=""THEN1170
1190 INPUT"PASSWORD";PA$:IFLEN(PA$)>7ORPA$=""THEN1190
1200 PRINT"S)ave or Q)uit"
1210 GETA$:IFA$="q"THEN360
1220 IFA$="s"THENOPEN1,8,15:OPEN2,8,2,"{pound}log1":FL=2:GOTO1000
1230 GOTO1210
1240 REM
1250 PRINT"{clear}{yellow}Main editor:":PRINT"N)ame of BBS:"+BN$:PRINT"L)ibrary Device:{white}";UL;
1251 PRINT"{yellow}Modem:";:IFM0=0THENPRINT"{white}1670 compat"
1252 IFM0=1THENPRINT"{white}1650 compat"
1253 IFM0=2THENPRINT"{white}1660 compat"
1260 PRINT"{yellow}M)ail Device:{white}";MD:PRINT"{pink}{down*2}        Options/Access levels"
1265 PRINT"{pink}{left}         {cm t*21}"
1270 PRINT"   C) COMMAND        +)MSG{sh space}MAKER"
1280 PRINT"   {pound}) Msg base       -)U/D"
1300 PRINT"{down*2}               {cyan}Editors"
1305 PRINT"{left}{right}               {cyan}{cm t*7}"
1310 PRINT"   S)ig System       U)/D
1320 PRINT"   P) Sub System     T)ime/Calls
1330 PRINT"   ^) Colors         @) Modem"
1370 PRINT"{down*2}      {green}         Q) Quit"
1380 PRINT"           *) SAVE and Quit"
1390 PRINT"{down*2}Choose:"
1400 GETA$:IFA$="q"THEN130
1410 IFA$="c"THEN1540
1415 IFA$="^"THEN3300
1420 IFA$="+"THEN2080
1430 IFA$="{pound}"THEN1840
1440 IFA$="n"THEN2250
1450 IFA$="l"THEN2260
1460 IFA$="s"THEN2290
1470 IFA$="u"THEN2490
1480 IFA$="t"THEN2750
1490 IFA$="m"THEN2260
1500 IFA$="-"THEN2870
1510 IFA$="*"THEN2680
1520 IFA$="p"THEN3100
1525 IFA$="@"THEN3400
1530 GOTO1400
1540 PRINT"{clear}Q)uit Editing"
1550 IFLEN(CD$)<16THENCD$=CD$+"l":GOTO1550
1560 IFLEN(CC$)<16THENCC$=CC$+"0":GOTO1560
1570 PRINT"{white}#{light green}/Function{dark gray}/Letter{light blue}/Access"
1580 PRINT"{white}1{light green}/Feedback{dark gray}/"+MID$(CD$,1,1)+"{light blue}/"+MID$(CC$,1,1)
1590 PRINT"{white}2{light green}/Off{dark gray}/"+MID$(CD$,2,1)+"{light blue}/"+MID$(CC$,2,1)
1600 PRINT"{white}3{light green}/Info{dark gray}/"+MID$(CD$,3,1)+"{light blue}/"+MID$(CC$,3,1)
1610 PRINT"{white}4{light green}/Chat{dark gray}/"+MID$(CD$,4,1)+"{light blue}/"+MID$(CC$,4,1)
1620 PRINT"{white}5{light green}/Userlist{dark gray}/"+MID$(CD$,5,1)+"{light blue}/"+MID$(CC$,5,1)
1630 PRINT"{white}6{light green}/Status{dark gray}/"+MID$(CD$,6,1)+"{light blue}/"+MID$(CC$,6,1)
1640 PRINT"{white}7{light green}/Email{dark gray}/"+MID$(CD$,7,1)+"{light blue}/"+MID$(CC$,7,1)
1650 PRINT"{white}8{light green}/SysOp{dark gray}/"+MID$(CD$,8,1)+"{light blue}/"+MID$(CC$,8,1)
1660 PRINT"{white}9{light green}/Msg Base{dark gray}/"+MID$(CD$,9,1)+"{light blue}/"+MID$(CC$,9,1)
1670 PRINT"{white}10{light green}/Transfer{dark gray}/"+MID$(CD$,10,1)+"{light blue}/"+MID$(CC$,10,1)
1680 PRINT"{white}11{light green}/Vote{dark gray}/"+MID$(CD$,11,1)+"{light blue}/"+MID$(CC$,11,1)
1690 PRINT"{white}12{light green}/Baud Change{dark gray}/"+MID$(CD$,12,1)+"{light blue}/"+MID$(CC$,12,1)
1700 PRINT"{white}13{light green}/Library{dark gray}/"+MID$(CD$,13,1)+"{light blue}/"+MID$(CC$,13,1)
1710 PRINT"{white}14{light green}/Editor{dark gray}/"+MID$(CD$,14,1)+"{light blue}/"+MID$(CC$,14,1)
1720 PRINT"{white}15{light green}/Sub-Section{dark gray}/"+MID$(CD$,15,1)+"{light blue}/"+MID$(CC$,15,1)
1725 PRINT"{white}16{light green}/Toggle GFX/ASCII{dark gray}/"+MID$(CD$,16,1)+"{light blue}/"+MID$(CC$,16,1)
1730 INPUT"Choice";A$:IFA$="q"THEN1250
1740 IFVAL(A$)>16ORVAL(A$)<=0THEN1540
1750 A=VAL(A$):I1$=LEFT$(CD$,A-1):I2$=RIGHT$(CD$,16-A):I3$=LEFT$(CC$,A-1)
1760 I4$=RIGHT$(CC$,16-A):PRINT"{cyan}New Letter:":POKE198,0
1770 GETA$:IFA$=""THEN1770
1780 CD$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
1790 GETA$:IFA$=""THEN1790
1800 IFA$="0"THEN1820
1810 IFVAL(A$)=0THEN1790
1820 CC$=I3$+A$+I4$:GOTO1540
1830 END
1840 PRINT"{clear}{white}Q)uit Editing":PRINT"{white}#{light green}/Function{cyan}/Letter{pink}/Access"
1850 IFLEN(CF$)<8THENCF$=CF$+"l":GOTO1850
1860 IFLEN(CG$)<8THENCG$=CG$+"0":GOTO1860
1870 PRINT"{white}1{light green}/List Sigs{cyan}/"+MID$(CF$,1,1)+"{pink}/"+MID$(CG$,1,1)
1890 PRINT"{white}2{light green}/Read{cyan}/"+MID$(CF$,2,1)+"{pink}/"+MID$(CG$,2,1)
1900 PRINT"{white}3{light green}/Scan{cyan}/"+MID$(CF$,3,1)+"{pink}/"+MID$(CG$,3,1)
1910 PRINT"{white}4{light green}/New{cyan}/"+MID$(CF$,4,1)+"{pink}/"+MID$(CG$,4,1)
1920 PRINT"{white}5{light green}/Quit{cyan}/"+MID$(CF$,5,1)+"{pink}/"+MID$(CG$,5,1)
1930 PRINT"{white}6{light green}/Post-Reply{cyan}/"+MID$(CF$,6,1)+"{pink}/"+MID$(CG$,6,1)
1940 PRINT"{white}7{light green}/SubOp Cmds.{cyan}/"+MID$(CF$,7,1)+"{pink}/"+MID$(CG$,7,1)
1960 PRINT"{white}8{light green}/All new{cyan}/"+MID$(CF$,8,1)+"{pink}/"+MID$(CG$,8,1)
1970 INPUT"{purple}Choose:";A$
1980 IFA$="q"THEN1250
1990 IFVAL(A$)=0ORVAL(A$)>8THEN1840
2000 A=VAL(A$):I1$=LEFT$(CF$,A-1):I2$=RIGHT$(CF$,8-A):I3$=LEFT$(CG$,A-1)
2010 I4$=RIGHT$(CG$,8-A):PRINT"New Letter:":POKE198,0
2020 GETA$:IFA$=""THEN2020
2030 CF$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
2040 GETA$:IFA$=""THEN2040
2050 IFA$="0"THEN2070
2060 IFVAL(A$)=0THEN2040
2070 CG$=I3$+A$+I4$:GOTO1840
2080 PRINT"{clear}Q)uit editing"
2085 IFLEN(CE$)<13THENCE$=CE$+"l":GOTO2085
2090 PRINT"{white}#{cyan}/Function{light green}/Letter"
2100 PRINT"{white}1{cyan}/Save{light green}/"+MID$(CE$,2,1)
2110 PRINT"{white}2{cyan}/Edit{light green}/"+MID$(CE$,3,1)
2120 PRINT"{white}3{cyan}/Delete{light green}/"+MID$(CE$,4,1)
2130 PRINT"{white}4{cyan}/List{light green}/"+MID$(CE$,5,1)
2140 PRINT"{white}5{cyan}/Clear{light green}/"+MID$(CE$,6,1)
2150 PRINT"{white}6{cyan}/View{light green}/"+MID$(CE$,7,1)
2160 PRINT"{white}7{cyan}/Insert{light green}/"+MID$(CE$,8,1)
2170 PRINT"{white}8{cyan}/Abort{light green}/"+MID$(CE$,9,1)
2171 PRINT"{white}9{cyan}/GFX{light green}/"+MID$(CE$,10,1)
2172 PRINT"{white}10{cyan}/Word Wrap{light green}/"+MID$(CE$,11,1)
2173 PRINT"{white}11{cyan}/Center Text{light green}/"+MID$(CE$,12,1)
2174 PRINT"{white}12{cyan}/Line Numbers{light green}/"+MID$(CE$,13,1)
2180 PRINT"{purple}Choose:";:INPUTA$
2190 IFA$="q"THEN1250
2200 IFVAL(A$)=0ORVAL(A$)>12THEN2190
2210 A=VAL(A$)+1:I1$=LEFT$(CE$,A-1):I2$=RIGHT$(CE$,13-A)
2220 PRINT"New Letter:":POKE198,0
2230 GETA$:IFA$=""THEN2230
2240 CE$=I1$+A$+I2$:GOTO2080
2250 INPUT"New Name";BN$:GOTO1250
2260 INPUT"New Device";B$:IFB$=""ORVAL(B$)<8ORVAL(B$)>11THEN1250
2270 IFA$="l"THENUL=VAL(B$):GOTO1250
2280 MD=VAL(B$):GOTO1250
2290 PRINT"{clear}{white}N)umber of Sigs:"+STR$(SG+1)
2300 PRINT"{cyan}Q)uit
2310 PRINT"{light blue}----------------------------------------"
2320 PRINT"{pink}#{white}/{yellow}Name{white}/Access/{cyan}Device{white}/{light green}Max Msgs"
2330 PRINT"{light blue}----------------------------------------"
2340 FORI=0TOSG:PRINT"{pink}"+STR$(I+1)+"){white}/{yellow}"+SG$(I)+"{white}/"+STR$(SG(I))+"/{cyan}";
2350 PRINTSTR$(SD(I))+"{white}/{light green}"+STR$(SF(I)):NEXTI:POKE198,0
2360 A$="":INPUT"Choose";A$
2370 IFA$="n"THEN2410
2380 IFA$="q"THEN1240
2390 IFVAL(A$)<=0THEN2290
2400 GOTO2430
2410 INPUT"New Number:";A:A=A-1:IFA>=0ANDA<50THENSG=A
2420 GOTO2290
2430 A=VAL(A$):IFA>SG+1THEN2290
2440 A=A-1:INPUT"New Name:";SG$(A)
2450 INPUT"New Access:";SG(A):IFSG(A)>9THEN2450
2460 INPUT"New Device:";SD(A):IFSD(A)<8ORSD(A)>11THEN2460
2470 INPUT"Max Msgs:";SF(A):IFSF(A)>50THEN2470
2480 POKE19,0:GOTO2290
2490 PRINT"{clear}{white}N)umber of Uds:"+STR$(UD+1)
2500 PRINT"{cyan}Q)uit
2510 PRINT"{light blue}----------------------------------------"
2520 PRINT"{pink}#{white}/{yellow}Name{white}/Access/{cyan}Device"
2530 PRINT"{light blue}----------------------------------------"
2540 FORI=0TOUD:PRINT"{pink}"+STR$(I+1)+"){white}/{yellow}"+UD$(I)+"{white}/"+STR$(UA(I))+"/{cyan}";
2550 PRINTSTR$(UV(I)):NEXTI:POKE198,0
2560 INPUT"Choose";A$
2570 IFA$="n"THEN2610
2580 IFA$="q"THEN1240
2590 IFVAL(A$)<=0THEN2490
2600 GOTO2630
2610 INPUT"New Number:";A:A=A-1:IFA>=0ANDA<20THENUD=A
2620 GOTO2490
2630 A=VAL(A$):IFA>UD+1THEN2490
2640 A=A-1:INPUT"New Name:";UD$(A)
2650 INPUT"New Access:";UA(A):IFUA(A)>9THEN2650
2660 INPUT"New Device:";UV(A):IFUV(A)<8ORUV(A)>11THEN2660
2670 GOTO2490
2680 OPEN1,8,15,"s0:{pound}variables":CLOSE1:OPEN8,8,8,"{pound}variables,s,w"
2690 PRINT#8,BN$:PRINT#8,MD:PRINT#8,CD$:PRINT#8,CC$:PRINT#8,CE$:PRINT#8,CF$
2700 PRINT#8,CG$:PRINT#8,SG:FORI=0TOSG:PRINT#8,SG$(I):PRINT#8,SG(I)
2710 PRINT#8,SD(I):PRINT#8,SF(I):NEXTI:PRINT#8,UD:FORI=0TOUD:PRINT#8,UD$(I)
2720 PRINT#8,UA(I):PRINT#8,UV(I):NEXTI:
2730 FORI=0TO9:PRINT#8,CA(I):PRINT#8,TM(I):NEXTI:PRINT#8,UL:PRINT#8,CH$
2740 PRINT#8,CI$:PRINT#8,SS:FORI=0TOSS:PRINT#8,SS$(I):PRINT#8,SS(I):NEXT
2741 FORI=1TO8:PRINT#8,FL$(I):NEXT:PRINT#8,M0
2749 CLOSE8:GOTO130
2750 PRINT"{clear}Q)uit{down*4}"
2760 PRINT"{pink}LVL{white}/{yellow}Calls{white}/{light green}Minutes"
2770 FORI=0TO9:PRINT"{pink}"+STR$(I)+"{white}/{yellow}"+STR$(CA(I))+"{white}/   {light green}"+STR$(TM(I)):NEXTI
2790 PRINT"{white}Choose:";:
2800 GETA$:IFA$=""THEN2800
2810 IFA$="q"THEN1240
2820 IFVAL(A$)=0ANDA$<>"0"THEN2800
2830 PRINT:A=VAL(A$):INPUT"# of calls";CA(A)
2850 INPUT"Number Of Minutes (1-255)";G:IFG<1ORG>255THEN2850
2860 TM(A)=G:GOTO2750
2870 REM
2880 PRINT"{clear}Q)uit Editing"
2890 IFLEN(CH$)<8THENCH$=CH$+"l":GOTO2890
2900 IFLEN(CI$)<8THENCI$=CI$+"0":GOTO2900
2910 PRINT"{white}#{light green}/Function{dark gray}/Letter{light blue}/Access"
2920 PRINT"{white}1{light green}/Directory{dark gray}/"+MID$(CH$,1,1)+"{light blue}/"+MID$(CI$,1,1)
2930 PRINT"{white}2{light green}/Quit{dark gray}/"+MID$(CH$,2,1)+"{light blue}/"+MID$(CI$,2,1)
2940 PRINT"{white}3{light green}/Upload{dark gray}/"+MID$(CH$,3,1)+"{light blue}/"+MID$(CI$,3,1)
2950 PRINT"{white}4{light green}/Download{dark gray}/"+MID$(CH$,4,1)+"{light blue}/"+MID$(CI$,4,1)
2960 PRINT"{white}5{light green}/List UDs{dark gray}/"+MID$(CH$,5,1)+"{light blue}/"+MID$(CI$,5,1)
2970 PRINT"{white}6{light green}/Change UDs{dark gray}/"+MID$(CH$,6,1)+"{light blue}/"+MID$(CI$,6,1)
2980 PRINT"{white}7{light green}/About File{dark gray}/"+MID$(CH$,7,1)+"{light blue}/"+MID$(CI$,7,1)
2985 PRINT"{white}8{light green}/Multi {dark gray}/"+MID$(CH$,8,1)+"{light blue}/"+MID$(CI$,8,1)
2990 A$="":INPUT"Choice";A$:IFA$="q"THEN1250
3000 IFVAL(A$)>8ORVAL(A$)<=0THEN2880
3010 A=VAL(A$):I1$=LEFT$(CH$,A-1):I2$=RIGHT$(CH$,8-A):I3$=LEFT$(CI$,A-1)
3020 I4$=RIGHT$(CI$,8-A):PRINT"{cyan}New Letter:":POKE198,0
3030 GETA$:IFA$=""THEN3030
3040 CH$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
3050 GETA$:IFA$=""THEN3050
3060 IFA$="0"THEN3080
3070 IFVAL(A$)=0THEN3050
3080 CI$=I3$+A$+I4$:GOTO2880
3090 END
3100 PRINT"{clear}{down}{pink}N)umber of sections:"+STR$(ABS(SS+1))
3110 PRINT"{yellow}Q)uit"
3120 PRINT"{down*2}{white}#  {white}/{cyan}Name{white}/{light blue}Access":PRINT"{white}-----------------------"
3130 FORI=0TOSS:A$=STR$(I+1):PRINT"{white}#"+A$+"{white}/{cyan}"+SS$(I)+"{white}/{light blue}"+STR$(SS(I))
3140 NEXTI
3150 PRINT"{white}-----------------------"
3160 PRINT"{down}Option";:INPUTI$:IFI$="q"THEN1250
3170 IFI$="n"THENPRINT:INPUT"New #:";SS:SS=SS-1:GOTO3100
3180 N=VAL(I$):IFN=0ORN>SS+1THEN3100
3190 PRINT:INPUT"Name:";SS$(N-1):
3191 PRINT:INPUT"Access:";A:IFA>=0ANDA<10THENSS(N-1)=A
3195 GOTO3100
3300 PRINT"{clear}         Color Cycle"
3310 FORI=1TO8
3320 PRINT"{white}#"+STR$(I);:A$=FL$(I):GOSUB3350:PRINTI$:NEXT
3321 FORI=1TO8
3322 PRINT"{white}#"+STR$(I);:A$=FL$(I):GOSUB3350:PRINTI$:NEXT
3323 INPUT"{white}Edit (Q=Quit)";N$:IFN$="q"THEN1250
3330 N=VAL(N$):IFN=0ORN>8THEN3300
3331 PRINT"Color:"
3332 GETA$:IFA$=""ORA$=CHR$(13)THEN3332
3333 FL$(N)=A$:GOTO3300
3350 I$="":IFA$="{white}"THENI$=A$+"White"
3351 IFA$="{red}"THENI$=A$+"Red"
3352 IFA$="{cyan}"THENI$=A$+"Cyan"
3353 IFA$="{purple}"THENI$=A$+"Purple"
3354 IFA$="{green}"THENI$=A$+"Green"
3355 IFA$="{blue}"THENI$=A$+"Blue"
3356 IFA$="{yellow}"THENI$=A$+"Yellow"
3357 IFA$="{orange}"THENI$=A$+"Orange"
3358 IFA$="{brown}"THENI$=A$+"Brown"
3359 IFA$="{pink}"THENI$=A$+"Pink"
3360 IFA$="{dark gray}"THENI$=A$+"Dark Grey"
3361 IFA$="{gray}"THENI$=A$+"Med Grey"
3362 IFA$="{light green}"THENI$=A$+"Lt Green"
3363 IFA$="{light blue}"THENI$=A$+"Lt Blue"
3364 IFA$="{light gray}"THENI$=A$+"Lt Grey"
3365 IFI$=""THENI$="Unknown"
3366 RETURN
3400 PRINT"{clear}{down*2}1)- 1670 and compatables"
3410 PRINT"2)- 1650 and compatables"
3420 PRINT"3)- 1660 and compatables"
3430 PRINT"{down*2}Choose"
3440 GETA:IFA>3ORA=0THEN3440
3450 M0=A-1:GOTO1250
3500 INPUT"ENTER{sh space}THE{sh space}RECORD{sh space}TO{sh space}EDIT";S1:I1=INT(S1/256):I3=I1*256:I2=S1-I3
3505 OPEN1,8,15:OPEN2,8,2,"{pound}log1"
3510 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):GET#2,A$:INPUT#1,E1
3515 IFE1=0ANDA$="{pound}"THENINPUT#2,A$:PRINTA$:CLOSE1:CLOSE2:GOTO3523
3520 PRINT"NO RECORD":CLOSE1:CLOSE2:FORI=0TO1000:NEXT:GOTO360
3523 CLOSE2:CLOSE1:OPEN1,8,15:OPEN2,8,2,"{pound}log2"
3525 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0)
3530 INPUT#2,CA$,DA$:FORI=0TO9:INPUT#2,P$(I):NEXT:CLOSE1:CLOSE2
3535 PRINT"CALLS{sh space}TODAY:";CA$:PRINT"LAST{sh space}DAY{sh space}CALLED:";DA$
3540 FORI=0TO9:PRINT"VARIABLE ("+STR$(I)+"):";P$(I):NEXT
3550 PRINT"EDIT?(Y/N):
3551 GETA$:IFA$="n"THEN360
3552 IFA$<>"y"THEN3551
3560 INPUT"CALLS{sh space}TODAY";CA$:INPUT"LAST{sh space}DAY{sh space}CALLED{sh space}(0-365)";DA$
3565 FORI=0TO9:PRINT"VARIABLE ("+STR$(I)+")";:INPUTP$(I):NEXT
3570 PRINT"CORRECT(Y?N)"
3580 GETA$:IFA$="n"THEN3560
3590 IFA$<>"y"THEN3580
3600 OPEN1,8,15:OPEN2,8,2,"{pound}log2"
3610 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0)
3620 A$="":Q$=CHR$(13):A$=CA$+Q$+DA$+Q$:FORI=0TO9:A$=A$+P$(I)+Q$:NEXT
3630 PRINT#2,A$:CLOSE2:CLOSE1:GOTO360
3670 PRINT"CORRECT?"
3700 OPEN1,8,15:OPEN2,8,2,"{pound}log2,l,"+CHR$(100)
3710 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(0):
3720 A$="":Q$=CHR$(13):FORI=0TO11:A$=A$+"0"+Q$:NEXT:PRINT#2,A$:CLOSE2:CLOSE1
3730 GOTO360
