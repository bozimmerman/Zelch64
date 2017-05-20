!--------------------------------------------------
!- Saturday, May 20, 2017 4:36:52 PM
!- Import of : 
!- c:\src\zelch64\pgm.bagels.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT
8010 TX$="{clear}{down*3}{f1}BAGELS!":GOSUB210:TX$="{f1}{down}Rules:":GOSUB210
8020 TX$="The BBS will pick a 3 digit number":GOSUB210
8030 TX$="from 123-987. There will be no zeros":GOSUB210
8040 TX$="and no digits will repeat. After":GOSUB210:
8050 TX$="a guess, the computer will repond:":GOSUB210
8060 TX$="{f1}Pico - A right digit, wrong place":GOSUB210
8070 TX$="{f1}Ferma - A right digit, in right place":GOSUB210
8080 TX$="{f1}Bagles - All digits wrong.":GOSUB210
8085 TX$="{down*2} Q - Quits ANYTIME{sh space}while you play":GOSUB210
8090 TX$="{down*2}Ready to play?{ct c}":GOSUB210
8091 GOSUB100:IFIN$="n"THENTX$="n":GOSUB210:GOTO2120
8092 IFIN$<>"y"THEN8091
8093 TX$=IN$:GOSUB210
8094 I4=1:TX$="{f1}{down*2}Ok, I've thought up a number!":GOSUB210
8100 I1=INT(RND(TI)*9)+1
8111 I2=INT(RND(TI)*9)+1:IFI2=I1THEN8111
8112 I3=INT(RND(TI)*9)+1:IFI3=I2ORI3=I1THEN8112
8113 TX$=CHR$(13)+"{f1}Guess Number "+STR$(I4)+":{ct c}":GOSUB210:GOSUB111:TX$=""
8114 IFI$="q"THEN8500
8115 IFLEN(I$)<>3THENTX$="{f1}Number must be 3 digits!":GOSUB210:GOTO8113
8116 I9=0:I5=VAL(LEFT$(I$,1)):I7=VAL(RIGHT$(I$,1)):I6=VAL(MID$(I$,2,1))
8117 IFI5=0ORI6=0ORI7=0THENTX$="{f1}No zeros allowed in number!":GOSUB210:GOTO8113
8118 IFI5=I6ORI5=I7ORI6=I7THENTX$="{f1}Digits must be different!":GOSUB210:GOTO8113
8119 IFI5=I1ORI5=I2ORI5=I3ORI6=I1ORI6=I2ORI6=I3ORI7=I1ORI7=I2ORI7=I3THEN8121
8120 TX$="{f1}BAGELS!!":GOSUB210:I4=I4+1:GOTO8113
8121 IFI5=I1ANDI6=I2ANDI7=I3THEN8200
8122 IFI5=I1THENTX$="{f1}Ferma,":GOTO8130
8123 IFI5=I2ORI5=I3THENTX$="{f1}Pico,"
8130 IFI6=I2THENTX$=TX$+"{f1}Ferma,":GOTO8140
8131 IFI6=I1ORI6=I3THENTX$=TX$+"{f1}Pico,"
8140 IFI7=I3THENTX$=TX$+"{f1}Ferma":GOTO8150
8145 IFI7=I1ORI7=I2THENTX$=TX$+"{f1}Pico":GOTO8150
8147 TX$=LEFT$(TX$,LEN(TX$)-1)
8150 IFTX$=""THEN8120
8151 GOSUB210:I4=I4+1:GOTO8113
8200 TX$="{down*3}{f1}You GOT IT!!!!":GOSUB210
8210 TX$="{f1}You guess it in "+STR$(I4)+" Guesses":GOSUB210
8220 TX$="{down}{f1}Play Again?{ct c}":GOSUB210
8230 GOSUB100:IFIN$="n"THENTX$=IN$:GOSUB210:GOTO2120
8240 IFIN$<>"y"THEN8230
8250 TX$=IN$:GOSUB210:GOTO8094
8500 TX$="{f1}Quit!":GOSUB210:GOTO2120
