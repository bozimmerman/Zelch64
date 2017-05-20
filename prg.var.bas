!--------------------------------------------------
!- Saturday, May 20, 2017 2:18:20 PM
!- Import of : 
!- c:\src\zelch64\prg.var.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 TX$=CHR$(13)+"{pink}H)i Msg:"+STR$(PP):GOSUB210:TX$="{yellow}P)assword:{ct c}":GOSUB210
8010 TX$=PS$:POKE710,1:GOSUB210:TX$="{white}B)aud:"+P$(2):GOSUB210:TX$="{light green}Choice:{ct c}"
8011 GOSUB210:GOSUB190:IFI$="h"THEN8020
8012 IFI$="p"THEN8040
8013 IFI$="b"THEN8060
8014 IFI$=""THEN2120
8015 GOTO8005
8020 TX$="{pink}New Number (1-"+STR$(HN)+"):{ct c}":GOSUB210:GOSUB111:IFI<1ORI>HNTHEN8099
8030 PP=I:GOTO8005
8040 TX$="{yellow}New Pass:{white}{ct c}":GOSUB210:POKE710,1:GOSUB190:O$=I$:IFI$=""THEN8099
8041 TX$="{yellow}Verify:{white}{ct c}":GOSUB210:POKE710,1:GOSUB190:IFI$<>O$THEN8099
8042 PS$=I$:GOTO8005
8060 TX$="{white}New Baud:{ct c}":GOSUB210:GOSUB111:IFI<200ORI>500THEN8099
8070 P$(2)=RIGHT$(STR$(I),LEN(STR$(I))-1):GOTO8005
8099 TX$=CHR$(13)+"Entry unchanged":GOSUB210:GOTO8005
