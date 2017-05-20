!--------------------------------------------------
!- Saturday, May 20, 2017 4:38:28 PM
!- Import of : 
!- c:\src\zelch64\prg.var.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8005 TX$=CHR$(13)+"{f1}H)i Msg:"+STR$(PP):GOSUB210:TX$="{f1}P)assword:{ct c}":GOSUB210
8010 TX$=PS$:POKE710,1:GOSUB210:TX$="{f1}B)aud:"+P$(2):GOSUB210:TX$="{f1}Choice:{ct c}"
8011 GOSUB210:GOSUB190:IFI$="h"THEN8020
8012 IFI$="p"THEN8040
8013 IFI$="b"THEN8060
8014 IFI$=""THEN2120
8015 GOTO8005
8020 TX$="{f1}New Number (1-"+STR$(HN)+"):{ct c}":GOSUB210:GOSUB111:IFI<1ORI>HNTHEN8099
8030 PP=I:GOTO8005
8040 TX$="{f1}New Pass:{white}{ct c}":GOSUB210:POKE710,1:GOSUB190:O$=I$:IFI$=""THEN8099
8041 TX$="{f1}Verify:{white}{ct c}":GOSUB210:POKE710,1:GOSUB190:IFI$<>O$THEN8099
8042 C2=INT(NA/256):C3=C2*256:C1=NA-C3
8043 PS$=I$:TX$="{f1}SAVING...":GOSUB210:GOSUB1350:GOTO8005
8060 TX$="{f1}New Baud:{ct c}":GOSUB210:GOSUB111:IFI<200ORI>500THEN8099
8070 P$(2)=RIGHT$(STR$(I),LEN(STR$(I))-1):GOTO8005
8099 TX$=CHR$(13)+"{f1}Entry unchanged":GOSUB210:GOTO8005
