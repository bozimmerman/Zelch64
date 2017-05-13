!--------------------------------------------------
!- Friday, May 12, 2017 11:15:04 PM
!- Import of : 
!- c:\src\zelch64\bak\prg.text.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8500 TX$="{clear}{f1}TEXT LIBRARY SUBSYSTEM"+CR$+CR$:GOSUB5
8510 FI$="@txt 0":VD=UL:GOSUB25
8520 TX$="{ct n}{f1}(D) DOWNLOAD{white}/{f1}(Q) QUIT"+CR$+"{f1}ENTER{sh space}FILE #{ct c}":GOSUB5
8525 GOSUB30:IFI$=""THEN8520
8530 IFI$="q"THEN2000
8540 IFI$="d"THEN9010
8560 FI$="@txt"+STR$(I):NN=1:VD=UL:GOSUB25
9000 GOTO8520
9010 TX$=CR$+CR$+"{f1}DOWNLOAD FILE #{ct c}":GOSUB5:GOSUB30:IFI$=""THEN8520
9020 TX$="{f1}SEARCHING...":GOSUB5:OPEN2,UL,2,"@txt"+STR$(I)+",s,r":GET#2,A$
9030 IFST>0THENTX$="{f1}NOT{sh space}FOUND!":GOSUB5:CLOSE2:GOTO8520
9040 CLOSE2:OPEN2,UL,2,"@txt"+STR$(I)+",s,r":FH=1:GOTO2930
