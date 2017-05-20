!--------------------------------------------------
!- Saturday, May 20, 2017 4:38:38 PM
!- Import of : 
!- c:\src\zelch64\prg.vote.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 TX$="{clear}{down}{pink}Loading Vote!":GOSUB210:OPEN1,8,15:OPEN8,8,8,"0:{pound}vote,s,r"
8010 INPUT#1,E1:I1=0:I2=0:I1$="":IFE1>0THENSYSZ,1:SYSZ,8:GOTO2120
8020 INPUT#8,I1$:INPUT#8,I2:FORI=0TOI2:INPUT#8,I1$(I):INPUT#8,I2$(I):I1(I)=0
8030 NEXTI:SYSZ,8:TX$="{down*2}{yellow}Loading Results!":GOSUB210:OPEN8,8,8,"0:{pound}vote box,s,r"
8040 INPUT#1,E1:IFE1>0THENSYSZ,8:SYSZ,1:GOTO2120
8050 INPUT#8,A$:IFST AND 64THENSYSZ,1:SYSZ,8:GOTO8130
8100 INPUT#8,I:IFNA=ITHENI1=1
8110 INPUT#8,I:I1(I)=I1(I)+1:IFST AND64THENSYSZ,1:SYSZ,8:GOTO8130
8120 GOTO8100
8130 IFI1=1THEN8230
8140 Q$=CHR$(13)+"{f1}--------------------------------------"
8145 TX$="{clear}{down}{f1}Title:"+I1$:GOSUB210:TX$=Q$:GOSUB210
8150 FI$="{pound}question":GOSUB1200:TX$=Q$:GOSUB210
8160 FORI=0TOI2:TX$="{f1}"+STR$(I+1)+")"+I1$(I):GOSUB210:NEXT
8170 TX$=Q$:GOSUB210:TX$="{f1}Your Choice:{ct c}":GOSUB210
8180 GOSUB100:IFIN$=""THEN8180
8190 I=VAL(IN$):IFI=0THEN8180
8200 IFI>I2+1THEN8180
8210 I1(I-1)=I1(I-1)+1:TX$="{f1}Saving your vote...":GOSUB210:E$="vote":E$=E$
8220 GOSUB12:OPEN8,8,8,"0:{pound}vote box,a":PRINT#8,NA:PRINT#8,I-1:SYSZ,8
8230 TX$="{light blue}{clear}{down*2}{f1}Results!":GOSUB210:O=0:FORI=0TOI2:O=O+I1(I):NEXT
8240 TX$="{light green}{down}{f1}Out of"+STR$(O)+" votes...":GOSUB210:FORI=0TOI2
8245 TX$="{f1}"+STR$(I1(I))+"-"+I2$(I)+" ("+STR$(INT((I1(I)/O)*100))+"% )":GOSUB210
8250 NEXTI:TX$="{down}{f1}Hit RETURN{ct c}":GOSUB210
8260 GOSUB100:IFIN$<>CHR$(13)THEN8260
8270 GOTO2120
