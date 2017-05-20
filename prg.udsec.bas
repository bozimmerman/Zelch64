!--------------------------------------------------
!- Saturday, May 20, 2017 4:12:51 PM
!- Import of : 
!- c:\src\zelch64\prg.udsec.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT:GOTO5166
8100 TX$="{clear}{down*2}{f1}BLKS {f1}FILENAME       {f1}FILETYPE":GOSUB210
8110 POKE253,64+CU:OPEN8,UV(CU),0,"$0:"+CHR$(64+CU)+"*":SYS38224:SYSZ,8:GOTO5170
8200 TX$="{f1}UD Sections:"
8210 FORI=0TOUD:IFAC>=UA(I)THENTX$="{f1}"+STR$(I+1)+"):"+UD$(I):GOSUB210
8220 NEXTI:GOTO5170
8300 TX$="{f1}New UD{white}:{ct c}":GOSUB210:GOSUB111:IFI=0ORI>UD+1THEN5170
8310 IFAC<UA(I-1)THEN5170
8320 CU=I-1:GOTO5166
8400 GOSUB6391:IFER=0THENFI$="^"+CHR$(64+CU)+I$:VD=UV(CU):GOSUB1200
8410 GOTO5170
8500 A$=CHR$(13):TX$=A$+A$+"{white}File Description":GOSUB210:S1=1
8510 FF$="^"+CHR$(64+CU)+MID$(FI$,2,LEN(FI$)-4)
8520 S0=1:V1=UV(CU):GOSUB2480:RETURN
