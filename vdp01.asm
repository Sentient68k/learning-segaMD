	include 'init.asm'
; ******************************************************************
; VDP stuff
; ******************************************************************
__main:
	move.w 	#$8F02, $00C00004								; Auto Increment by 2 bytes
	move.l 	#$40000003, $00C00004							; send VRAM write operation to VDP control address to let it know we are about to write data
	move.l	#$C0000003, $00C00004							; Setup VDP to write CRAM Address $0000
	lea		Palette, a0 									; Load address of Palette to a0
	move.l 	#$07, d0 										; 32 bytes of data (8 longs, -1 for counter) in Palette
	@Loop:
	move.l 	(a0)+, $00C00000								; Move data to VDP data port, Increment source address
	dbra 	d0, @Loop
	move.w 	#$8708, $00C00004								; Set bg color to Palette0, color 8
Palette:
	dc.w $0000 ; Colour 0 - Transparent
	dc.w $000E ; Colour 1 - Red
	dc.w $00E0 ; Colour 2 - Green
	dc.w $0E00 ; Colour 3 - Blue
	dc.w $0000 ; Colour 4 - Black
	dc.w $0EEE ; Colour 5 - White
	dc.w $00EE ; Colour 6 - Yellow
	dc.w $008E ; Colour 7 - Orange
	dc.w $0E0E ; Colour 8 - Pink
	dc.w $0808 ; Colour 9 - Purple
	dc.w $0444 ; Colour A - Dark grey
	dc.w $0888 ; Colour B - Light grey
	dc.w $0EE0 ; Colour C - Turquoise
	dc.w $000A ; Colour D - Maroon
	dc.w $0600 ; Colour E - Navy blue
	dc.w $0060 ; Colour F - Dark green
CharacterH:
	dc.l $11000110
	dc.l $11000110
	dc.l $11000110
	dc.l $11111110
	dc.l $11000110
	dc.l $11000110
	dc.l $11000110
	dc.l $00000000
__end    ; Very last line, end of ROM address