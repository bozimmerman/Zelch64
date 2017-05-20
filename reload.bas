!--------------------------------------------------
!- Friday, May 12, 2017 11:16:26 PM
!- Import of : 
!- c:\src\zelch64\bak\reload.prg
!- Commodore 128 BASIC 7/7.1
!--------------------------------------------------
8000 SYS51983
8010 TX$="{f1}{down*4}SYSTEM RELOAD UTILITY!":GOSUB5
8030 TX$="{f1}ENTER FILENAME:{ct c}":GOSUB5:GOSUB7:IFI$=""THEN2000
8040 TX$="{f1}CONTINUE (Y/N)?{ct c}":GOSUB5:C$="yn":GOSUB66:IFG=2THEN2000
8070 TX$="{f1}GOODBYE...":GOSUB5:CLOSE4:CLOSE8:CLOSE9:CLOSE10:CLOSE11
8080 GOSUB37:POKE702,16:GOSUB51:GOSUB37:CLOSE5:CLOSE15
8090 PRINT"{clear}{black}{down*2}clr:load"+CHR$(34)+I$+CHR$(34)+",8":PRINT"{home}{down*7}run:"
8095 FORI=631TO638:POKEI,13:NEXTI:POKE198,7:END
