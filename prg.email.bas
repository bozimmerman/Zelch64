!--------------------------------------------------
!- Friday, May 12, 2017 11:13:10 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.email.prg
!- Commodore 64
!--------------------------------------------------
8000 SYS51983:GOTO2455
8010 TX$=CR$+"{f1}USER ID#{ct c}":GOSUB5:GOSUB30:I1=I:IFI=0THEN2460
8015 V=INT(I1/256):U=I1-(V*256):I=0:OPEN2,8,2,"0:{pound}log1":GOSUB3:A$="":GET#2,A$
8030 IFA$<>"{pound}"ORI1=NATHENCLOSE2:TX$="{pink}NOT FOUND!":GOSUB5:GOTO2460
8040 SYS38233:CLOSE2:IFI$="EMPTY"THEN8030
8045 IFMF=1THEN8060
8050 TX$="{f1}SEND MAIL TO "+I$+" (Y/N)?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN2460
8060 GOSUB75:QQ$=STR$(A)+CR$+"{f1}FROM:"+NA$+" ID#"+STR$(NA)
8070 SYS38215:QD$="{f1}ON:"+STR$(MN)+"/"+STR$(DA)+" AT:"+I$+"{white}"
8080 V1=MD:FF$="{pound}mail"+STR$(I1):GOSUB5000:IFMF=0THEN2460
8500 MF=0:TX$="{f1}SCANNING...":GOSUB5:OPEN2,MD,2,"0:{pound}mail"+STR$(NA)+",s,r"
8510 GET#2,A$:IFST>0ANDWH=0THENTX$="{f1}NO MAIL FOUND!":GOSUB5:CLOSE2:GOTO2460
8520 B=0:IFWH=0THEN8550
8530 SYS38218:GET#2,E$:IFASC(E$)=199THEN8640
8540 B=B+1:IFB<WHTHEN8530
8550 GET#2,A$:IFA$<>"#"ANDST=0THEN8550
8560 SYS38230:I1=VAL(I$):CLOSE2:OPEN2,MD,2,"{pound}mail"+STR$(NA)
8570 OU$="{clear}":GOSUB21:IFWH>0THENFORI=1TOWH:SYS38218:NEXTI:SYS38230
8575 SYS38230:IFVAL(I$)>VAL(LC$)THENTX$="{f1}NEW{sh space}LETTER:":GOSUB5
8580 SYS38212:IFPEEK(252)=1THENTX$="hit return{ct c}":GOSUB5:GOSUB35
8590 CLOSE2:TX$="{ct n}{f1}R)EPLY {f1}H)OLD {f1}A)GAIN {f1}D)ELETE:{ct c}":GOSUB5:C$="rhad":GOSUB66
8600 IFG=3THENOPEN2,MD,2,"0:{pound}mail"+STR$(NA)+",s,r":GOTO8570
8610 IFG=4THENWH=WH+1:GOTO8500
8615 IFG=2THENTX$="{f1}HOLDING...":GOSUB5:GOTO8700
8630 MF=1:GOTO8015
8640 CLOSE2:PRINT#MD,"s0:{pound}mail"+STR$(NA):PRINT#MD,"r0:{pound}mail"+STR$(NA)+"=0:{pound}mal"
8645 TX$="{f1}THAT'S ALL!":GOSUB5:GOTO2460
8700 OPEN3,MD,3,"0:{pound}mal,s,a":INPUT#MD,E:IFE<20THENPRINT#3,CHR$(1):GOTO8720
8710 CLOSE3:OPEN3,MD,3,"0:{pound}mal,s,w"
8720 CLOSE2:OPEN2,MD,2,"0:{pound}mail"+STR$(NA)+",s,r"
8725 IFWH>0THENFORI=1TOWH:SYS38218:NEXTI:SYS38230
8730 SYS38230:IFI$=CHR$(1)THEN8760
8740 IFPEEK(253)=1THENPRINT#3,I$:A=FRE(0):GOTO8760
8750 PRINT#3,I$:GOTO8730
8760 CLOSE3:CLOSE2:WH=WH+1:GOTO8500