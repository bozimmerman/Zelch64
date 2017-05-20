!--------------------------------------------------
!- Saturday, May 20, 2017 2:17:18 PM
!- Import of : 
!- c:\src\zelch64\pgm.#2.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 TX$="{clear}       {pink}The Great Time Machine.":GOSUB210
8011 TX$="       {yellow}{cm t*23}":GOSUB210
8020 TX$="{down*2}Type (Y) for instructions or {reverse on}RETURN{reverse off}:{ct c}":GOSUB210
8030 GOSUB100:IFIN$="y"THENFI$="{pound}timeinst":NN=1:GOSUB1200:GOTO8050
8040 IFIN$<>CHR$(13)THEN8030
8050 TX$=CHR$(13)+"{down*2}{light green}  Press 'Y' to play:{ct c}":GOSUB210:GOSUB190:IFI$<>"y"THEN2120
8060 TX$="{light blue}Rolling the time wheel...":GOSUB210:A=INT(RND(TI)*5)
8070 FORI=0TO500:NEXT:T1=A:T2=0:GOSUB1700:TX$="{down*2}{purple}You have"+STR$(A*10)
8080 TX$=TX$+" minutes remaining!":GOSUB210:GOTO2120
