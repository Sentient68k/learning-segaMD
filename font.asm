	; Align 8 bytes
	nop 0,8

LoadFont:
; a0 - Font address (l)
; d0 - VRAM address	(w)
; d1 - Num chars (w)

	swap	d0	;Shift VRAM addr to upper word
	add.l 	#vdp_write_tiles, d0 	;VRAM write cmd + VRAM dest addr
	move.l 	d0, vdp_control		;Send address to VDP cmd port

	subq.b 	#$1, d1		; Num of chars -1
	@CharCopy:
	move.w 	#$07, d2 	; 8 longwords in tile
	@LongCopy:
	move.l 	(a0)+, vdp_data 	;Copy one line of tile to VDP data port
	dbra 	d2, @LongCopy
	dbra 	d1, @CharCopy

	rts
DrawTextPlaneA:
; a0 (l) - String Address
; d0 (w) - First tile ID of font
; d1 (bb) - XY coord (in tiles)
; d2 (b) - Palette

	clr.l 	d3		; Clear d3 ready to work with
	move.b 	d1, d3 	; Move Y pos (lower bytes of d1) to d3
	mulu.w 	#$0040, d3	; Multiply Y by line width (H40 mode, 64 lines horizontal) to get Y offset
	ror.l 	#$8, d1	; Shift X pos from upper to lower byte of d1
	add.b 	d1, d3	; Add X pos to offset
	mulu.w 	#$2, d3 ; Convert to words
	swap 	d3 		; Shift address to offset to upper word
	add.l 	#vdp_write_plane_a, d3 	; Add PlaneA write cmd + address
	move.l 	d3, vdp_control	; Send to VDP control port

	clr.l 	d3		; Clear d3 ready to work with again
	move.b 	d2, d3 	; Move palette ID (lower bytes of d2) to d3
	rol.l  	#$8, d3	; Shift palette ID bits 14 and 15 of d3
	rol.l 	#$5, d3	; Can only rol 8 bites in one instruction

	lea 	ASCIIMap, a1	; Load ASCIIMap address to a1

	@CharCopy:
	move.b 	(a0)+, d2 	; Move ASCII byte to lower byte of d2
	cmp.b 	#$0, d2		; Test if byte is zero (string terminator)
	beq.b 	@End 		; If zero, branch to End

	sub.b 	#ASCIIStart, d2	; Subtract first ASCII code to get table entry index
	move.b 	(a1, d2.w), d3 	; Move tile ID from table (index in lower word of d2) to lower byte of d3
	add.w 	d0, d3		; Offset title ID by first tile ID in front
	move.w 	d3, vdp_data 	; Move palette and pattern IDs to VDP data port
	jmp 	@CharCopy 		; Next character

	@End:
	rts