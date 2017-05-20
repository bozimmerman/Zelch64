!--------------------------------------------------
!- Saturday, May 20, 2017 4:57:24 PM
!- Import of : 
!- c:\src\zelch64\prg.monster.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 PRINT"user update part I...";
8020 CLOSE2:PRINT#8,"i0":OPEN2,8,3,"{pound}log1":C=1:U1=1:U2=0
8030 A$="":I=0:GOSUB3:GET#2,A$:IFA$<>"{pound}"THENC=C-1:GOTO8050
8040 C=C+1:U2=INT(C/256):U1=C-(U2*256):PRINT".";:GOTO8030
8050 CLOSE2:PRINT:PRINT"{down*2}user update part II...";
8060 OPEN2,8,3,"{pound}log2":CT=0
8070 FORX=1TOC:U2=INT(X/256):U1=X-(U2*256)
8080 I=0:GOSUB3:FORY=0TO11:INPUT#2,TT$(Y):NEXTY:I1=VAL(TT$(1))
8090 I1=I1+1:TT$(1)=STR$(I1)
8100 IFI1>31THENZ1(CT)=X:Z2(CT)=I1:CT=CT+1
8110 PRINT".";:TT$(0)=" 0":I=0:GOSUB3:A$=""
8120 FORY=0TO11:A$=A$+TT$(Y)+CR$:NEXTY:PRINT#2,A$:A$=""
8140 NEXTX:CLOSE2:PRINT#8,"s0:{pound}delete!":IFCT=0THEN8200
8150 OPEN3,8,8,"{pound}delete!,s,w":FORI=0TOCT:PRINT#8," ID#"+STR$(Z1(I))
8160 PRINT#3,STR$(Z2(I))+" days missed":NEXTI:CLOSE3
8200 A=FRE(0):PRINT:PRINT"validating disk(s)...":FORI=8TO8+D0:PRINT#I,"v0":NEXT
8230 IFDD=0THENDA=DA+1:IFDA>DA(MN)THENMN=MN+1:DA=1:IFMN=13THENMN=1
8240 DD=0:POKE703,MN:POKE704,DA:POKE733,0:GOTO500
