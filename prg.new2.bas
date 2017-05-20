!--------------------------------------------------
!- Saturday, May 20, 2017 2:44:46 PM
!- Import of : 
!- c:\src\zelch64\prg.new2.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 GOSUB5:OPEN8,8,8,"0:{pound}newqs,s,r":GET#8,B$:I=0
8020 SYS38230:NQ$(I)=I$:GET#8,B$:IFST>0THEN8030
8022 IFI<9THENI=I+1:GOTO8020
8030 SYSZ,8:SYSZ,1:FORX=0TOI:TX$="{f1}"+NQ$(X)+"{ct c}":GOSUB210:GOSUB190:NA$(X)=I$
8040 NEXTX:TX$="{f1}Is this all correct?{ct c}":GOSUB210
8050 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO8030
8060 IFIN$<>"y"THEN8050
8070 TX$="y":GOSUB210:GOSUB5:OPEN8,8,8,"0:{pound}newinfo,s,r":GET#8,I$
8075 IFST=0THENSYSZ,8:GOTO8090
8080 SYSZ,8:GOSUB5:OPEN8,8,8,"0:{pound}newinfo,s,w":PRINT#8,"start":SYSZ,8:GOSUB5
8090 OPEN8,8,8,"0:{pound}newinfo,a":PRINT#8,CHR$(1):PRINT#8,"#"+STR$(ID)+" ";
8100 PRINT#8,NN$:FORX=0TOI:PRINT#8,NQ$(X)+NA$(X):NEXTX:SYSZ,8:SYSZ,1
8110 GOTO990
