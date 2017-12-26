; ******************************************************************
; VDP stuff
; ******************************************************************
__main:
	move.w #$8F02, vdp_control	 ; Set autoincrement to 2 bytes

	; ************************************
	; Move palettes to CRAM
	; ************************************
	move.l #vdp_write_palettes, vdp_control ; Set up VDP to write to CRAM address $0000

	lea Palettes, a0  ; Load address of Palettes into a0
	move.l #$1F, d0  ; 128 bytes of data (4 palettes, 32 longwords, minus 1 for counter) in palettes

	@ColourLoop:
	move.l (a0)+, vdp_data ; Move data to VDP data port, and increment source address
	dbra d0, @ColourLoop

	; ************************************
	; Load font
	; ************************************
	lea		PixelFont, a0	   ; Move font address to a0
	move.l	#PixelFontVRAM, d0   ; Move VRAM dest address to d0
	move.l	#PixelFontSizeT, d1  ; Move number of characters (font size in tiles) to d1
	jsr		LoadFont			; Jump to subroutine
; Draw text
__draw:
	lea	   String1, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0501, d1		  ; XY (5, 1)
	move.l	#$0, d2			 ; Palette 0
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
	 
	lea	   String2, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0502, d1		  ; XY (5, 2)
	move.l	#$1, d2			 ; Palette 1
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
	 
	lea	   String3, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0503, d1		  ; XY (5, 3)
	move.l	#$2, d2			 ; Palette 2
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
	 
	lea	   String4, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0504, d1		  ; XY (5, 4)
	move.l	#$3, d2			 ; Palette 3
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
	 
	lea	   String5, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0106, d1		  ; XY (1, 6)
	move.l	#$3, d2			 ; Palette 3
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
	 
	lea	   String6, a0		  ; String address
	move.l	#PixelFontTileID, d0 ; First tile id
	move.w	#$0107, d1		  ; XY (1, 7)
	move.l	#$3, d2			 ; Palette 3
	jsr	   DrawTextPlaneA	   ; Call draw text subroutine
 
 	jmp __draw
  ; Text strings (zero terminated)
String1:
  dc.b "ABCDEFGHIJKLM",0
String2:
  dc.b "NOPQRSTUVWXYZ",0
String3:
  dc.b "0123456789",0
String4:
  dc.b ",.?!()""':#+-/",0
String5:
  dc.b "THE QUICK BROWN FOX JUMPS",0
String6:
  dc.b "OVER THE LAZY DOG",0