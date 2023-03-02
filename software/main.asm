!cpu 65816
!initmem $ea

; Memory Map
;
; 0000 0000 0000 0000 0000 0000 - 0000 0000 1111 1111 1111 1111 | 000000 00FFFF | Bank 0 (see below)
; 1111 0000 0000 0000 0000 0000 - 1111 0111 1111 1111 1111 1111 | F00000 F7FFFF | Extended RAM
;
; Bank0:
;
; 0000 0000 0000 0000 - 0000 0000 1111 1111 | 0000 - 00FF | Direct page
; 0000 0001 0000 0000 - 0000 0001 1111 1111 | 0100 - 01FF | Stack
; 0000 0010 0000 0000 - 0111 1111 0111 1111 | 0200 - 7F7F | General Purpose RAM
; 0111 1111 1000 0000 - 0111 1111 1111 1111 | 7F80 - 7FFF | I/O
; 1000 0000 0000 0000 - 1111 1111 1111 1111 | 8000 - FFFF | ROM
;
; I/O:
;
; 0111 1111 1000 0000 - 0111 1111 1000 1111 | 7F80 - 7F8F | I/O #0 | 65C22 VIA
; 0111 1111 1001 0000 - 0111 1111 1001 1111 | 7F90 - 7F9F | I/O #1 | 65C51 ACIA
; 0111 1111 1010 0000 - 0111 1111 1010 1111 | 7FA0 - 7FAF | I/O #2
; 0111 1111 1011 0000 - 0111 1111 1011 1111 | 7FB0 - 7FBF | I/O #3
; 0111 1111 1100 0000 - 0111 1111 1100 1111 | 7FC0 - 7FCF | I/O #4
; 0111 1111 1101 0000 - 0111 1111 1101 1111 | 7FD0 - 7FDF | I/O #5
; 0111 1111 1110 0000 - 0111 1111 1110 1111 | 7FE0 - 7FEF | I/O #6
; 0111 1111 1111 0000 - 0111 1111 1111 1111 | 7FF0 - 7FFF | I/O #7

!address START_OF_ROM = $8000

!address IO_0 = $7F80
!address IO_1 = $7F90
!address IO_2 = $7FA0
!address IO_3 = $7FB0
!address IO_4 = $7FC0
!address IO_5 = $7FD0
!address IO_6 = $7FE0
!address IO_7 = $7FF0

*=START_OF_ROM

!source "lib/macros.asm"

reset:
  ; initialize stack pointer to 01FF
  ldx #$ff
  txs

  ; put CPU in native mode
  ; this is diagnostic number 1: If the Emulation LED turns off,
  ; it means the board able to read the reset vector, and execute the first few instructions.
  clc
  xce

  ; Diagnostic number 2
  ; checksum ourselves

  ; set registers to 16 bits (Set bits m and x to 0 in CPU status register)
  rep # %00110000
  !rl
  !al

  ldx # $7FFE
  lda # 0

- clc
  adc START_OF_ROM, x
  dex
  dex
  bpl -

  cmp # 0
  bne checksum_fail

  ; ### Diagnostic 3: Test bank0 RAM

  ; load into X the address of the end of RAM
  ldx #$7f7f
  dex ; align to 16 bits

  ; store 16 bits of data at X and X+1 and verify we read the same thing
- txa
  sta address($0),X ; direct page indexed
  cmp address($0),X
  bne memtest_fail

  ; decrement address
  dex
  dex

  ; continue until X=0
  bne -

  ; ### Diagnostic 4: Test extended RAM

  ldy # $f0 ; store bank number F0 into Y

  ; set indexes to 8 bits
-- sep #%00010000
	!rs

  phy
  plb ; pull value into Data Bank Register, effectively changing bank for all data accesses

  ; set indexes to 16 bits
  rep #%00010000
	!rl

  ldx #$ffff
  dex ; align to 16 bits

   ; store 16 bits of data at X and X+1 and verify we read the same thing
- txa
  sta address($0000),X ; absolute indexed
  cmp address($0000),X
  bne highmemtest_fail

  ; decrement address
  dex
  dex

  ; continue until X=0
  bne -

  ; increment Y
  iny
  cpy #$F8
  bne --

  ; set registers to 8 bits (Set bits m and x to 1 in CPU status register)
  sep # %00110000
  !rs
  !as

  ; reset data bank register
  ldy #0
  phy
  plb

  jmp main

checksum_fail:

  ; set registers to 8 bits (Set bits m and x to 1 in CPU status register)
  sep # %00110000
  !rs
  !as

  ; alternate E on with E off to signify ROM checksum error (200ms period)
  sec ; carry is set, emulation is off before this loop, so we can just repeat XCE to get toggling
- +delay_large_ms 200
  xce
  jmp -

memtest_fail:

  ; set registers to 8 bits (Set bits m and x to 1 in CPU status register)
  sep # %00110000
  !rs
  !as

  ; alternate E on with E off to signify low RAM error (one short 200ms, one long 400ms)
  sec ; carry is set, emulation is off before this loop, so we can just repeat XCE to get toggling
- +delay_large_ms 400
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 400
  xce
  jmp -

highmemtest_fail:

  ; set registers to 8 bits (Set bits m and x to 1 in CPU status register)
  sep # %00110000
  !rs
  !as

  ; alternate E on with E off to signify extended RAM error (two short 200ms, one long 400ms)
  sec ; carry is set, emulation is off before this loop, so we can just repeat XCE to get toggling
- +delay_large_ms 400
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 200
  xce
  +delay_large_ms 400
  xce
  jmp -

main:
  ; initialize devices
  jsr via_init
  jsr lcd_init
  jsr acia_init

  ; print Hello, World to both terminal and LCD
  ldx # 0
- lda +, X
  beq ++
  phx
  jsr acia_and_lcd_putchar
  plx
  inx
  jmp -
+ !text "Hello, World!", 0
++

  ; Add new lines for terminal only
  lda # "\r"
  jsr acia_putchar
  lda # "\n"
  jsr acia_putchar

  ; in a loop, print all chars received from the terminal, back to the terminal and to the LCD
- jsr acia_getchar
  jsr acia_and_lcd_putchar
  jmp -

  ; shouldn't be reached
  stp

acia_and_lcd_putchar:
  pha
  jsr print_char
  pla
  jsr acia_putchar
  rts

!source "lib/via.asm"
!source "lib/lcd.asm"
!source "lib/acia.asm"

; zero sum word is the last word before vectors
; this is updated during the build process to make the checksum of the ROM equal to 0
*=$ffde
  !word $0000

*=$fffc
  !word reset
  !word $eaea
