!--------------------------------------------------
!- Saturday, May 20, 2017 2:17:45 PM
!- Import of : 
!- c:\src\zelch64\prg.read.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT:GOTO4055
8005 TX$="MSG # or RETURN:{ct c}":GOSUB210:GOSUB111:IFI=0THEN4260
8010 CM=I
8020 IFCM>NMTHENTX$="End of Messages":GOSUB210:CM=0:WI=0:GOTO4260
8025 IFCM<1THENCM=0:WI=0:GOTO4260
8030 I1=Z1(CM):I2=Z2(CM):OPEN8,SD(CS),8,"0:{pound}msg"+STR$(CS)+STR$(CM):SYS38212
8040 CLOSE8:IFPEEK(252)=1THENTX$=CHR$(13)+"hit return{ct c}":GOSUB210:GOSUB6370
8049 IFI1=0THEN8190
8050 I9=0:TX$=CHR$(14)+"{pink}R)ead, {light gray}S)kip, {white}Q)uit, or {light green}RETURN:{ct c}":GOSUB210
8060 GOSUB100:IFIN$=""ORIN$=" "THEN8060
8070 TX$=IN$:GOSUB210:IFIN$="q"THEN8190
8080 IFIN$="s"THEN4690
8090 IFIN$<>"r"ANDIN$<>CHR$(13)THEN8050
8100 OPEN8,SD(CS),8,"0:{pound}msg"+STR$(CS)+STR$(CM):SYS38218
8110 IFI9=0THEN8130
8120 FORI=1TOI9:SYS38218:NEXTI
8125 IFI9>=I1THENCLOSE8:GOTO8190
8130 TX$="{clear}{white}Response #"+STR$(I9+1):GOSUB210:SYS38212
8131 IFPEEK(252)=1THENTX$=CHR$(13)+"hit return{ct c}":GOSUB210:GOSUB6370
8140 TX$=CHR$(14)+"{cyan}RETURN continues or A)bort:{ct c}":GOSUB210
8150 GOSUB100:IFIN$=""ORIN$=" "THEN8150
8160 TX$=IN$:GOSUB210:IFIN$="a"THENCLOSE8:GOTO4260
8170 IFIN$<>CHR$(13)THEN8150
8180 I9=I9+1:GOTO8125
8190 IFAC<VAL(MID$(CG$,G,1))THEN4260
8200 TX$=CHR$(14)+CHR$(13)+"{light green}{yellow}{reverse on}Public Reply?{reverse off}{white}:{ct c}":GOSUB210
8210 GOSUB100:IFIN$="n"ORIN$=CHR$(13)THENTX$="n":GOSUB210:GOTO4260
8220 IFIN$="q"THENWI=0:TX$="q":GOSUB210:GOTO4260
8230 IFIN$<>"y"THEN8210
8235 TX$="y":GOSUB210
8240 QQ$="REPLY BY:"+NA$+"{reverse off}{white} ID#"+STR$(NA):SYS38215:QD$="DATE:"+STR$(MN)+"/"
8250 QD$=QD$+STR$(DA)+" TIME:"+I$+CHR$(13):FF$="{pound}msg"+STR$(CS)+STR$(CM)
8260 V1=SD(CS):OU$=CHR$(13):GOSUB120:GOSUB2480:IFPEEK(763)=1THEN4260
8270 TX$="Fixing...":GOSUB210:Z1(CM)=Z1(CM)+1:Z2(CM)=HN+1:GOSUB4150
8280 I=CM:HN=HN+1:A=Z1(CM):B=Z2(CM):GOSUB4180:GOTO4260
