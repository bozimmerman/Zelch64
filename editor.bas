!--------------------------------------------------
!- Saturday, May 20, 2017 2:17:03 PM
!- Import of : 
!- c:\src\zelch64\editor.prg
!- Commodore 64
!--------------------------------------------------
0 CLR:DIMSG$(50),SG(50),SD(50),SF(50),UD$(20),UA(20),UV(20),FL(50)
1 POKE53280,0:POKE53281,0:PRINTCHR$(14)+"{yellow}Put Data disk in drive 8 and"
2 PRINT"hit RETURN":POKE198,0
3 GETA$:IFA$<>CHR$(13)THEN3
4 OPEN1,8,15:OPEN8,8,8,"{pound}variables,s,r":INPUT#8,BN$:INPUT#1,E1
5 IFE1>0THENCLOSE8:CLOSE1:GOTO20
6 INPUT#8,MD,CD$,CC$,CE$,CF$,CG$,SG:FORI=0TOSG:INPUT#8,SG$(I),SG(I),SD(I),SF(I)
7 NEXTI:INPUT#8,UD:FORI=0TOUD:INPUT#8,UD$(I),UA(I),UV(I):NEXTI
8 FORI=0TO9:INPUT#8,CA(I),TM(I):NEXTI
9 INPUT#8,UL,CH$,CI$:IFST>0THEN19
10 INPUT#8,NP:FORI=0TONP:INPUT#8,FL(I):NEXT
19 CLOSE8:CLOSE1
20 PRINT"{clear}{yellow}Menu:"
30 PRINT"1) Main editor"
40 PRINT"2) User editor"
50 PRINT"3) Sig record creator"
60 GETA$:IFA$="3"THEN130
70 IFA$="2"THEN850
80 IFA$="1"THEN1980
90 GOTO60
100 GOTO120
110 OPEN1,8,15:INPUT#1,E1,E2$,E3,E4:PRINTE1;E2$;E3;E4:CLOSE1:END
130 POKE19,65:INPUT"Enter Sig to create:";I:POKE19,0:PRINT
131 IFI-1<0ORI-1>SGTHEN20
132 PRINT"Sig"+STR$(I)+", are you sure?":POKE198,0:D=I-1
133 GETA$:IFA$="n"THEN20
134 IFA$<>"y"THEN133
140 OPEN1,8,15,"s0:{pound}Sig"+STR$(D):OPEN2,8,2,"{pound}Sig"+STR$(D)+",l,"+CHR$(15)
141 PRINT"Working...":GOTO145
142 PRINT#1,"p"CHR$(98)CHR$(I)CHR$(0)CHR$(J):RETURN
145 I=1:J=1:GOSUB142:PRINT#2,"0":J=7:GOSUB142:PRINT#2,"0":
146 FORX=0TOSF(D):I=X+2:J=1:GOSUB142:PRINT#2,"0":J=7:GOSUB142:PRINT#2,"0"
147 NEXTX:CLOSE2:CLOSE1:GOTO20
849 END
850 REM
890 IFFL=1THENFL=0:OPEN1,8,15:OPEN2,8,2,"{pound}userlog":GOTO1510
900 PRINT"{clear}1) Create new user log"
910 PRINT"2) Edit User Log"
920 PRINT"3) Display  Users"
930 PRINT"4) Add a user"
940 PRINT"5) Exit"
950 GETA$:IFA$="1"THEN1370
960 IFA$="3"THEN1010
970 IFA$="5"THEN1780
980 IFA$="4"THEN1820
990 IFA$<>"2"THEN950
1000 GOTO1130
1010 INPUT"start at record";S1
1020 PRINT"space aborts..."
1030 OPEN1,8,15:OPEN2,8,2,"{pound}userlog"
1040 I1=INT(S1/256):I3=I1*256:I2=S1-I3:
1050 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(5):GET#2,A$:INPUT#1,E1
1060 IFE1<>0ORA$=""THEN1110
1070 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(5)
1080 INPUT#2,NA$:PRINT"#";S1;" ";NA$:GETA$:IFA$=" "THEN1110
1090 S1=S1+1:GOTO1040
1100 GOTO1040
1110 CLOSE2:CLOSE1:PRINT"hit any key"
1120 POKE198,0:WAIT197,64,64:GOTO890
1130 INPUT"enter the record to edit";S1:I1=INT(S1/256):I3=I1*256:I2=S1-I3
1140 OPEN1,8,15:OPEN2,8,2,"{pound}userlog"
1150 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(5):GET#2,A$
1160 IFST=0ANDA$<>""THENGOTO1200
1170 PRINT"no record":CLOSE1:CLOSE2:FORI=0TO1000:NEXT:GOTO890
1180 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(I):INPUT#2,A$
1190 RETURN
1200 I=5:GOSUB1180:NA$=A$:I=25:GOSUB1180:PH$=A$:I=35:GOSUB1180:AC$=A$:
1210 I=40:GOSUB1180:RN$=A$:I=60:GOSUB1180:LA$=A$
1220 I=80:GOSUB1180:TM$=A$:I=90:GOSUB1180:PA$=A$:I=100:GOSUB1180
1230 O=0:FORI=100TO145STEP5:GOSUB1180:P$(O)=A$:O=O+1:NEXT:CLOSE2:CLOSE1
1240 PRINT"name:";NA$:PRINT"Phone:";PH$:PRINT"Access lvl:";AC$:
1250 PRINT"Real Name:";RN$:PRINT"Last Call Date:";LA$
1260 PRINT"off at:";TM$:PRINT"password:";PA$:FORI=0TO9
1270 PRINT"variable #"I" = ";P$(I):NEXT:PRINT"Edit this record?"
1280 GETA$:IFA$="n"THENCLOSE2:CLOSE1:GOTO890
1290 IFA$<>"y"THEN1280
1300 INPUT"name:";NA$:INPUT"Phone:";PH$:INPUT"Access lvl:";AC$:
1310 INPUT"Real Name:";RN$:INPUT"Last Call Date:";LA$:INPUT"Calls today:";CA$
1320 INPUT"off at:";TM$:INPUT"password:";PA$:FORI=0TO9
1330 PRINT"variable #"I" = ";:INPUTP$(I):NEXT:PRINT"Save this record?"
1340 GETA$:IFA$="n"THEN1240
1350 IFA$<>"y"THEN1340
1360 OPEN1,8,15:OPEN2,8,2,"{pound}userlog":GOTO1510
1370 PRINT"Delete old userlog and make new one"
1380 PRINT"ok? (y/n)"
1390 GETA$:IFA$="n"THEN890
1400 IFA$<>"y"THEN1390
1410 PRINT"enter your name (20 chars)":INPUTNA$
1420 PRINT"enter the phone #(10 chars)":INPUTPH$
1430 AC$="9":INPUT"your real name(20 chars)";RN$
1440 LA$="1/ 1":TM$="12:59":INPUT"password (7 chars)";PA$
1450 FORI=0TO9:P$(I)="0":NEXT
1460 PRINT"take this questionare again (Y/N)"
1470 GETA$:IFA$="y"THEN1410
1480 IFA$<>"n"THEN1470
1490 OPEN1,8,15,"s0:{pound}userlog":I2=1:I1=0
1500 OPEN2,8,2,"{pound}userlog,l,"+CHR$(150)
1501 GOTO1510
1502 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(I):RETURN
1510 I=5:GOSUB1502:PRINT#2,NA$:I=25:GOSUB1502:PRINT#2,PH$:I=35:GOSUB1502:
1520 PRINT#2,AC$:I=40:GOSUB1502:PRINT#2,RN$:I=60:GOSUB1502:PRINT#2,LA$
1530 I=80:GOSUB1502:PRINT#2,TM$:I=90:GOSUB1502:PRINT#2,PA$:CT=0
1540 FORI=100TO145STEP5:GOSUB1502:PRINT#2,P$(CT):CT=CT+1:NEXTI
1750 CLOSE2:CLOSE1
1760 PRINT"Hit any key"
1770 POKE198,0:WAIT197,64,64:GOTO890
1780 GOTO20
1820 PRINT"Finding a Record...":OPEN1,8,15:OPEN2,8,2,"{pound}userlog":I2=1:I1=0
1830 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(5):INPUT#1,E:GET#2,A$
1840 IFE>5ORA$=""THEN1880
1850 PRINT#1,"p"CHR$(98)CHR$(I2)CHR$(I1)CHR$(5):INPUT#2,A$:IFA$="EMPTY"THEN1880
1860 I2=I2+1:IFI2=256THENI2=0:I1=I1+1
1870 GOTO1830
1880 CLOSE1:CLOSE2:INPUT"Handle";NA$:IFLEN(NA$)>17ORNA$=""THEN1880
1890 INPUT"Real name";RN$:IFLEN(RN$)>17ORRN$=""THEN1890
1900 INPUT"Phone";PH$:IFLEN(PH$)>8ORPH$=""THEN1900
1910 INPUT"Access";AC$:IFLEN(AC$)>2ORAC$=""THEN1910
1920 CA$="0":LA$="1/1":TM$="12:00":FORI=0TO9:P$(I)="0":NEXT
1930 INPUT"Password";PA$:IFLEN(PA$)>7ORPA$=""THEN1930
1940 PRINT"S)ave or Q)uit"
1950 GETA$:IFA$="q"THEN890
1960 IFA$="s"THENFL=1:OPEN1,8,15:OPEN2,8,2,"{pound}userlog":GOTO1510
1970 GOTO1950
1980 REM
2050 PRINT"{clear}{yellow}Main editor:":PRINT"Name of BBS:"+BN$:PRINT"Library Device:";UL
2060 PRINT"Mail Device:";MD:PRINT"0) Edit Main level options"
2070 PRINT"1) Edit Msg Mkr options"
2080 PRINT"2) Edit Msg base options"
2090 PRINT"3) Name of BBS"
2100 PRINT"4) Mail Device"
2101 PRINT"5) Sig System"
2102 PRINT"6) UD Editor"
2103 PRINT"7) Time/Calls editor"
2104 PRINT"8) Library Device"
2105 PRINT"9) Edit UD options"
2106 PRINT"P) Edit on-line program info"
2110 PRINT"Q) Quit"
2120 PRINT"S) SAVE and Quit"
2130 PRINT"{down*2}Choose:"
2140 GETA$:IFA$="q"THEN20
2150 IFA$="0"THEN2220
2160 IFA$="1"THEN2660
2170 IFA$="2"THEN2460
2180 IFA$="3"THEN2830
2190 IFA$="4"THEN2840
2191 IFA$="5"THEN3000
2192 IFA$="6"THEN4000
2193 IFA$="7"THEN5060
2194 IFA$="8"THEN2840
2195 IFA$="9"THEN5200
2200 IFA$="s"THEN5000
2205 IFA$="p"THEN6000
2210 GOTO2140
2220 PRINT"{clear}Q)uit Editing"
2221 IFLEN(CD$)<15THENCD$=CD$+"l":GOTO2221
2222 IFLEN(CC$)<15THENCC$=CC$+"0":GOTO2222
2230 PRINT"{white}#{light green}/Function{dark gray}/Letter{light blue}/Access"
2240 PRINT"{white}1{light green}/Feedback{dark gray}/"+MID$(CD$,1,1)+"{light blue}/"+MID$(CC$,1,1)
2250 PRINT"{white}2{light green}/Off{dark gray}/"+MID$(CD$,2,1)+"{light blue}/"+MID$(CC$,2,1)
2260 PRINT"{white}3{light green}/Info{dark gray}/"+MID$(CD$,3,1)+"{light blue}/"+MID$(CC$,3,1)
2270 PRINT"{white}4{light green}/Chat{dark gray}/"+MID$(CD$,4,1)+"{light blue}/"+MID$(CC$,4,1)
2280 PRINT"{white}5{light green}/Userlist{dark gray}/"+MID$(CD$,5,1)+"{light blue}/"+MID$(CC$,5,1)
2290 PRINT"{white}6{light green}/Status{dark gray}/"+MID$(CD$,6,1)+"{light blue}/"+MID$(CC$,6,1)
2300 PRINT"{white}7{light green}/Email{dark gray}/"+MID$(CD$,7,1)+"{light blue}/"+MID$(CC$,7,1)
2310 PRINT"{white}8{light green}/SysOp{dark gray}/"+MID$(CD$,8,1)+"{light blue}/"+MID$(CC$,8,1)
2320 PRINT"{white}9{light green}/Msg Base{dark gray}/"+MID$(CD$,9,1)+"{light blue}/"+MID$(CC$,9,1)
2330 PRINT"{white}10{light green}/Transfer{dark gray}/"+MID$(CD$,10,1)+"{light blue}/"+MID$(CC$,10,1)
2340 PRINT"{white}11{light green}/Vote{dark gray}/"+MID$(CD$,11,1)+"{light blue}/"+MID$(CC$,11,1)
2341 PRINT"{white}12{light green}/Baud Change{dark gray}/"+MID$(CD$,12,1)+"{light blue}/"+MID$(CC$,12,1)
2342 PRINT"{white}13{light green}/Library{dark gray}/"+MID$(CD$,13,1)+"{light blue}/"+MID$(CC$,13,1)
2343 PRINT"{white}14{light green}/Editor{dark gray}/"+MID$(CD$,14,1)+"{light blue}/"+MID$(CC$,14,1)
2344 PRINT"{white}15{light green}/Sub-Section{dark gray}/"+MID$(CD$,15,1)+"{light blue}/"+MID$(CC$,15,1)
2350 INPUT"Choice";A$:IFA$="q"THEN2050
2360 IFVAL(A$)>15ORVAL(A$)<=0THEN2220
2370 A=VAL(A$):I1$=LEFT$(CD$,A-1):I2$=RIGHT$(CD$,15-A):I3$=LEFT$(CC$,A-1)
2380 I4$=RIGHT$(CC$,15-A):PRINT"{cyan}New Letter:":POKE198,0
2390 GETA$:IFA$=""THEN2390
2400 CD$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
2410 GETA$:IFA$=""THEN2410
2420 IFA$="0"THEN2440
2430 IFVAL(A$)=0THEN2410
2440 CC$=I3$+A$+I4$:GOTO2220
2450 END
2460 PRINT"{clear}{white}Q)uit Editing":PRINT"{white}#{light green}/Function{cyan}/Letter{pink}/Access"
2461 IFLEN(CF$)<10THENCF$=CF$+"l":GOTO2461
2462 IFLEN(CG$)<10THENCG$=CG$+"0":GOTO2462
2470 PRINT"{white}1{light green}/List Sigs{cyan}/"+MID$(CF$,1,1)+"{pink}/"+MID$(CG$,1,1)
2480 PRINT"{white}2{light green}/Change Sigs{cyan}/"+MID$(CF$,2,1)+"{pink}/"+MID$(CG$,2,1)
2490 PRINT"{white}3{light green}/Read{cyan}/"+MID$(CF$,3,1)+"{pink}/"+MID$(CG$,3,1)
2500 PRINT"{white}4{light green}/Scan{cyan}/"+MID$(CF$,4,1)+"{pink}/"+MID$(CG$,4,1)
2510 PRINT"{white}5{light green}/New{cyan}/"+MID$(CF$,5,1)+"{pink}/"+MID$(CG$,5,1)
2520 PRINT"{white}6{light green}/Quit{cyan}/"+MID$(CF$,6,1)+"{pink}/"+MID$(CG$,6,1)
2530 PRINT"{white}7{light green}/Post-Reply{cyan}/"+MID$(CF$,7,1)+"{pink}/"+MID$(CG$,7,1)
2540 PRINT"{white}8{light green}/Resp Delete{cyan}/"+MID$(CF$,8,1)+"{pink}/"+MID$(CG$,8,1)
2550 PRINT"{white}9{light green}/Msg Delete{cyan}/"+MID$(CF$,9,1)+"{pink}/"+MID$(CG$,9,1)
2551 PRINT"{white}10{light green}/All new{cyan}/"+MID$(CF$,10,1)+"{pink}/"+MID$(CG$,10,1)
2560 INPUT"{purple}Choose:";A$
2570 IFA$="q"THEN2050
2575 IFVAL(A$)=0ORVAL(A$)>10THEN2460
2590 A=VAL(A$):I1$=LEFT$(CF$,A-1):I2$=RIGHT$(CF$,10-A):I3$=LEFT$(CG$,A-1)
2600 I4$=RIGHT$(CG$,10-A):PRINT"New Letter:":POKE198,0
2610 GETA$:IFA$=""THEN2610
2615 CF$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
2620 GETA$:IFA$=""THEN2620
2630 IFA$="0"THEN2650
2640 IFVAL(A$)=0THEN2620
2650 CG$=I3$+A$+I4$:GOTO2460
2660 PRINT"{clear}Q)uit editing"
2670 PRINT"{white}#{cyan}/Function{light green}/Letter"
2680 PRINT"{white}1{cyan}/Save{light green}/"+MID$(CE$,2,1)
2690 PRINT"{white}2{cyan}/Edit{light green}/"+MID$(CE$,3,1)
2700 PRINT"{white}3{cyan}/Delete{light green}/"+MID$(CE$,4,1)
2710 PRINT"{white}4{cyan}/List{light green}/"+MID$(CE$,5,1)
2720 PRINT"{white}5{cyan}/Clear{light green}/"+MID$(CE$,6,1)
2730 PRINT"{white}6{cyan}/View{light green}/"+MID$(CE$,7,1)
2740 PRINT"{white}7{cyan}/Insert{light green}/"+MID$(CE$,8,1)
2750 PRINT"{white}8{cyan}/Abort{light green}/"+MID$(CE$,9,1)
2760 PRINT"{purple}Choose:"
2770 GETA$:IFA$="q"THEN2050
2780 IFVAL(A$)=0ORVAL(A$)>8THEN2770
2790 A=VAL(A$)+1:I1$=LEFT$(CE$,A-1):I2$=RIGHT$(CE$,9-A)
2800 PRINT"New Letter:":POKE198,0
2810 GETA$:IFA$=""THEN2810
2820 CE$=I1$+A$+I2$:GOTO2660
2830 INPUT"New Name";BN$:GOTO2050
2840 INPUT"New Device";B$:IFB$=""ORVAL(B$)<8ORVAL(B$)>11THEN2050
2841 IFA$="9"THENUL=VAL(B$):GOTO2050
2850 MD=VAL(B$):GOTO2050
3000 PRINT"{clear}{white}N)umber of Sigs:"+STR$(SG+1)
3001 PRINT"{cyan}Q)uit
3002 PRINT"{light blue}----------------------------------------"
3003 PRINT"{pink}#{white}/{yellow}Name{white}/Access/{cyan}Device{white}/{light green}Max Msgs"
3004 PRINT"{light blue}----------------------------------------"
3011 FORI=0TOSG:PRINT"{pink}"+STR$(I+1)+"){white}/{yellow}"+SG$(I)+"{white}/"+STR$(SG(I))+"/{cyan}";
3012 PRINTSTR$(SD(I))+"{white}/{light green}"+STR$(SF(I)):NEXTI:POKE198,0
3020 A$="":INPUT"Choose";A$
3021 IFA$="n"THEN3030
3022 IFA$="q"THEN1980
3023 IFVAL(A$)<=0THEN3000
3024 GOTO3050
3030 INPUT"New Number:";A:A=A-1:IFA>=0ANDA<50THENSG=A
3040 GOTO3000
3050 A=VAL(A$):IFA>SG+1THEN3000
3051 A=A-1:INPUT"New Name:";SG$(A)
3052 INPUT"New Access:";SG(A):IFSG(A)>9THEN3052
3053 INPUT"New Device:";SD(A):IFSD(A)<8ORSD(A)>11THEN3053
3054 INPUT"Max Msgs:";SF(A):IFSF(A)>50THEN3054
3055 POKE19,0:GOTO3000
4000 PRINT"{clear}{white}N)umber of Uds:"+STR$(UD+1)
4001 PRINT"{cyan}Q)uit
4002 PRINT"{light blue}----------------------------------------"
4003 PRINT"{pink}#{white}/{yellow}Name{white}/Access/{cyan}Device"
4004 PRINT"{light blue}----------------------------------------"
4011 FORI=0TOUD:PRINT"{pink}"+STR$(I+1)+"){white}/{yellow}"+UD$(I)+"{white}/"+STR$(UA(I))+"/{cyan}";
4012 PRINTSTR$(UV(I)):NEXTI:POKE198,0
4020 INPUT"Choose";A$
4021 IFA$="n"THEN4030
4022 IFA$="q"THEN1980
4023 IFVAL(A$)<=0THEN4000
4024 GOTO4050
4030 INPUT"New Number:";A:A=A-1:IFA>=0ANDA<20THENUD=A
4040 GOTO4000
4050 A=VAL(A$):IFA>UD+1THEN4000
4051 A=A-1:INPUT"New Name:";UD$(A)
4052 INPUT"New Access:";UA(A):IFUA(A)>9THEN4052
4053 INPUT"New Device:";UV(A):IFUV(A)<8ORUV(A)>11THEN4053
4055 GOTO4000
5000 OPEN1,8,15,"s0:{pound}variables":CLOSE1:OPEN8,8,8,"{pound}variables,s,w"
5010 PRINT#8,BN$:PRINT#8,MD:PRINT#8,CD$:PRINT#8,CC$:PRINT#8,CE$:PRINT#8,CF$
5020 PRINT#8,CG$:PRINT#8,SG:FORI=0TOSG:PRINT#8,SG$(I):PRINT#8,SG(I)
5030 PRINT#8,SD(I):PRINT#8,SF(I):NEXTI:PRINT#8,UD:FORI=0TOUD:PRINT#8,UD$(I)
5040 PRINT#8,UA(I):PRINT#8,UV(I):NEXTI:
5050 FORI=0TO9:PRINT#8,CA(I):PRINT#8,TM(I):NEXTI:PRINT#8,UL:PRINT#8,CH$
5055 PRINT#8,CI$:PRINT#8,NP:FORI=0TONP:PRINT#8,FL(I):NEXT:CLOSE8:GOTO20
5060 PRINT"{clear}Q)uit{down*4}"
5070 PRINT"{pink}LVL{white}/{yellow}Calls{white}/{light green}Hours{white}/{light blue}MinX10"
5080 FORI=0TO9:PRINT"{pink}"+STR$(I)+"{white}/{yellow}"+STR$(CA(I))+"{white}/   {light green}"+STR$(INT(TM(I)/10));
5090 PRINT"{white}/   {light blue}"+STR$(TM(I)-(INT(TM(I)/10)*10)):NEXTI
5100 PRINT"{white}Choose:";:
5110 GETA$:IFA$=""THEN5110
5115 IFA$="q"THEN1980
5120 IFVAL(A$)=0ANDA$<>"0"THEN5110
5130 PRINT:A=VAL(A$):INPUT"# of calls";CA(A)
5140 INPUT"# of hours (0-12)";F:IFF>12THEN5140
5150 INPUT"# of tens of minutes (0-5)";G:IFG>5THEN5150
5160 TM(A)=F*10+G:GOTO5060
5200 REM
5220 PRINT"{clear}Q)uit Editing"
5221 IFLEN(CH$)<7THENCH$=CH$+"l":GOTO5221
5222 IFLEN(CI$)<7THENCI$=CI$+"0":GOTO5222
5230 PRINT"{white}#{light green}/Function{dark gray}/Letter{light blue}/Access"
5240 PRINT"{white}1{light green}/Directory{dark gray}/"+MID$(CH$,1,1)+"{light blue}/"+MID$(CI$,1,1)
5250 PRINT"{white}2{light green}/Quit{dark gray}/"+MID$(CH$,2,1)+"{light blue}/"+MID$(CI$,2,1)
5260 PRINT"{white}3{light green}/Upload{dark gray}/"+MID$(CH$,3,1)+"{light blue}/"+MID$(CI$,3,1)
5270 PRINT"{white}4{light green}/Download{dark gray}/"+MID$(CH$,4,1)+"{light blue}/"+MID$(CI$,4,1)
5280 PRINT"{white}5{light green}/List UDs{dark gray}/"+MID$(CH$,5,1)+"{light blue}/"+MID$(CI$,5,1)
5290 PRINT"{white}6{light green}/Change UDs{dark gray}/"+MID$(CH$,6,1)+"{light blue}/"+MID$(CI$,6,1)
5300 PRINT"{white}7{light green}/About File{dark gray}/"+MID$(CH$,7,1)+"{light blue}/"+MID$(CI$,7,1)
5350 INPUT"Choice";A$:IFA$="q"THEN2050
5360 IFVAL(A$)>14ORVAL(A$)<=0THEN5220
5370 A=VAL(A$):I1$=LEFT$(CH$,A-1):I2$=RIGHT$(CH$,7-A):I3$=LEFT$(CI$,A-1)
5380 I4$=RIGHT$(CI$,7-A):PRINT"{cyan}New Letter:":POKE198,0
5390 GETA$:IFA$=""THEN5390
5400 CH$=I1$+A$+I2$:PRINT"New Access:":POKE198,0
5410 GETA$:IFA$=""THEN5410
5420 IFA$="0"THEN5440
5430 IFVAL(A$)=0THEN5410
5440 CI$=I3$+A$+I4$:GOTO5220
5450 END
6000 PRINT"{clear}{down}{pink}N)umber of programs:"+STR$(ABS(NP+1))
6010 PRINT"{yellow}Q)uit"
6020 PRINT"{down*2}{white}#  {white}/{cyan}Filename{white}/{light blue}Access":PRINT"{white}-----------------------"
6025 FORI=0TONP:A$=STR$(I+1):PRINT"{white}#"+A$+"/{cyan}{pound}pgm.#"+RIGHT$(A$,LEN(A$)-1);
6030 PRINT"{white}/{light blue}"+STR$(FL(I)):NEXTI
6040 PRINT"{white}-----------------------"
6050 PRINT"{down}Option:";:POKE19,65:INPUTN$:POKE19,0:IFN$="q"THEN2050
6060 IFN$="n"THENPOKE19,65:PRINT:INPUT"New #:";NP:NP=NP-1:POKE19,0:GOTO6000
6070 N=VAL(N$):IFN=0ORN>NP+1THEN6000
6080 PRINT:POKE19,65:INPUT"Access:";A:IFA>=0ANDA<10THENFL(N-1)=A
6090 GOTO6000
