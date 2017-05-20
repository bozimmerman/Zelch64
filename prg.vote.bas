!--------------------------------------------------
!- Saturday, May 20, 2017 4:58:38 PM
!- Import of : 
!- c:\src\zelch64\prg.vote.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 TX$="{clear}{down}{f1}LOADING VOTE!{ct c}":GOSUB5:OPEN3,8,8,"0:{pound}vote,s,r":INPUT#8,E
8010 I1=0:I2=0:I1$="":IFE>0THENCLOSE3:GOTO2000
8020 INPUT#3,I1$,I2:FORI=0TOI2:INPUT#3,I1$(I),I2$(I):I1(I)=0:NEXTI:CLOSE3
8030 TX$=CR$+"{down*2}{f1}LOADING RESULTS!":GOSUB5:OPEN3,8,8,"0:{pound}vote box,s,r":INPUT#8,E
8040 IFE>0THENCLOSE3:GOTO2000
8050 INPUT#3,A$:IFSTTHENCLOSE3:GOTO8090
8060 INPUT#3,I:IFNA=ITHENI1=1
8070 INPUT#3,I:I1(I)=I1(I)+1:IFSTTHENCLOSE3:GOTO8090
8080 GOTO8060
8090 IFI1=1THEN8200
8100 Q$=CR$+"{f1}---------------------------------------":TX$="{clear}{down}{f1}TITLE:"+I1$:GOSUB5
8110 TX$=Q$:GOSUB5:FI$="{pound}question":GOSUB25:TX$=Q$:GOSUB5:FORI=0TOI2
8120 TX$="{f1}("+STR$(I+1)+") "+I1$(I):GOSUB5:NEXT:TX$=Q$:GOSUB5
8130 TX$="{f1}YOUR{sh space}VOTE:{ct c}":GOSUB5:
8140 GOSUB11:IFIN$=""THEN8140
8150 I=VAL(IN$):IFI=0THEN8140
8160 IFI>I2+1THEN8140
8170 I1(I-1)=I1(I-1)+1:TX$=IN$+CR$+"{f1}SAVING{sh space}YOUR{sh space}VOTE...":GOSUB5:I$="vote"
8180 E$=I$+"!":GOSUB9:OPEN3,8,8,"0:{pound}vote box,a":PRINT#3,NA:PRINT#3,I-1:CLOSE3
8200 TX$="{clear}{down*2}{f1}RESULTS!":GOSUB5:I3=0:FORI=0TOI2:I3=I3+I1(I):NEXT
8210 TX$="{down}{f1}OUT OF"+STR$(I3)+" VOTES...":GOSUB5:FORI=0TOI2
8220 TX$="{f1}"+STR$(I1(I))+"-"+I2$(I)+" ("+STR$(INT((I1(I)/I3)*100))+"% )":GOSUB5
8230 NEXT:TX$="{down}{f1}HIT{sh space}RETURN{ct c}":GOSUB5:GOSUB35:GOTO2000
