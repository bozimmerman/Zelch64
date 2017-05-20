!--------------------------------------------------
!- Saturday, May 20, 2017 4:37:23 PM
!- Import of : 
!- c:\src\zelch64\prg.mtedit.prg
!- Commodore 64
!--------------------------------------------------
8000 FORI=0TO9:POKE43+I,PEEK(721+I):NEXT:IFYY=1THEN8081
8005 TX$="{f1}W{f1}o{f1}r{f1}k{f1}i{f1}n{f1}g{f1}.{f1}.{f1}.{ct c}":GOSUB210:OPEN1,8,15,"s0:{pound}members"
8010 PRINT#1,"i0":OPEN8,8,8,"{pound}members,s,w":OPEN2,8,3,"0:{pound}log1":C1=1:C2=0
8020 PRINT#8,"{white}VALIDATED{sh space}LIST ("+STR$(MN)+"/"+STR$(DA)+")"
8030 I=0:GOSUB6:GET#2,A$:INPUT#1,E
8040 IFA$<>"{pound}"ORE>0THEN8080
8050 SYS38233:IFI$="EMPTY"THENI$="DELETED!"
8060 PRINT#8,"{white}"+STR$(C1+(256*C2))+"):"+I$+"{white}"
8070 TX$="{f1}.{ct c}":GOSUB210:C1=C1+1:IFC1=256THENC1=0:C2=C2+1
8075 GOTO 8030
8080 SYSZ,8:SYSZ,2:SYSZ,1:TX$=CHR$(13)+"{white}Done.":GOSUB210:GOTO3150
8081 CH=0:TX$="{pink}{reverse on}Month{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI=0ORI>12THEN3150
8082 MN=I:POKE703,MN:TX$="{yellow}{reverse on}Day{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI=0ORI>DA(MN)THEN3150
8083 DA=I:POKE704,DA:TX$="{white}{reverse on}Hour{reverse off}:{ct c}":GOSUB210:GOSUB111:IFI=0ORI>12THEN3150
8084 H1=I:TX$="{light green}{reverse on}Am or Pm{reverse off}:{white}{ct c}":GOSUB210:GOSUB190:CH=0:IFI$="p"THENCH=128
8085 IFH1=12ANDCH=128THENCH=0:GOTO8087
8086 IFH1=12ANDCH=0THENCH=128
8087 H3=INT(H1/10):H4=H3*10:H2=H1-H4:POKE56587,(16*H3)+H2+CH
8088 H1=0:TX$="{cyan}{reverse on}Minute{reverse off}:{white}{ct c}":GOSUB210:GOSUB111:IFI<60THENH1=I
8089 H3=INT(H1/10):H4=H3*10:H2=H1-H4:POKE56586,(16*H3)+H2:POKE56585,0
8090 POKE56584,0:GOTO3150
