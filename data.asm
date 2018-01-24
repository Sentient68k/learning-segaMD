; Binary data Assembly
Palettes:
	dc.w $0000 ; Colour 0 - Transparent
	dc.w $000E ; Colour 1 - Red
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

	dc.w $0000 ; Colour 0 - Transparent
	dc.w $00E0 ; Colour 1 - Green
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

	dc.w $0000 ; Colour 0 - Transparent
	dc.w $0E00 ; Colour 1 - Blue
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

	dc.w $0000 ; Colour 0 - Transparent
	dc.w $0EEE ; Colour 1 - White
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000
	dc.w $0000

	; Align 8 bytes
	nop 0,8

PixelFont: ; Font start address

	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000

	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000
	
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$10100000
	dc.l	$10111110
	dc.l	$11000010
	dc.l	$01111110
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10001000
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10001000
	dc.l	$10111000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$10100010
	dc.l	$10111010
	dc.l	$11000010
	dc.l	$01111110
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$11101110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	
	dc.l	$00001110
	dc.l	$00001010
	dc.l	$00001010
	dc.l	$11101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10110110
	dc.l	$10001100
	dc.l	$10110110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000

	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10010010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$10011010
	dc.l	$10101010
	dc.l	$10110010
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10111100
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10110110
	dc.l	$11001010
	dc.l	$01111110
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$10000110
	dc.l	$10110110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$01111110
	dc.l	$11000010
	dc.l	$10111110
	dc.l	$11000110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10101010
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01010100
	dc.l	$01101100
	dc.l	$00111000
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10101010
	dc.l	$10010010
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01101100
	dc.l	$11010110
	dc.l	$10111010
	dc.l	$11101110
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10111010
	dc.l	$11010110
	dc.l	$01101100
	dc.l	$00101000
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11110110
	dc.l	$01101100
	dc.l	$11011110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10110010
	dc.l	$10101010
	dc.l	$10011010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$01111000
	dc.l	$01001000
	dc.l	$01101000
	dc.l	$00101000
	dc.l	$01101100
	dc.l	$01000100
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$11000110
	dc.l	$10111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	
	dc.l	$11111100
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$00100110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000
	
	dc.l	$11101110
	dc.l	$10101010
	dc.l	$10111010
	dc.l	$10000010
	dc.l	$11111010
	dc.l	$00001010
	dc.l	$00001110
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$10111110
	dc.l	$10000110
	dc.l	$11111010
	dc.l	$10000110
	dc.l	$11111100
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000100
	dc.l	$10111100
	dc.l	$10000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11111010
	dc.l	$00110110
	dc.l	$01101100
	dc.l	$01011000
	dc.l	$01110000
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11000010
	dc.l	$01111010
	dc.l	$01000110
	dc.l	$01111100
	dc.l	$00000000

	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11000000
	dc.l	$11000000
	dc.l	$00000000
	
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000
	
	dc.l	$01111100
	dc.l	$11000110
	dc.l	$10111010
	dc.l	$11100110
	dc.l	$00111100
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000
	
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	
	dc.l	$01110000
	dc.l	$11010000
	dc.l	$10110000
	dc.l	$10100000
	dc.l	$10110000
	dc.l	$11010000
	dc.l	$01110000
	dc.l	$00000000
	
	dc.l	$11100000
	dc.l	$10110000
	dc.l	$11010000
	dc.l	$01010000
	dc.l	$11010000
	dc.l	$10110000
	dc.l	$11100000
	dc.l	$00000000
	
	dc.l	$11111000
	dc.l	$10101000
	dc.l	$10101000
	dc.l	$11111000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	
	dc.l	$00000000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$10100000
	dc.l	$11100000
	dc.l	$00000000
	dc.l	$00000000
	
	dc.l	$01111100
	dc.l	$11010110
	dc.l	$10000010
	dc.l	$11010110
	dc.l	$10000010
	dc.l	$11010110
	dc.l	$01111100
	dc.l	$00000000
	
	dc.l	$00111000
	dc.l	$00101000
	dc.l	$11101110
	dc.l	$10000010
	dc.l	$11101110
	dc.l	$00101000
	dc.l	$00111000
	dc.l	$00000000
	
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$11111110
	dc.l	$10000010
	dc.l	$11111110
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	
	dc.l	$00011100
	dc.l	$00110100
	dc.l	$01101100
	dc.l	$11011000
	dc.l	$10110000
	dc.l	$11100000
	dc.l	$00000000
	dc.l	$00000000

PixelFontEnd                                 ; Font end address
PixelFontSizeB: equ (PixelFontEnd-PixelFont) ; Font size in bytes
PixelFontSizeW: equ (PixelFontSizeB/2)       ; Font size in words
PixelFontSizeL: equ (PixelFontSizeB/4)       ; Font size in longs
PixelFontSizeT: equ (PixelFontSizeB/32)      ; Font size in tiles
PixelFontVRAM:  equ 0x0100                   ; Dest address in VRAM
PixelFontTileID: equ (PixelFontVRAM/32)      ; ID of first tile

ASCIIStart: equ $20 ; First ASCII code in table
ASCIIMap:
	dc.b $00	; SPACE (ASCII code $20)
	dc.b $28   ; ! Exclamation mark
	dc.b $2B   ; " Double quotes
	dc.b $2E   ; # Hash
	dc.b $00	; UNUSED
	dc.b $00	; UNUSED
	dc.b $00	; UNUSED
	dc.b $2C   ; ' Single quote
	dc.b $29   ; ( Open parenthesis
	dc.b $2A   ; ) Close parenthesis
	dc.b $00	; UNUSED
	dc.b $2F   ; + Plus
	dc.b $26   ; , Comma
	dc.b $30   ; - Minus
	dc.b $25   ; . Full stop
	dc.b $31   ; / Slash or divide
	dc.b $1B   ; 0 Zero
	dc.b $1C   ; 1 One
	dc.b $1D   ; 2 Two
	dc.b $1E   ; 3 Three
	dc.b $1F   ; 4 Four
	dc.b $20   ; 5 Five
	dc.b $21   ; 6 Six
	dc.b $22   ; 7 Seven
	dc.b $23   ; 8 Eight
	dc.b $24   ; 9 Nine
	dc.b $2D   ; : Colon
	dc.b $00	; UNUSED
	dc.b $00	; UNUSED
	dc.b $00	; UNUSED
	dc.b $00	; UNUSED
	dc.b $27   ; ? Question mark
	dc.b $00	; UNUSED
	dc.b $01	; A
	dc.b $02   ; B
	dc.b $03	; C
	dc.b $04   ; D
	dc.b $05	; E
	dc.b $06	; F
	dc.b $07	; G
	dc.b $08	; H
	dc.b $09	; I
	dc.b $0A	; J
	dc.b $0B	; K
	dc.b $0C	; L
	dc.b $0D	; M
	dc.b $0E	; N
	dc.b $0F	; O
	dc.b $10	; P
	dc.b $11	; Q
	dc.b $12	; R
	dc.b $13	; S
	dc.b $14	; T
	dc.b $15	; U
	dc.b $16	; V
	dc.b $17	; W
	dc.b $18	; X
	dc.b $19	; Y
	dc.b $1A	; Z (ASCII code $5A)