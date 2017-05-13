!--------------------------------------------------
!- Friday, May 12, 2017 11:16:12 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.vote.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8005 TX$="{clear}{down}{f1}LOADING VOTE!{ct c}":GOSUB5:OPEN2,8,2,"0:{pound}vote,s,r":INPUT#8,E
8010 I1=0:I2=0:I1$="":IFE>0THENCLOSE2:GOTO2000
8020 INPUT#2,I1$,I2:FORI=0TOI2:INPUT#2,I1$(I),I2$(I):I1(I)=0:NEXTI:CLOSE2
8030 TX$=CR$+"{down*2}{f1}LOADING RESULTS!":GOSUB5:OPEN2,8,2,"0:{pound}vote box,s,r":INPUT#8,E
8040 IFE>0THENCLOSE2:GOTO2000
8050 INPUT#2,A$:IFSTTHENCLOSE2:GOTO8090
8060 INPUT#2,I:IFNA=ITHENI1=1
8070 INPUT#2,I:I1(I)=I1(I)+1:IFSTTHENCLOSE2:GOTO8090
8080 GOTO8060
8090 IFI1=1THEN8200
8100 Q$=CR$+"{f1}---------------------------------------":TX$="{clear}{down}{f1}TITLE:"+I1$
8110 GOSUB5:TX$=Q$:GOSUB5:FI$="{pound}question":GOSUB25:TX$=Q$:GOSUB5:FORI=0TOI2
8120 TX$="{f1}("+STR$(I+1)+") "+I1$(I):GOSUB5:NEXT:TX$=Q$:GOSUB5
8130 TX$="{f1}YOUR{sh space}VOTE:{ct c}":GOSUB5:
8140 GOSUB11:IFIN$=""THEN8140
8150 I=VAL(IN$):IFI=0THEN8140
8160 IFI>I2+1THEN8140
8170 I1(I-1)=I1(I-1)+1:TX$=IN$+CR$+"{f1}SAVING{sh space}YOUR{sh space}VOTE...":GOSUB5:I$="vote"
8180 E$=I$+"!":GOSUB9:OPEN2,8,2,"0:{pound}vote box,s,a":PRINT#2,NA:PRINT#2,I-1:CLOSE2
8200 TX$="{f1}{clear}{down}TITLE:"+I1$+CR$+"{down*2}{f1}RESULTS!":GOSUB5:I3=0:FORI=0TOI2:I3=I3+I1(I)
8210 NEXT:TX$="{down}{f1}OUT OF"+STR$(I3)+" VOTES...":GOSUB5:FORI=0TOI2
8215 A$=STR$(INT((I1(I)/I3)*100))+"%)":A$=" ("+RIGHT$(A$,LEN(A$)-1)
8220 TX$="{f1}"+STR$(I1(I))+A$+" - "+I2$(I):GOSUB5:NEXT
8230 TX$="{down}{f1}HIT{sh space}RETURN{ct c}":GOSUB5:GOSUB35:GOTO2000
