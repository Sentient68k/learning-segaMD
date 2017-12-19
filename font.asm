LoadFont:
; a0 - Font address (l)
; d0 - VRAM address	(w)
; d1 - Num chars (w)

	swap	d0	;Shift VRAM addr to upper word
	add.l 	#vdp_write_tiles, d0 	;VRAM write cmd + VRAM dest addr
	move.l 	d0, vdp_control		;Send address to VDP cmd port

	subq.b 	#$1, d1		; Num of chars -1
@CharCopy:
	move.w 	$#07, d2 	; 8 longwords in tile
@LongCopy:
	move.l 	(a0)+, vdp_data 	;Copy one line of tile to VDP data port
	dbra 	d2, @LongCopy
	dbra 	d1, @CharCopy

	rts
	
PixelFont:	; Font start address
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000

* --------------------------
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$10100000
	dc.l	$10111110
	dc.l	$11000010
	dc.l	$01111110
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10001000
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10001000
	dc.l	$10111000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000

* --------------------------
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$10100010
	dc.l	$10111010
	dc.l	$11000010
	dc.l	$01111110
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$11101110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000

* --------------------------
	dc.l	$00001110
	dc.l	$00001010
	dc.l	$00001010
	dc.l	$11101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10110110
	dc.l	$10001100
	dc.l	$10110110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10010010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10011010
	dc.l	$10101010
	dc.l	$10110010
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10111100
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10110110
	dc.l	$11001010
	dc.l	$01111110
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10110110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$11000110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10101010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01010100
	dc.l	$01101100
	dc.l	$00111000
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10010010
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01101100
	dc.l	$11010110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01101100
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11110110
	dc.l	$01101100
	dc.l	$11011110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10110010
	dc.l	$10101010
	dc.l	$10011010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$00111100
	dc.l	$00100100
	dc.l	$00110100
	dc.l	$00010100
	dc.l	$00110110
	dc.l	$00100010
	dc.l	$00111110
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$11000110
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000

* --------------------------
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$00100110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000

* --------------------------
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$11111010
	dc.l	$00001010
	dc.l	$00001110
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000100
	dc.l	$10111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11111010
	dc.l	$00110110
	dc.l	$01101100
	dc.l	$01011000
	dc.l	$01110000
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000010
	dc.l	$01111010
	dc.l	$01000110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11000000
	dc.l	$11000000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000

* --------------------------
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11100110
	dc.l	$00111100
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000

* --------------------------
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000

* --------------------------
	dc.l	$01110000
	dc.l	$11010000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11010000
	dc.l	$01110000
	dc.l	$00000000

* --------------------------
	dc.l	$11100000
	dc.l	$10110000
	dc.l	$01010000
	dc.l	$01010000
	dc.l	$01010000
	dc.l	$10110000
	dc.l	$11100000
	dc.l	$00000000

* --------------------------
	dc.l	$11111000
	dc.l	$10101000
	dc.l	$10101000
	dc.l	$11111000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$01111100
	dc.l	$11010110
	dc.l	$10000010
	dc.l	$11010110
	dc.l	$10000010
	dc.l	$11010110
	dc.l	$01111100
	dc.l	$00000000

* --------------------------
	dc.l	$00111000
	dc.l	$00101000
	dc.l	$11101110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000

* --------------------------
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
	dc.l	$00001100
	dc.l	$00010100
	dc.l	$00101000
	dc.l	$01010000
	dc.l	$10100000
	dc.l	$11000000
	dc.l	$00000000
	dc.l	$00000000

* --------------------------
PixelFontEnd	;Font end address
PixelFontSizeB:	equ	(PixelFontEnd-PixelFont)	;Font size in bytes
PixelFontSizeW:	equ	(PixelFontSizeB/2)		;Font size in words
PixelFontSizeL:	equ	(PixelFontSizeB/2)		;Font size in longs
PixelFontSizeT:	equ	(PixelFontSizeB/32)		;Font size in tiles
PixelFontVRAM:	equ	$0100		;Dest address in VRAM 
PixelFontSizeTileID:	equ (PixelFontVRAM/32)		;ID of first tile