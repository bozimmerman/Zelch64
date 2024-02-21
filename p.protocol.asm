* = $c000
; new punter protocol c1 by steve punter
kCHKIN = $FFC6          ; open channel for input
kCHKOUT = $FFC9         ; open channel for output
kCLRCHN = $FFCC         ; close input and output channels
kCHRIN = $FFCF          ; input character from channel
kCHROUT = $FFD2         ; output character to channel
kGETIN = $FFE4          ; get a character from keyboard queue
kREADST = $FFB7
kPLOT = $FFF0

; these are kernal registers which are platform dependent
RX_BUF_END         = $029b
TX_BUF_START       = $029d
KERNAL_RS232_SETUP = $EF7E
RS232_ENABL        = $02A1
IS_CMDR_KEY_DOWN   = $028d
KERNAL_NUM_PRINT   = $bdcd
KERNAL_DCD_REG     = $dd01
KERNAL_CUR_DEV     = $ba
ZP_RX_BUF_PTR      = $f7

; these are generally empty spots in ZP
ZP_JUNK_IDX = $62
ZP_POINTER  = $64
ZP_STAT_SYNO= $96

; these are internal use buffers and can all be moved
codebuf = $07e5        ; steve put this at $c800
bitpnt  = $c803
bitcnt  = $c804
bitpat  = $c805
timer1  = $c806
gbsave  = $c808        ; location to save good bad signal needed
bufcount= $c809        ; number of chrs to buffer into block
delay   = $c80b        ; delay for wait period
skpdelay= $c80c        ; delay skip counter
endflag = $c80d        ; flag to indicate last block
checka  = $c80e        ; save place for checksum (4)
checkb  = $c812        ; secondary checksum holding place (4)
bufpnt  = $c816        ; pointer to current buffer
recsize = $c817        ; size of received buffer
maxsize = $c818        ; maximum block size
blocknum= $c819        ; block number (2)
filetype= $c81b        ; file type (from basic)
stack   = $c81c        ; stack pointer at entry
dontdash= $c81d        ; flag to suppress dashes and colons
specmode= $c81e        ; flag to send special start code
blkctr  = $c81f
buffer  = $0518        ; buffer for block - sp had it at $c900

lastch  = $0200        ; last used character - basic line ed input buffer




StartLoc            lda #$00  ; $c000 - $c033 + $00
                    bit $03a9 ; $c003 - $c033 + $03
                    bit $06a9 ; $c006 - $c033 + $06
                    bit $09a9 ; $c009 - $c033 + $09
                    bit $0ca9 ; $c00c - $c033 + $00
                    bit $0fa9 ; $c00f - $c033 + $0f - Pre-Send Injection Point
                    nop       ; $c012
                    jmp Setup_Jump ; $c013
                    jmp RS232_Reset ; $c016
                    byte $00,$00,$00
Setup_Jump          sta ZP_JUNK_IDX ; LB of mantissa FPA -- basically junk
                    tsx 
                    stx stack ; store X in free ram here in C000?!
                    lda #<Entry_Accept
                    clc 
                    adc ZP_JUNK_IDX
                    sta Entry_Jump+1
                    lda #>Entry_Accept
                    adc #$00
                    sta Entry_Jump+2
Entry_Jump          jmp Entry_Accept

; ** TRUE base of the Jump table.  All the stuff above is nonsense.                    
Entry_Accept        jmp Accept_Ch           ; + $00 
Entry_Receive       jmp Punter_Receive      ; + $03
Entry_Transmit      jmp Punter_Transmit     ; + $06
Entry_RecType       jmp Punter_ReceiveType  ; + $09
Entry_TranType      jmp Punter_TransmitType ; + $0c
                    byte $00,$00,$00        ; + $0f
                    byte $00,$00,$00        ; + $12

Proto_Codes         byte $47, $4f, $4f      ; "goo"
                    byte $42, $41, $44      ; "bad"
                    byte $41, $43, $4b      ; "ack"
                    byte $53, $2f, $42      ; "s/b"
                    byte $53, $59, $4e      ; "syn"
;
; accept characters and check for codes
;
Accept_Ch           sta bitpat ;save required bit pattern
                    lda #$00
                    sta codebuf
                    sta codebuf+1
                    sta codebuf+2
Lc065               lda #$00
                    sta timer1   ;clear timer
                    sta timer1 + 1
Lc06d               jsr ExitCheck
                    jsr GetNum
                    lda ZP_STAT_SYNO
                    bne Lc0cf    ;if no chr, do timer check
                    lda codebuf+1
                    sta codebuf
                    lda codebuf+2
                    sta codebuf+1
                    lda lastch
                    sta codebuf+2
                    lda #$00
                    sta bitcnt  ;clear bit counter
                    lda #$01
                    sta bitpnt  ;initialize bit pointer
Lc093               lda bitpat  ;look at bit pattern
                    bit bitpnt  ;is bit set
                    beq Lc0b1
                    ldy bitcnt
                    ldx #$00
Lc0a0               lda codebuf,x
                    cmp Proto_Codes,y
                    bne Lc0b1
                    iny 
                    inx 
                    cpx #$03
                    bne Lc0a0
                    jmp Lc0c4
                    
Lc0b1               asl bitpnt  ;shift bit pointer
                    lda bitcnt
                    clc 
                    adc #$03
                    sta bitcnt
                    cmp #$0f
                    bne Lc093
                    jmp Lc065
                    
Lc0c4               lda #$ff
                    sta timer1
                    sta timer1 + 1
                    jmp Lc06d
                    
Lc0cf               inc timer1
                    bne Lc0d7
                    inc timer1 + 1
Lc0d7               lda timer1 + 1
                    ora timer1
                    beq Lc0f2
                    lda timer1
                    cmp #$07
                    lda timer1 + 1
                    cmp #$14
                    bcc Lc06d
                    lda #$01
                    sta ZP_STAT_SYNO
                    jmp DoDelay
                    
Lc0f2               lda #$00
                    sta ZP_STAT_SYNO
                    rts 
;
; get# for c64
;
                    nop  
GetNum              tya 
                    pha 
                    lda RX_BUF_END
                    cmp RX_BUF_END+1
                    beq Lc118
                    ldy RX_BUF_END+1
                    lda (ZP_RX_BUF_PTR),y
                    pha 
                    inc RX_BUF_END+1
                    lda #$00
                    sta ZP_STAT_SYNO
                    pla 
                    sta lastch
                    pla 
                    tay 
                    jmp Lc123
                    
Lc118               lda #$02
                    sta ZP_STAT_SYNO
                    lda #$00
                    sta lastch
                    pla 
                    tay 
Lc123               pha 
                    lda #$03
                    sta KERNAL_CUR_DEV
                    pla 
                    rts 

;
; send a code
;          

SendCode            ldx #$05
                    jsr kCHKOUT
                    ldx #$00
Lc131               lda Proto_Codes,y
                    jsr kCHROUT
                    iny 
                    inx 
                    cpx #$03
                    bne Lc131
                    jmp kCLRCHN

;
; do handshaking for reception end
;                
RcvHandshake        sta gbsave ;save good or bad signal as needed
                    lda #$00
                    sta delay  ;no delay
Lc148               lda #$02
                    sta ZP_JUNK_IDX
                    ldy gbsave
                    jsr SendCode ;send g/b signal
Lc152               lda #$04      ;allow "ack" signals
                    jsr Accept_Ch ;wait for code
                    lda ZP_STAT_SYNO
                    beq Lc162         ; if ok, send g/b signal again
                    dec ZP_JUNK_IDX
                    bne Lc152
                    jmp Lc148
                    
Lc162               ldy #$09          ; send "s/b" code
                    jsr SendCode
                    lda endflag
                    beq Lc171
                    lda gbsave
                    beq Lc190
Lc171               lda buffer+4
                    sta bufcount
                    sta recsize
                    jsr RecModemBlk   ; wait for block
                    lda ZP_STAT_SYNO
                    cmp #$01          ; check for good block
                    beq Lc18f
                    cmp #$02            ;check for blank input
                    beq Lc162
                    cmp #$04            ;check for loss of signal
                    beq Lc18f
                    cmp #$08            ;check for "ack" signal
                    beq Lc162
Lc18f               rts 
                    
Lc190               lda #$10            ;wait for "syn" signal
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO
                    bne Lc162           ;if not, send "s/b" again
                    lda #$0a
                    sta bufcount
Lc19e               ldy #$0c            ;send "syn" signal
                    jsr SendCode
                    lda #$08            ;wait for "s/b" signal
                    jsr Accept_Ch
                    lda ZP_STAT_SYNO
                    beq Lc1b1
                    dec bufcount
                    bne Lc19e
Lc1b1               rts 

;
; do handshaking for transmission end
;
                    
TranHandshake       lda #$01
                    sta delay      ; use delay
Lc1b7               lda specmode
                    beq Lc1c1
                    ldy #$00
                    jsr SendCode  ;send a "goo" signal
Lc1c1               lda #$0b      ;allow "goo", "bad", and "s/b"
                    jsr Accept_Ch ;wait for codes
                    lda ZP_STAT_SYNO
                    bne Lc1b7     ;if no signal, wait again
                    lda #$00
                    sta specmode   
                    lda bitcnt
                    cmp #$00      ;"good" signal
                    bne Lc20b     ;no, resend old block
                    lda endflag
                    bne Lc246
                    inc blocknum
                    bne Lc1e3
                    inc blocknum+1
Lc1e3               jsr SetBufPtr
                    ldy #$05       ;block number high order part
                    iny 
                    lda (ZP_POINTER),y
                    cmp #$ff
                    bne Lc205
                    lda #$01
                    sta endflag
                    lda bufpnt
                    eor #$01
                    sta bufpnt
                    jsr SetBufPtr
                    jsr DummyBlock1
                    jmp Lc208
                    
Lc205               jsr CreateTranBlock   ;yes, get new block
Lc208               lda #$2d
                    byte $2c
Lc20b               lda #$3a
                    jsr PrintProgress
                    ldy #$06
                    jsr SendCode     ;send "ack" code
                    lda #$08        ;allow only "s/b" code
                    jsr Accept_Ch    ;wait for code
                    lda ZP_STAT_SYNO   
                    bne Lc208
                    jsr SetBufPtr
                    ldy #$04        ;block size
                    lda (ZP_POINTER),y
                    sta bufcount
                    jsr SetBufPtrB
                    ldx #$05
                    jsr kCHKOUT
                    ldy #$00
Lc232               lda (ZP_POINTER),y   ;transmit alternate buffer
                    jsr kCHROUT
                    jsr UnkWait
                    iny 
                    cpy bufcount
                    bne Lc232
                    jsr kCLRCHN
                    lda #$00
                    rts 
                    
Lc246               lda #$2a
                    jsr PrintProgress
                    ldy #$06
                    jsr SendCode     ;send "ack" signal
                    lda #$08
                    jsr Accept_Ch    ;wait for "s/b" signal
                    lda ZP_STAT_SYNO
                    bne Lc246        ;if not, resend "ack" signal
                    lda #$0a
                    sta bufcount
Lc25e               ldy #$0c
                    jsr SendCode    ;send "syn" signal
                    lda #$10
                    jsr Accept_Ch    ;wait for "syn" signal back
                    lda ZP_STAT_SYNO
                    beq Lc271
                    dec bufcount
                    bne Lc25e
Lc271               lda #$03
                    sta bufcount
Lc276               ldy #$09
                    jsr SendCode     ;send "s/b" signal
                    lda #$00
                    jsr Accept_Ch    ;just wait
                    dec bufcount
                    bne Lc276
                    lda #$01
                    rts 

;receive a block from the modem
;
; stat returns with:
;
; bit 0 - buffered all characters successfully
; bit 1 - no characters received at all
; bit 2 - insufficient characters received
; bit 3 - "ack" signal received
                    
RecModemBlk         ldy #$00 ;start index
Lc28a               lda #$00 ;clear timers
                    sta timer1
                    sta timer1 + 1
Lc292               jsr ExitCheck
                    jsr GetNum       ;get a chr from the modem
                    lda ZP_STAT_SYNO
                    bne Lc2d8        ;no character received
                    lda lastch
                    sta buffer,y     ;save chr in buffer
                    cpy #$03         ;chr one of the first 3
                    bcs Lc2c2        ;no, skip code check
                    sta codebuf,y    ;save chr in code buffer
                    cpy #$02         ;on the 3rd chr
                    bne Lc2c2        ;no, don't look at chrs yet
                    lda codebuf      ;check for a "ack" signal
                    cmp #$c1
                    bne Lc2c2
                    lda codebuf+1
                    cmp #$c3
                    bne Lc2c2
                    lda codebuf+2
                    cmp #$cb         
                    beq Lc2cd         ;"ack" found
Lc2c2               iny               ;inc index
                    cpy bufcount        ;buffered all chrs
                    bne Lc28a        ;no, buffer next
                    lda #$01         ;yes, return bit 0 set
                    sta ZP_STAT_SYNO
                    rts 
                    
Lc2cd               lda #$ff          ;"syn" found, set timer to -1
                    sta timer1
                    sta timer1 + 1
                    jmp Lc292         ;see if there is another chr
                    
Lc2d8               inc timer1        ;inc timer
                    bne Lc2e0
                    inc timer1 + 1
Lc2e0               lda timer1
                    ora timer1 + 1     ;timer now at zero
                    beq Lc303          ;"syn" found with no following chrs
                    lda timer1
                    cmp #$06
                    lda timer1 + 1
                    cmp #$10            ;time out yet
                    bne Lc292            ;no, get next chr
                    lda #$02            ;yes, set bit 1
                    sta ZP_STAT_SYNO
                    cpy #$00
                    beq Lc300
                    lda #$04             ;but if chrs received, set bit 2
                    sta ZP_STAT_SYNO
Lc300               jmp DoDelay
                    
Lc303               lda #$08             ;"ack" found, set bit 2
                    sta ZP_STAT_SYNO
                    rts 
;
; create dummy block for transmission
;
                    
CreateTranBlock     lda bufpnt
                    eor #$01
                    sta bufpnt
                    jsr SetBufPtr     ;read block into "this" buffer
                    ldy #$05          ;block number
                    lda blocknum
                    clc 
                    adc #$01
                    sta (ZP_POINTER),y ;set block number low part
                    iny 
                    lda blocknum+1
                    adc #$00
                    sta (ZP_POINTER),y ;set block number high part
                    ldx #$02
                    jsr kCHKIN
                    ldy #$07            ;actual block
Lc32c               jsr kCHRIN
                    sta (ZP_POINTER),y
                    iny 
                    jsr kREADST
                    bne Lc341
                    cpy maxsize
                    bne Lc32c
                    tya 
                    pha 
                    jmp Lc34e
                    
Lc341               tya 
                    pha 
                    ldy #$05           ;block number
                    iny                 ;high part
                    lda #$ff
                    sta (ZP_POINTER),y
                    jmp Lc34e
                    
DummyBlock1         pha                ;save size of just read block
Lc34e               jsr kCLRCHN
                    jsr RS232_Reset
                    jsr BusyWait
                    jsr RS232_Reset
                    ldy #$04           ;block size
                    lda (ZP_POINTER),y
                    sta bufcount        ;set bufcount for checksum
                    jsr SetBufPtrB
                    pla 
                    ldy #$04            ;block size
                    sta (ZP_POINTER),y
                    jsr Checksum
                    rts
;
; set pointers for current buffer
;
                    
SetBufPtr           lda #<buffer
                    sta ZP_POINTER
                    lda bufpnt
                    clc 
                    adc #>buffer
                    sta ZP_POINTER+1
                    rts 
                    
;
; set pointer b for current buffer
;

SetBufPtrB          lda #<buffer
                    sta ZP_POINTER
                    lda bufpnt
                    eor #$01
                    clc 
                    adc #>buffer
                    sta ZP_POINTER+1
                    rts 

;
; calculate checksum
;                    

Checksum            lda #$00
                    sta checkb
                    sta checkb+1
                    sta checkb+2
                    sta checkb+3
                    ldy #$04
Lc399               lda checkb
                    clc 
                    adc (ZP_POINTER),y
                    sta checkb
                    bcc Lc3a7
                    inc checkb+1
Lc3a7               lda checkb+2
                    eor (ZP_POINTER),y
                    sta checkb+2
                    lda checkb+3
                    rol a            ;set or clear carry flag
                    rol checkb+2
                    rol checkb+3
                    iny 
                    cpy bufcount
                    bne Lc399
                    ldy #$00
                    lda checkb
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+1
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+2
                    sta (ZP_POINTER),y
                    iny 
                    lda checkb+3
                    sta (ZP_POINTER),y
                    rts
;
; transmit a program
;
Punter_Transmit     lda #$00
                    sta endflag
                    sta skpdelay
                    sta blkctr
                    sta blkctr+1
                    lda #$01
                    sta dontdash
                    sta bufpnt
                    lda #$ff
                    sta blocknum
                    sta blocknum+1
                    jsr SetBufPtrB
                    ldy #$04            ;block size
                    lda #$07
                    sta (ZP_POINTER),y
                    jsr SetBufPtr
                    ldy #$05            ;block number
                    lda #$00
                    sta (ZP_POINTER),y
                    iny 
                    sta (ZP_POINTER),y
Lc40c               jsr TranHandshake
                    beq Lc40c
Lc411               lda #$00
                    sta lastch
                    rts 

;
; receive a file
;                    
Punter_Receive      lda #$01
                    sta blocknum
                    lda #$00
                    sta blocknum+1
                    sta blkctr
                    sta blkctr+1
                    sta endflag
                    sta bufpnt
                    sta buffer+5    ;block number
                    sta buffer+6
                    sta skpdelay
                    lda #$07
                    sta buffer+4     ;block size
                    lda #$00
Lc43d               jsr RcvHandshake
                    lda endflag
                    bne Lc411
                    jsr CheckMatch    ;do checksums match
                    bne Lc486          ;no
                    jsr kCLRCHN
                    lda bufcount
                    cmp #$07
                    beq Lc46a
                    ldx #$02
                    jsr kCHKOUT
                    ldy #$07
Lc45b               lda buffer,y
                    jsr kCHROUT
                    iny 
                    cpy bufcount
                    bne Lc45b
                    jsr kCLRCHN
Lc46a               lda buffer+6    ;block number high order part
                    cmp #$ff
                    bne Lc479
                    lda #$01
                    sta endflag
                    lda #$2a
                    byte $2c ; BIT xxxx
Lc479               lda #$2d
                    jsr PrintProgress
                    jsr RS232_Reset
                    lda #$00
                    jmp Lc43d
                    
Lc486               jsr kCLRCHN
                    lda #$3a
                    jsr PrintProgress
                    lda recsize
                    sta buffer+4
                    lda #$03
                    jmp Lc43d

;
; see if checksums match
;
CheckMatch          lda buffer
                    sta checka
                    lda buffer+1
                    sta checka+1
                    lda buffer+2
                    sta checka+2
                    lda buffer+3
                    sta checka+3
                    jsr SetBufPtr
                    lda recsize
                    sta bufcount
                    jsr Checksum
                    lda buffer
                    cmp checka
                    bne Lc4e0
                    lda buffer+1
                    cmp checka+1
                    bne Lc4e0
                    lda buffer+2
                    cmp checka+2
                    bne Lc4e0
                    lda buffer+3
                    cmp checka+3
                    bne Lc4e0
                    lda #$00
                    rts 
                    
Lc4e0               lda #$01
                    rts 

;
; receive file type block
;
                    
Punter_ReceiveType  lda #$00
                    sta blocknum
                    sta blocknum+1
                    sta blkctr
                    sta blkctr+1
                    sta endflag
                    sta bufpnt
                    sta skpdelay
                    lda #$07        
                    clc 
                    adc #$01
                    sta buffer+4
                    lda #$00
Lc504               jsr RcvHandshake
                    lda endflag
                    bne Lc52c
                    jsr CheckMatch
                    bne Lc521
                    lda buffer+7
                    sta filetype
                    lda #$01
                    sta endflag
                    lda #$00
                    jmp Lc504
                    
Lc521               lda recsize
                    sta buffer+4
                    lda #$03
                    jmp Lc504
                    
Lc52c               lda #$00
                    sta lastch
                    rts 

;
; transmit file type
;                    
Punter_TransmitType lda #$00
                    sta endflag
                    sta skpdelay
                    lda #$01
                    sta bufpnt
                    sta dontdash
                    lda #$ff
                    sta blocknum
                    sta blocknum+1
                    jsr SetBufPtrB
                    ldy #$04           ;block size
                    lda #$07
                    clc 
                    adc #$01
                    sta (ZP_POINTER),y
                    jsr SetBufPtr
                    ldy #$05          ;block number
                    lda #$ff
                    sta (ZP_POINTER),y
                    iny 
                    sta (ZP_POINTER),y
                    ldy #$07
                    lda filetype
                    sta (ZP_POINTER),y
                    lda #$01
                    sta specmode
Lc56e               jsr TranHandshake
                    beq Lc56e
                    lda #$00
                    sta lastch
                    rts 
;
; do delay for timing
;
                    
DoDelay             inc skpdelay
                    lda skpdelay
                    cmp #$03
                    bcc Lc58f
                    lda #$00
                    sta skpdelay
                    lda delay
                    beq BusyWait
                    bne Lc5a0
Lc58f               lda delay
                    beq Lc5a0
                    
BusyWait            ldx #$00
Lc596               ldy #$00
Lc598               iny 
                    bne Lc598
                    inx 
                    cpx #$78
                    bne Lc596
Lc5a0               rts 

;
;print dash, colon, or star
;
PrintProgress       cmp #$aa
                    beq Lc5d4
                    cmp #$ba
                    bne Lc5b2
                    clc 
                    inc blkctr
                    bcc Lc5b2
                    inc blkctr+1
Lc5b2               clc 
                    ldx #$15
                    ldy #$06
                    jsr kPLOT
                    lda blocknum+1
                    ldx blocknum
                    jsr KERNAL_NUM_PRINT
                    ldx #$15
                    ldy #$14
                    clc 
                    jsr kPLOT
                    lda blkctr+1
                    ldx blkctr
                    jsr KERNAL_NUM_PRINT
Lc5d4               rts 

;
;reset rs232 port
;                    
RS232_Reset         jsr KERNAL_RS232_SETUP
                    lda RS232_ENABL
                    cmp #$80
                    beq RS232_Reset
                    cmp #$92
                    beq RS232_Reset
                    rts 
; 
; check for cmdr key, and dcd drop
;
ExitCheck           lda IS_CMDR_KEY_DOWN
                    cmp #$02
                    beq Lc5f4
                    lda KERNAL_DCD_REG
                    and #$10
                    cmp #$10
                    bne Lc5fb
Lc5f4               pla 
                    tsx 
                    cpx stack
                    bne Lc5f4
Lc5fb               lda #$01
                    sta lastch
                    rts 
                    
UnkWait             lda RS232_ENABL
                    and #$01
                    cmp #$01
                    beq UnkWait
                    rts 