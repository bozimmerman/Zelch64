!--------------------------------------------------
!- Saturday, May 20, 2017 2:17:24 PM
!- Import of : 
!- c:\src\zelch64\prg.menu.prg
!- Unknown Machine
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8020 FI$="{pound}pgmenu":NN=1:GOSUB1200:Q$=CHR$(13)
8030 TX$=Q$+"{pink}Option # or RETURN:{ct c}":GOSUB210:GOSUB111:IFI=0ORI>NP+1THEN2120
8040 I=I-1:IFFL(I)>ACTHEN2120
8050 I$="{pound}pgm.#"+RIGHT$(STR$(I+1),LEN(STR$(I+1))-1):GOTO88
