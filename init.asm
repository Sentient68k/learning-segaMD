; ******************************************************************
; Sega Megadrive ROM header
; ******************************************************************
	dc.l   $00FFE000      ; Initial stack pointer value
	dc.l   EntryPoint      ; Start of program
	dc.l   Exception      ; Bus error
	dc.l   Exception      ; Address error
	dc.l   Exception      ; Illegal instruction
	dc.l   Exception      ; Division by zero
	dc.l   Exception      ; CHK exception
	dc.l   Exception      ; TRAPV exception
	dc.l   Exception      ; Privilege violation
	dc.l   Exception      ; TRACE exception
	dc.l   Exception      ; Line-A emulator
	dc.l   Exception     ; Line-F emulator
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Spurious exception
	dc.l   Exception     ; IRQ level 1
	dc.l   Exception     ; IRQ level 2
	dc.l   Exception     ; IRQ level 3
	dc.l   HBlankInterrupt ; IRQ level 4 (horizontal retrace interrupt)
	dc.l   Exception     ; IRQ level 5
	dc.l   VBlankInterrupt ; IRQ level 6 (vertical retrace interrupt)
	dc.l   Exception     ; IRQ level 7
	dc.l   Exception     ; TRAP #00 exception
	dc.l   Exception     ; TRAP #01 exception
	dc.l   Exception     ; TRAP #02 exception
	dc.l   Exception     ; TRAP #03 exception
	dc.l   Exception     ; TRAP #04 exception
	dc.l   Exception     ; TRAP #05 exception
	dc.l   Exception     ; TRAP #06 exception
	dc.l   Exception     ; TRAP #07 exception
	dc.l   Exception     ; TRAP #08 exception
	dc.l   Exception     ; TRAP #09 exception
	dc.l   Exception     ; TRAP #10 exception
	dc.l   Exception     ; TRAP #11 exception
	dc.l   Exception     ; TRAP #12 exception
	dc.l   Exception     ; TRAP #13 exception
	dc.l   Exception     ; TRAP #14 exception
	dc.l   Exception     ; TRAP #15 exception
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.l   Exception     ; Unused (reserved)
	dc.b "SEGA GENESIS    "                                 ; Console name
	dc.b "(C)2017.DEC"                                 ; Copyrght holder and release date
	dc.b "MY TEST GAME	                                  " ; Domestic name
	dc.b "MY TEST GAME	                                  " ; International name
	dc.b "GM XXXXXXXX-XX"                                   ; Version number
	dc.w $0000                                             ; Checksum
	dc.b "J               "                                 ; I/O support
	dc.l $00000000                                         ; Start address of ROM
	dc.l __end                                             ; End address of ROM
	dc.l $00FF0000                                         ; Start address of RAM
	dc.l $00FFFFFF                                         ; End address of RAM
	dc.l $00000000                                         ; SRAM enabled
	dc.l $00000000                                         ; Unused
	dc.l $00000000                                         ; Start address of SRAM
	dc.l $00000000                                         ; End address of SRAM
	dc.l $00000000                                         ; Unused
	dc.l $00000000                                         ; Unused
	dc.b "                                        "         ; Notes (unused)
	dc.b "JUE             "                                 ; Country codes
EntryPoint:													; Entry point. Start program here.
	tst.w	$00A10008										; Test internal reset(?)
	bne		Palette											; Branch if not 0 to Main
	tst.w	$00A1000C										; Test reset button
	bne		Palette											; Branch if not 0 to Main
	move.l 	#$00000000, d0									; Place 0 into d0, prepped for RAM clear
	move.l 	#$00000000, a0 									; Start from address $0, clear backwards
	move.l 	#$00003FFF, d1 									; Clear 64k of longwords, -1 for 0 index loop to work
	@Clear:
	move.l 	d0, -(a0)										; Decrement address by 1 longword, before moving zero from d0 to it
	dbra	d1, @Clear 										; Decrement d0, repeat until empty
	@TMSS:
	move.b 	$00A10001, d0									; Move hardware version to d0
	andi.b 	#$0F, d0										; Version is in last 4 bits, so mask w/ 0F
	beq		@TMSS											; If version is 0, skip TMSS
	move.l 	#'SEGA', $00A14000								; Move "SEGA" to $A14000
Z80Init:
	move.w 	#$0100, $00A11100								; Request access to Z80 BUS w/ $0100 to $A11100
	move.w 	#$0100, $00A11200								; Hold Z80 in reset state w/ $0100 to $A11200
 	@Z80Wait:
	btst	#$0, $00A11100									; Test bit 0 of A11100 to check Z80 access
	bne		@Z80Wait										; If we don't have control, go back to wait
	move.l 	#Z80Data, a0 									; Load address of data into a0
	move.l 	#$00A00000, a1 									; Copy Z80 RAM address to a1
	move.l 	#$29, d0 										; 42 bytes of init data (-1 for counter)
	@Copy:
	move.b 	(a0)+, (a1)+									; Copy data, increment source/dest address
	dbra 	d0, @Copy
	move.w 	#$0000, $00A11200								; Release reset state
	move.w 	#$0000,	$00A11100								; Release bus control
PSGInit:
	move.l 	#PSGData, a0 									; Load address of PSG data into a0
	move.l 	#$03, d0										; 4 bytes of data
	@Copy:
	move.b 	(a0)+, $00C00011								; Copy data to PSG RAM
	dbra	d0, @Copy
VDPInit:
	move.l 	#VDPRegisters, a0 								; Load address of register table into a0
	move.l 	#$18, d0 										; 24 registers to write
	move.l 	#$00008000, d1									; 'Set reg 0' command (and clear the rest of d1)
	@Copy:
	move.b 	(a0)+, d1										; Move reg value to lower byte of d1
	move.w 	d1, $00C00004									; Write command and value to VDP control port
	add.w 	#$0100, d1 										; Increment reg number
	dbra 	d0, @Copy
ControllerInit:
	; Set I/O Direction to INPUT, interrupts off, on all ports
	move.b 	#$00, $00A10009									; Controller port 1 CTRL
	move.b 	#$00, $00A1000B									; Controller port 2 CTRL
	move.b 	#$00, $00A1000D									; EXP port CTRL
CleanupInit:
	move.l 	#00000000, a0 									; Move 0 to a0
	movem.l (a0), d0-d7/a1-a7								; Multimove 0 to all regs
	; Init status register (no trace, A7 is Interrupt Stack Pointer, no interrupts, clear condition code bits)
	move 	#$2700, sr
HBlankInterrupt:
VBlankInterrupt:
   rte   ; Return from Exception
Exception:
   rte   ; Return from Exception
Main:
	jmp 	__main											; Jump to the game code
Z80Data:
	dc.w $af01
	dc.w $d91f
	dc.w $1127
	dc.w $0021
	dc.w $2600
	dc.w $f977
	dc.w $edb0
	dc.w $dde1
	dc.w $fde1
	dc.w $ed47
	dc.w $ed4f
	dc.w $d1e1
	dc.w $f108
	dc.w $d9c1
	dc.w $d1e1
	dc.w $f1f9
	dc.w $f3ed
	dc.w $5636
	dc.w $e9e9
	dc.w $8104
	dc.w $8f01
PSGData:
	dc.w $9FBF, $DFFF
VDPRegisters:
	dc.b $20 ; 0: Horiz. interrupt on, plus bit 2 (unknown, but docs say it needs to be on)
	dc.b $74 ; 1: Vert. interrupt on, display on, DMA on, V28 mode (28 cells vertically), + bit 2
	dc.b $30 ; 2: Pattern table for Scroll Plane A at $C000 (bits 3-5)
	dc.b $40 ; 3: Pattern table for Window Plane at $10000 (bits 1-5)
	dc.b $05 ; 4: Pattern table for Scroll Plane B at $A000 (bits 0-2)
	dc.b $70 ; 5: Sprite table at $E000 (bits 0-6)
	dc.b $00 ; 6: Unused
	dc.b $00 ; 7: Background colour - bits 0-3 = colour, bits 4-5 = palette
	dc.b $00 ; 8: Unused
	dc.b $00 ; 9: Unused
	dc.b $00 ; 10: Frequency of Horiz. interrupt in Rasters (number of lines travelled by the beam)
	dc.b $08 ; 11: External interrupts on, V/H scrolling on
	dc.b $81 ; 12: Shadows and highlights off, interlace off, H40 mode (40 cells horizontally)
	dc.b $34 ; 13: Horiz. scroll table at $D000 (bits 0-5)
	dc.b $00 ; 14: Unused
	dc.b $00 ; 15: Autoincrement off
	dc.b $01 ; 16: Vert. scroll 32, Horiz. scroll 64
	dc.b $00 ; 17: Window Plane X pos 0 left (pos in bits 0-4, left/right in bit 7)
	dc.b $00 ; 18: Window Plane Y pos 0 up (pos in bits 0-4, up/down in bit 7)
	dc.b $00 ; 19: DMA length lo byte
	dc.b $00 ; 20: DMA length hi byte
	dc.b $00 ; 21: DMA source address lo byte
	dc.b $00 ; 22: DMA source address mid byte
	dc.b $00 ; 23: DMA source address hi byte, memory-to-VRAM mode (bits 6-7)