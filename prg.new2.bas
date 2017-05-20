!--------------------------------------------------
!- Saturday, May 20, 2017 4:57:38 PM
!- Import of : 
!- c:\src\zelch64\prg.new2.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 OPEN3,8,8,"0:{pound}newqs,s,r":GET#3,A$:I=0
8020 SYS38230:I1$(I)=I$:GET#3,A$:IFST>0THEN8040
8030 IFI<9THENI=I+1:GOTO8020
8040 CLOSE3:FORX=0TOI:TX$="{f1}"+I1$(X)+"{ct c}":GOSUB5:GOSUB7:I2$(X)=I$
8050 NEXTX:TX$="{f1}IS{sh space}THIS{sh space}CORRECT?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN8040
8080 OPEN3,8,8,"0:{pound}newinfo,a":INPUT#8,E:IFE<20THEN8100
8090 CLOSE3:OPEN3,8,8,"0:{pound}newinfo,s,w":PRINT#3,"start"
8100 PRINT#3,CHR$(1):PRINT#3,"#"+STR$(ID)+"/"+NN$:FORX=0TOI
8110 PRINT#3,I1$(X)+I2$(X):NEXTX:CLOSE3:GOTO1145
