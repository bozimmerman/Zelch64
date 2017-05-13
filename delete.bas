!--------------------------------------------------
!- Friday, May 12, 2017 11:20:37 PM
!- Import of : 
!- c:\src\zelch64\bak\delete.prg
!- Commodore 64
!--------------------------------------------------
8000 SYS51983
8010 TX$="{f1}ENTER ID #{ct c}":GOSUB5:GOSUB30:IFI=0THEN2000
8020 V=INT(I/256):U=I-(V*256):PRINT#8,"i0":OPEN2,8,2,"0:{pound}log1"
8030 I=0:GOSUB3:GET#2,A$:INPUT#8,E:IFA$<>"{pound}"ORE>0THENCLOSE2:GOTO2000
8040 INPUT#2,I$:CLOSE2:TX$=I$+" (Y/N)?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN2000
8050 TX$="{f1}WIPEOUT...":GOSUB5:OPEN2,8,2,"0:{pound}log1"
8060 I=0:GOSUB3:PRINT#2,"{pound}EMPTY"+CR$+" "+CR$+" "+CR$+" "+CR$+"{green}{yellow}{blue}{yellow}{blue}{yellow}":CLOSE2
8070 OPEN2,8,2,"0:{pound}log2":I=0:GOSUB3:A$="":FORI=0TO11:A$=A$+"0"+CR$:NEXTI
8080 PRINT#2,A$:CLOSE2:PRINT#MD,"s0:{pound}mail"+STR$(II):GOTO8010
