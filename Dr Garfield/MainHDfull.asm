//****************************************
// Rom info
//****************************************
arch nes.cpu			// set processor architecture (NES)
header					// rom has a header		

//Notes.. I did not define RAM values what could help getting a better overview..
//$67 Current Frame Dog
//$7c Current Frame Garfield
//$4b X offset Pills
//$309 Gameover?
//$317 NewPill trigger
//$389 Gamestate? 	00 Play First Bitcheck? Win Lose
//$46 Gamestate 07=lose
//$7b Garfield FrameID offset. Add to current state to get right frame ID
//848d Crowns $2c=crown (Nametable possition would need to be moved to not draw over Garfield)

//New
//700 OdieFrameTable
//701 ?? I reserved it for animation things
//702-704	Odie xyPos
//705	Menu Logic Lasagne
//706	Menu Logic Monday
//707	Flag for Palette to load
//708  	Musik delay
//709-70a 	AnimOdieMaingame
//70b-70c			TitleScreen

banksize $4000			// set the size of each bank.

bank 0;
//---------------------------- Multiple Hijacks and stuff ----------------------------------------------//
org $86d6				//Drive CHR swapping
	LDA $43     		//Framecounter             
	AND #$08            // Take nipple 4 Drop the others
	LSR	               	// Shift it so it will alternat between 0 1
	LSR                    
	LSR                    
	JSR $9F63           //Jump Register Routine. 	//9f3b,9f4f=BG tiles?,9f63,9f77 Routines ??
	RTS                      						//9fff,bfff,dfff,fff0 Registers

org $9131				//Wait on Titlescreen till you press start.
	LDA $F5                  
	CMP #$10                 
	BEQ StartMenuSceen               
	JSR TitleScreen                
	JMP $9131
StartMenuSceen:	
	JMP $C114                
	

org $9238
cmp #$00				//Difficulty setting 01 enabled
org $9256
lda #$01

org $9100				//Initial bankswap title 
lda #$05
jsr $9f63


org $8010
jsr BGcolor				//Hijack


org $86c3				//Drawing Sprite Garfield
	LDA #$C0                 
	STA $44                  
	LDA #$4B                 
	STA $45                  
	LDA $7B                  
	JSR NewAnimationsGarfield		//Hijack and try to branch based on current frame.         
	STA $53                  
	JSR $8603                
	RTS                      

org $86fc				//Drawing Sprite Dog hijack
	jsr NewAnimationsDog

org $8716				//Nurse Sprite
	LDA #$16                 
	STA $53                  
	JSR NurseWin		//Hijack           
	RTS                      

	
org $96e1				//Pill assembly


org $90e6				//AddOdie to PauseScreen
	jsr PauseScreen

org $928e
	jsr MenuScreen		//Hijack

org $9140				//Menue Screen CHR Bank load
	lda #$03

//----------------------------Expanding SpriteTableNames ----------------------------------------------//

org $8603				//For the most part this is the orginal routine. Just need it to update from wordtable to load the right sprites.
	CLC                      
	LDA $53 			//Load Sprite ID
	ROL                    
	TAX                      
	LDA SpriteTableNames,x		//LadeAssemblyPointer   ($9A28)      
	STA $47                  
	INX                      
	LDA SpriteTableNames,x              
	STA $48                  
	LDX $42                  
	LDY #$00                 
	LDA ($47),y     	//Check if Garfield needs to throw a pill and fix frame         
	CMP #$FF                 
	BEQ end				//End if $FF             
	CLC                      
	ADC $45                  
	STA $0200,x              
	INX                      
	INY                      
	LDA ($47),y              
	STA $0200,x             
	INX                      
	INY                      
	LDA ($47),y              
	STA $0200,x              
	INX                      
	INY                      
	LDA ($47),y              
	CLC                      
	ADC $44                  
	STA $0200,x              
	INX                      
	INY                      
	LDA #$04                 
	CLC                      
	ADC $42                  
	STA $42                  
	JMP $8617   	
end:
	RTS                      


//org $9A28			//Orginal location Nametable for Sprites. For more Spites this is extanded at free space.
//SpriteTableNames:
//dw paws,p1,p2,p3,p4,p5,p6,p7,p8,p9,GarfieldHandUp,GarfieldHandForward,GarfieldNeutral,pd,pe,pf,Dog,DogSniz1,DogSniz2,Nurse		//This is not named properly but I am sure it gives the right idea.

org $9866			//Location Orginal Palette
Palette2:




//---------------------------- SpriteAssembly Orginal Location ----------------------------------------------//
org $9a50
paws:
db $00,$19,$00,$00,$00,$0A,$00,$08,$00,$20,$00,$10,$00,$1C,$00,$18,$00,$38,$02,$24,$FF
org $9a65
p1:
org $9a6e
p2:			//off
org $9a7b
p3:			//color
org $9a90
p4:			//on
org $9a9d
p5:			//two
org $9aaa
p6:			//atack
org $9abf
p7:			//OdieDog
org $9ae4
p8:
org $9b09
p9:			//Arrow Right 
org $9b0e
GarfieldHandUp:			//$0a Garfield
org $9b4b
GarfieldHandForward:	//$0b
org $9b8c
//GarfieldNeutral:		//0c
org $9bc5
pd:						//hard 	0d
db $00,$11,$03,$00,$01,$0A,$03,$08,$02,$1B,$03,$10,$03,$0D,$03,$18,$FF
org $9bd6
//pe:					//garf. 	0f
org $9beb
pf:						//nerm		10
db $00,$17,$02,$00,$01,$0E,$02,$08,$02,$1B,$02,$10,$04,$16,$02,$18,$FF
org $9bfc
Dog:		//$10 Dog
org $9c2d
DogSniz1:	//$11	
org $9c5e	
DogSniz2:	//$12
org $9c8f	
//Nurse:		//$13 Nurse
NewNurse1:
db $00,$95,$01,$00,$00,$96,$01,$08,$08,$A4,$01,$F8,$08,$A5,$01,$00,$08,$A6,$01,$08,$10,$B4,$01,$F8,$10,$B5,$01,$00,$10,$B6,$01,$08,$18,$C4,$01,$F8,$18,$C5,$01,$00,$18,$C6,$01,$08,$20,$D5,$01,$00,$20,$D6,$01,$08,$28,$E5,$01,$00,$28,$E6,$01,$08,$30,$F5,$01,$00,$30,$F6,$01,$08,$FF

// Tilemapping Stuff	//------------------------------------
org $a9c6
db $f6				//Tile for Garfield sprite orginal f6. FF case issue?

org $a9bc			//Fix Tile at the startup of the screen (f7)
db $ff

org $a583			//This needs to be a sprite not tilemapping?!
db $ff,$ff
org $a5c9			//This needs to be a sprite not tilemapping?!
db $ff,$ff
org $a4c9			//Title Menu
db $15,$0A,$1C,$0A,$10,$17,$0A,$FF,$16,$0E,$17,$1E

org $a577			//Lasagne LvL(150A1C0A10170AFF151F15)
db $16,$1E,$1C,$12,$0C,$ff,$1c,$19,$0e,$0e,$0d,$ff
org $a5bd			//Monday LvL(1618170D0A22FF151F15)
db $16,$1E,$1C,$12,$0C,$ff,$ff,$ff,$ff,$ff,$ff,$ff




//--------------------------------------FreeSpace------------------------------------------------------//

org $BEA0			//Free Space till $bffd?

bank 1;
base $c000			//---------------------------- NMI/IRQ/Reset Bank ----------------------------------//

org $c103			//TitleSceen CHR bank Select
	LDX #$00                 
TableLoad:	
	LDA $C000,x           
	STA $0200,x
	INX                      
	BNE TableLoad               
	LDA #$05                 
	JSR TitleScreenCHR 	//Hijack     
	RTS                      

//----------------------------------- Musik Routines -----------------------------------------//
org $e1d8			//Routines.. about Music
	LDA #$0F                 
	STA $4015    	//ApuStatus_   
	LDA #$55                 
	STA $EB                  
	JSR $E244                
	RTS                      
What1:	     
	INC $0682                
	JSR $E271                
	STA $0683                
	RTS                      

WhatIsThis:
	LDA $0682                
	BEQ What1               
	LDA $0683                
	CMP #$12                 
	BEQ WhatEnd            
	AND #$03                 
	CMP #$03                 
	BNE What2                
	INC $068B                
	LDY #$10                 
	LDA $068B                
	AND #$01                 
	BNE What3                
	LDY #$0C                 
What3:
	JSR $E04B                
What2:
	INC $0683                
WhatEnd:
	RTS                      
					//Routines for Music Start
	LDA #$C0                 
	STA $4017  		//Ctrl2_FrameCtr_
	LDA $068D                
	CMP #$05                 
	BEQ WhatIsThis                
	LDA #$00                 
	STA $0682                
	STA $068B                
	JSR $E194                
	JSR $E1B9                
	JSR $E19C                
	JSR $E1AC                
	JSR SlowMusik  	//Musik Engine JSR $E583             
	LDA #$00                 
	LDX #$06                 
What4:	
	STA $06EF,x             
	DEX                      
	BNE What4               
	RTS                      

org $c120			//Free Space till $DffD? 	//-------------------------------------- FreeSpace ---------------// 

//-------------------------------------- Expanded word table and SpriteAssembly ----------------------------------//



SpriteTableNames:		//Here you add the pointer for the sprite assembly
dw paws,p1,p2,p3,p4,p5,p6,p7,p8,p9,GarfieldHandUp,GarfieldHandForward,GarfieldNeutral,pd,pe,pf,Dog,DogSniz1,DogSniz2,Nurse	//This is not named properly but I am sure it gives the right idea.
dw HappyDog,HappyDogTwo,NewNurse1,NewNurse2,GarfieldLose1,GarfieldLose2,OdieLose,OdieRunning1,OdieRunning2,OdieRunning3
dw OdieRunningLeft1,OdieRunningLeft2,OdieRunningLeft3,OdieJumpy0,OdieJumpy1,OdieJumpy2,OdieJumpy3

HappyDog: 		//14
db $00,$BA,$03,$00,$00,$BB,$03,$08,$00,$BC,$03,$10,$08,$CA,$03,$00,$08,$CB,$03,$08,$08,$CC,$03,$10,$10,$DA,$03,$00,$10,$DB,$03,$08,$10,$DC,$03,$10,$18,$B7,$03,$00,$18,$B8,$03,$08,$18,$B9,$03,$10,$FF

HappyDogTwo: 	//15
db $F6,$BA,$03,$00,$F6,$BB,$03,$08,$F6,$BC,$03,$10,$FE,$CA,$03,$00,$FE,$CB,$03,$08,$FE,$CC,$03,$10,$06,$DA,$03,$00,$06,$DB,$03,$08,$06,$DC,$03,$10,$0E,$B7,$03,$00,$0E,$B8,$03,$08,$0E,$B9,$03,$10,$FF

Nurse: //NewNurse: //16
db $F5,$95,$01,$07,$F5,$96,$01,$0F,$FD,$A5,$01,$07,$FD,$A6,$01,$0F,$05,$B6,$41,$07,$05,$B6,$01,$0F,$0D,$FF,$01,$FF,$0D,$C6,$41,$07,$0D,$C6,$01,$0F,$15,$D6,$41,$07,$15,$D6,$01,$0F,$1D,$E5,$01,$07,$1D,$E6,$01,$0F,$25,$F5,$01,$07,$25,$F6,$01,$0F,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

NewNurse2: //17
db $F5,$95,$01,$07,$F5,$96,$01,$0F,$FD,$A5,$01,$07,$FD,$A6,$01,$0F,$05,$76,$05,$07,$05,$B6,$01,$0F,$0D,$66,$01,$FF,$0D,$86,$05,$07,$0D,$C6,$01,$0F,$15,$D5,$05,$07,$15,$D6,$01,$0F,$1D,$E5,$01,$07,$1D,$E6,$01,$0F,$25,$F5,$01,$07,$25,$F6,$01,$0F,$05,$46,$01,$FF,$FF,$FF,$FF,$FF,$FF

GarfieldLose1: 		//18
db $00,$3A,$00,$00,$00,$3B,$00,$08,$00,$45,$00,$10,$08,$4A,$00,$00,$08,$4B,$00,$08,$08,$4C,$00,$10,$10,$5A,$00,$00,$10,$5B,$00,$08,$10,$5C,$00,$10,$18,$6A,$00,$00,$18,$6B,$00,$08,$18,$6C,$00,$10,$20,$83,$00,$00,$20,$84,$00,$08,$20,$85,$00,$10,$ff

GarfieldLose2: 		//19
db $00,$3A,$00,$00,$00,$30,$00,$08,$00,$45,$00,$10,$08,$31,$00,$00,$08,$32,$00,$08,$08,$4C,$00,$10,$10,$33,$00,$00,$10,$34,$00,$08,$10,$35,$00,$10,$18,$36,$00,$00,$18,$6B,$00,$08,$18,$37,$00,$10,$20,$83,$00,$00,$20,$84,$00,$08,$20,$85,$00,$10,$ff

OdieLose:			//1a
db $00,$BD,$03,$00,$00,$BE,$03,$08,$00,$BF,$03,$10,$08,$CD,$03,$00,$08,$CE,$03,$08,$08,$CF,$03,$10,$10,$DD,$03,$00,$10,$DE,$03,$08,$18,$DF,$03,$10,$18,$ED,$03,$00,$18,$EE,$03,$08,$20,$EF,$03,$10,$20,$EA,$03,$00,$20,$EB,$03,$08,$28,$FB,$03,$08,$1A,$FA,$03,$18,$ff

OdieRunning1:		//1b1232duringgameplay
db $03,$3C,$01,$03,$00,$3D,$01,$0B,$00,$A3,$01,$13,$08,$3E,$01,$0B,$08,$3F,$01,$13,$10,$4F,$03,$13,$10,$4E,$03,$0B,$18,$5F,$03,$13,$18,$5D,$03,$03,$18,$5E,$03,$0B,$20,$6F,$03,$13,$20,$6D,$03,$05,$20,$6E,$03,$0D,$28,$7F,$03,$13,$28,$7D,$03,$01,$28,$7E,$03,$09,$23,$4D,$03,$1B,$08,$D4,$03,$1B,$10,$E4,$03,$1B,$18,$D9,$03,$1B,$0C,$FE,$00,$13,$FF

OdieRunning2:		//1c
db $12,$D7,$01,$02,$0A,$C7,$01,$02,$0A,$C8,$01,$0A,$0A,$C9,$01,$12,$12,$4F,$03,$12,$12,$4E,$03,$0A,$1A,$E9,$03,$12,$1A,$E7,$03,$02,$1A,$E8,$03,$0A,$22,$F9,$03,$12,$22,$F7,$03,$02,$22,$F8,$03,$0A,$2A,$7C,$03,$12,$2A,$7A,$03,$02,$2A,$7B,$03,$0A,$0A,$D4,$03,$1A,$12,$E4,$03,$1A,$0E,$FD,$00,$12,$FF

OdieRunning3:		//1d
db $05,$3C,$01,$05,$02,$3D,$01,$0D,$02,$A3,$01,$15,$0A,$3E,$01,$0D,$0A,$3F,$01,$15,$12,$4F,$03,$15,$12,$4E,$03,$0D,$1A,$5F,$03,$15,$1A,$5D,$03,$05,$1A,$5E,$03,$0D,$22,$E3,$03,$16,$22,$B3,$03,$06,$22,$6E,$03,$0E,$2A,$F3,$03,$14,$2A,$C3,$03,$05,$2A,$EC,$03,$0D,$2A,$F4,$03,$1C,$0A,$D4,$03,$1D,$12,$E4,$03,$1D,$1A,$D9,$03,$1D,$0E,$FD,$00,$15,$FF

OdieRunningLeft1:	//1e1232duringgameplay
db $03,$3C,$41,$19,$00,$3D,$41,$11,$00,$A3,$41,$09,$08,$3E,$41,$11,$08,$3F,$41,$09,$10,$4F,$43,$09,$10,$4E,$43,$11,$18,$5F,$43,$09,$18,$5D,$43,$19,$18,$5E,$43,$11,$20,$6F,$43,$09,$20,$6D,$43,$17,$20,$6E,$43,$0F,$28,$7F,$43,$09,$28,$7D,$43,$1B,$28,$7E,$43,$13,$23,$4D,$43,$01,$08,$D4,$43,$01,$10,$E4,$43,$01,$18,$D9,$43,$01,$0C,$FE,$40,$09,$FF

OdieRunningLeft2:	//1f
db $12,$D7,$41,$1A,$0A,$C7,$41,$1A,$0A,$C8,$41,$12,$0A,$C9,$41,$0A,$12,$4F,$43,$0A,$12,$4E,$43,$12,$1A,$E9,$43,$0A,$1A,$E7,$43,$1A,$1A,$E8,$43,$12,$22,$F9,$43,$0A,$22,$F7,$43,$1A,$22,$F8,$43,$12,$2A,$7C,$43,$0A,$2A,$7A,$43,$1A,$2A,$7B,$43,$12,$0A,$D4,$43,$02,$12,$E4,$43,$02,$0E,$FD,$40,$0A,$FF

OdieRunningLeft3:	//20
db $05,$3C,$41,$1D,$02,$3D,$41,$15,$02,$A3,$41,$0D,$0A,$3E,$41,$15,$0A,$3F,$41,$0D,$12,$4F,$43,$0D,$12,$4E,$43,$15,$1A,$5F,$43,$0D,$1A,$5D,$43,$1D,$1A,$5E,$43,$15,$22,$E3,$43,$0C,$22,$B3,$43,$1C,$22,$6E,$43,$14,$2A,$F3,$43,$0E,$2A,$C3,$43,$1D,$2A,$EC,$43,$15,$2A,$F4,$43,$06,$0A,$D4,$43,$05,$12,$E4,$43,$05,$1A,$D9,$43,$05,$0E,$FD,$40,$0D,$FF

GarfieldNeutral:	//0c	Fix Frame (orginal space unused)
db $00,$47,$00,$00,$00,$48,$00,$08,$00,$45,$00,$10,$08,$49,$00,$00,$08,$54,$00,$08,$08,$55,$00,$10,$10,$59,$00,$00,$10,$64,$00,$08,$10,$65,$00,$10,$18,$69,$00,$00,$18,$74,$00,$08,$18,$75,$00,$10,$20,$83,$00,$00,$20,$84,$00,$08,$20,$85,$00,$10,$ff

TitleScreenFix:		//21
db $57,$00,$01,$98,$67,$00,$01,$98,$3c,$2c,$01,$BC,$2A,$68,$03,$AE,$3B,$78,$01,$BA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

pe:					//Garfield menuscreen
db $00,$10,$00,$00,$01,$0A,$00,$08,$02,$1B,$00,$10,$03,$0F,$00,$18,$FF

OdieJumpy0:
db $0A,$3C,$03,$48,$0A,$93,$03,$50,$0A,$94,$03,$58,$17,$4F,$03,$58,$17,$E4,$03,$60,$1F,$5F,$03,$58,$1F,$D3,$03,$48,$1F,$79,$03,$50,$27,$D8,$03,$58,$27,$F7,$03,$48,$27,$F8,$03,$50,$2F,$7C,$03,$58,$2F,$7A,$03,$48,$2F,$7B,$03,$50,$17,$4E,$03,$50,$1F,$D9,$03,$60

OdieJumpy1:
db $0A,$3C,$03,$48,$0A,$93,$03,$50,$0A,$94,$03,$58,$17,$4F,$03,$58,$17,$E4,$03,$60,$1F,$5F,$03,$58,$1F,$5D,$03,$48,$1F,$5E,$03,$50,$27,$E3,$03,$58,$27,$B3,$03,$48,$27,$6E,$03,$50,$2F,$F3,$03,$56,$2F,$C3,$03,$48,$2F,$EC,$03,$50,$2F,$F4,$03,$5E,$1F,$D9,$03,$60

OdieJumpy2:
db $17,$D7,$03,$48,$0F,$C7,$03,$48,$0F,$C8,$03,$50,$0F,$C9,$03,$58,$17,$4E,$03,$50,$17,$4F,$03,$58,$17,$E4,$03,$60,$1F,$E7,$03,$48,$1F,$E8,$03,$50,$1F,$E9,$03,$58,$27,$F9,$03,$58,$27,$F7,$03,$48,$27,$F8,$03,$50,$2F,$7A,$03,$48,$2F,$7B,$03,$50,$2F,$7C,$03,$58

OdieJumpy3:
db $0A,$3C,$03,$48,$0A,$93,$03,$50,$0A,$94,$03,$58,$17,$4F,$03,$58,$17,$E4,$03,$60,$1F,$5F,$03,$58,$1F,$5D,$03,$48,$1F,$5E,$03,$50,$27,$6F,$03,$58,$27,$6D,$03,$4A,$27,$6E,$03,$52,$2F,$7F,$03,$58,$2F,$7D,$03,$46,$2A,$4D,$03,$60,$1F,$D9,$03,$60,$2F,$7E,$03,$4E

//-----------------------NewAnimations------------------------------//

NewAnimationsGarfield:		//
	cmp #$00				//Check if base frame
	beq	GarfieldCheck

PastFrame:	
	CLC			//Fix Hijack                      
	ADC #$0A	//adds Garfield base frame
	rts


GarfieldCheck:
	lda $a4
	beq GarfieldWin	//Win when 00 Virus
	lda $46			//Check game state lose
	cmp #$07
	beq	GarfieldLose		//Branch if lose

	lda #$00	//GameState Play
	jmp PastFrame
GarfieldLose:
	lda $43
	asl			//increase Speed till $00-$7f or $80-$ff
	asl
	bmi GarfieldLoseFrame2
	lda #$0e
	jmp PastFrame
GarfieldLoseFrame2:
	lda #$0f
	jmp PastFrame
GarfieldWin:
	lda #$00
	jmp PastFrame	


NewAnimationsDog:
	lda $a4
	bne DogSick
	lda $43			//BranchforAnimation on Framecounter
	and #$F0
	beq NextFrame 	//Frame changes. It will branch for 10 frames what will give the frame in the air some wight
	cmp #$60
	beq NextFrame
	cmp #$b0
	beq	NextFrame
	lda #$04 		//LoadHappyDog
	clc
	rts
NextFrame:
	lda #$05
	clc
	rts
DogSick:	
	LDA $67  		//Load dog frame. After rts base frame $10 is added. You need to look it up and calculate yourelf.          
	CLC     
	rts

NurseWin:
	lda $a4
	beq WinNurseFrame
	lda #$16		
	bpl NormalNurseFrame
WinNurseFrame:
	lda #$13		//WinFrame
NormalNurseFrame:
	sta $53
	JSR $8603   	//FixHijack
	NOP

//----------------------- Odie Animation Main Game 
// Draw Odie to Main game  //01020102

 	tya
 	pha
 	ldy #$20		 //Animation delay
 	
 	lda $709
 	bne $06
 	sty $709
 	inc $70a		 //Rotate Odie Frames
 	
 	dec $709		 //Delay counter
 	
 	lda $70a
 	cmp #$04
 	bne $05
 	lda #$00
 	sta $70a
 	
 	ldy #$3f		 //Spritesize
 	
 	lda $70a
 	beq HardcodeOdieSprite0
 	cmp #$01
 	beq HardcodeOdieSprite1
 	cmp #$02
 	beq HardcodeOdieSprite2
 	
 HardcodeOdieSprite3:
 	lda OdieJumpy3,y
 	sta $2c0,y
 	dey
 	cpy #$ff
 	bne HardcodeOdieSprite3
 	
 HardcodeOdieSpriteEnd:	
 	pla			 //Lets save Y just in case
 	tay
 	rts
 
 HardcodeOdieSprite0:
 	lda OdieJumpy0,y
 	sta $2c0,y
 	dey
 	cpy #$ff 
 	bne HardcodeOdieSprite0
 	beq HardcodeOdieSpriteEnd
 HardcodeOdieSprite1:
 	lda OdieJumpy1,y
 	sta $2c0,y
 	dey
 	cpy #$ff
 	bne HardcodeOdieSprite1
 	beq HardcodeOdieSpriteEnd
 HardcodeOdieSprite2:
 	lda OdieJumpy2,y
 	sta $2c0,y
 	dey
 	cpy #$ff
 	bne HardcodeOdieSprite2
 	beq	HardcodeOdieSpriteEnd

//--------------------------- PauseScreen ---------------------------//
PauseScreen:	
	JSR $8603	//FixHijack

	lda $43		//Load Framecounter branch every $10th frame
	and #$0f
	bne LoadOdieFrame
	
	lda $770	//CheckFrame
	bne count
	lda #$03	//Reset Counter
	sta $770

count:	
	dec $770	//free location in Ram
	
LoadOdieFrame:	
	ldy $770
	lda OdieFrameTable,y
	
	sta $53
//	JSR $8603		//Jump to draw routine.. well here it could be cool to do something yourelf so the dog is animated and moves around the screen.



//---------------------------- Here you could build a Pause Screen mini Game --------------------// or just enable the old subroutine again..
	lda $f7			//Current button presses
	beq ModedSpriteLoad
	and #$01		//Check right
	bne $03
	dec $703
	
	lda $f7
	and #$02		//Check left
	bne $03
	inc $703
	
	lda $f7
	and #$04		//Check down
	bne $03
	dec $702
	
	lda $f7
	and #$08		//Check up
	bne $03
	inc $702

ModedSpriteLoad:
	CLC                      
	LDA $53                  
	ROL                   
	TAX                      
	LDA $C120,x             
	STA $47                  
	INX                      
	LDA $C120,x         
	STA $48                  
	LDX $42                  
	LDY #$00                 
RepeatLoad:	
	LDA ($47),y    	//ModedLoad Routine          
	CMP #$FF                 
	BEQ EndPauseScreen            
	CLC                      
	adc $702 		//Current Sprite offset               
	STA $0200,x              
	INX                      
	INY                      
	LDA ($47),y             
	STA $0200,x           
	INX                      
	INY                      
	LDA ($47),y           
	STA $0200,x            
	INX                      
	INY                      
	LDA ($47),y            
	CLC                      
	adc $703                  
	STA $0200,x             
	INX                      
	INY                      
	LDA #$04                 
	CLC                      
	ADC $42                  
	STA $42                  
	JMP RepeatLoad               

EndPauseScreen:
	rts

OdieFrameTable:
db $1d,$1b,$1c,$1d



//-------------------------------- Menu Screen --------------------------------//
	
	MenuScreen:
	
	ldx #$ff				//Set Start X offset 00
KeepLoading:
	inx
	lda TitleScreenFix,x 	//Adding the old nurs to the menu
	sta $280,x				//Hardcoded sprite load
	cmp #$ff
	bne KeepLoading
	
	ldx #$fc				//Start offsetSprite 00
	ldy #$10
	
//-------------- Adding Menue ---------------------//
	ldx #$00		//adding sprite 0
KeepLo1:
	lda Lasagne,x
	sta $2e0,x		//lower slot
	inx
	cpx #$06
	bne KeepLo1

	ldx #$00		//adding sprite 0
KeepLo2:
	lda Monday,x
	sta $2f0,x
	inx
	cpx #$06
	bne KeepLo2		//even lower slot. To be honest just wasting space haha
	
//------------- Lasagne Menu Logic -------------------------//
ArrowPosCheck:
	lda $65
	cmp #$02
	beq ButtonCheckA
	
	cmp #$01
	beq ButtonCheckB
	jmp	UpdateSpriteNumbers
ButtonCheckA:
	lda $f5				//Buttan mapping current frame
	and #$c0
	beq UpdateSpriteNumbers
	inc $705
	
	lda $705			//Check and reset when over c.. donno how to disable
	cmp #$0c
	bne $05
	lda #$00
	sta $705
 
	
	jmp UpdateSpriteNumbers
ButtonCheckB:
	lda $f5				//Button mapping current frame
	and #$c0
	beq UpdateSpriteNumbers
	inc $706

	lda $706			//Check and reset when over 4
	cmp #$04
	bne $05
	lda #$00
	sta $706

UpdateSpriteNumbers:
	lda $705			//UpdateSpriteID
	sta $2e1
	
	lda $706			//UpdateSpriteID
	sta $2f1
	
	JSR $8603      		//Hijack Fix    

//##############MusikMenu########################
//Documentation https://www.mesen.ca/docs/hdpacks.html#lt-bgm-gt-tag
Monday2Music:
	lda $f5						//denoice selection. Make it just work when a button is pressed
	and #$c0
	beq Lasagne2NoIncrementSpeed
	lda $705
	bne $03
	inc $4101
	sta $4105
	cmp #$0c
	bne $03
	inc $4101					//Mute
	
	
	lda #$ff					//Volume Full Blast
	sta $4102
	JSR $E583					//FixMusik Lunch?
Lasagne2NoIncrementSpeed:
//	lda $706					//Used for Musik speed. A now increment mode could be nice so it still could be added.
//	sta $723
	rts


Lasagne:
db $67,$00,$01,$a0,$00,$80
Monday:
db $57,$00,$01,$a0,$00,$80


//------------------- add bg color ------------------------//
BGcolor:			
	
	lda $68d		
	beq EndBGcolorCheck
	
LoadPalettes:
	LDA $2002    // read PPU status to reset the high/low latch
	LDA #$3F
	STA $2006    // write the high byte of $3F00 address
	LDA #$00
	STA $2006    // write the low byte of $3F00 address
	LDX #$00
LoadPalettesLoop:
	LDA palette, x        //load palette byte
	STA $2007             //write to PPU
	INX                   //set index to next byte
	CPX #$20            
	BNE LoadPalettesLoop  //if x = $20, 32 bytes copied, all done
	
	lda #$01		//SetFlag for non pause to load normal palette
	sta $707
	
	jmp EndBGcolorCheck


LoadPalettesNormal:
	lda $707	 //Check if fals palette is loaded in play mode
	beq EndBGcolorFinal
	
	LDA $2002    // read PPU status to reset the high/low latch
	LDA #$3F
	STA $2006    // write the high byte of $3F00 address
	LDA #$00
	STA $2006    // write the low byte of $3F00 address
	LDX #$00
LoadPalettesLoopNormal:
	LDA Palette2, x        //load palette byte
	STA $2007             //write to PPU
	INX                   //set index to next byte
	CPX #$20            
	BNE LoadPalettesLoopNormal  //if x = $20, 32 bytes copied, all done
	
	lda #$00		//SetFlag so it only need to run once
	sta $707
	
	jmp EndBGcolorFinal
	
EndBGcolorCheck:	
	
	lda $68d
	beq LoadPalettesNormal
	
EndBGcolorFinal:	
	JSR $8232                	//FixHijack   
	rts
	
palette:
  db $12,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$12,$20,$20,$0F,$00,$07,$37,$0F,$00,$0F,$0F,$0F,$00,$16,$37,$0F


//---------- Custom Music Stuff ---------------------//
SlowMusik:			//To slow down I only run the routine every other frame. In theory you could add subspeed modifyer to make smaller increment.
	lda $708
	beq RunMusik
	dec $708
	
	rts
RunMusik:		
	JSR $E583
	lda $706		//load Delay
	sta $708
	rts


//################TitleSceenMusik##########################//
TitleScreen:		//There are some routines for it here //JSR $9F63  //9f3b,9f4f=BG,9f63=,9f77=BG Routines
	LDA $0f			//End if Flag is set		
	BNE EndTitle
	LDA #$01
	STA $706		//Set Music speed default
	STA $0f			//Only run once till reset. Set Flag
	
	sta $4100		//Loop Music
	STA $4105
	lda #$ff
	sta $4102		//Full Volume
	
EndTitle:	
	JSR $C100		//HijackFix
	RTS

TitleScreenCHR:		//JSR $9F4F		//HijackFix not needed as we do Swaping here again to show it.
	
//	lda #$04		//Sprite Bank Orginal

	LDA $43     		// Framecounter             
	AND #$1c            // The fast way to make count 8 frames and increase. We get 4 states
	LSR	               	// 
	LSR
	LSR
	tax
	lda CHRBankTable,x         
	
	
	STA $bfff                
	LSR                    
	STA $bfff                 
	LSR  
	STA $bfff           
	LSR
	STA $bfff               
	LSR              
	STA $bfff              
	
	
	lda #$05			//org 9100 will set the screen Tile CHR at the beginnin. I disabled that.
	
	STA $cfff             
	LSR                    
	STA $cfff            
	LSR  
	STA $cfff      
	LSR
	STA $cfff           
	LSR              
	STA $cfff 
	
	RTS

CHRBankTable:
	db $04,$06,$07,$06	//Rotate Bank 1232(repeat)

org $ffa0				//Free Space till NMI/reset or IRQ/BRK table?


CHRBankTable:
	db $06,$04,$07,$04	//Rotate Bank 1232(repeat) $04,$06,$07,$06

org $ffa0				//Free Space till NMI/reset or IRQ/BRK table?

org $c000				//SpriteAssembly TitleScreen

db $20,$00,$00,$18,$20,$01,$00,$20,$20,$02,$00,$28,$20,$03,$00,$30,$28,$10,$00,$18,$28,$11,$00,$20,$28,$12,$00,$28,$28,$13,$00,$30,$28,$14,$00,$38,$28,$15,$00,$40,$30,$25,$00,$40,$30,$24,$00,$38,$30,$23,$00,$30,$30,$22,$00,$28,$30,$21,$00,$20,$30,$20,$00,$18,$38,$30,$00,$18,$38,$31,$00,$20,$38,$32,$00,$28,$38,$33,$00,$30,$38,$34,$00,$38,$38,$35,$00,$40,$38,$36,$00,$48,$40,$40,$00,$18,$40,$41,$00,$20,$40,$42,$00,$28,$40,$43,$00,$30,$40,$44,$00,$38,$40,$45,$00,$40,$40,$46,$00,$48,$58,$07,$00,$A1,$60,$17,$00,$A1,$68,$27,$00,$A1,$68,$28,$00,$A9,$60,$18,$00,$A9,$68,$29,$00,$B1,$60,$19,$00,$B1,$58,$09,$00,$B1,$58,$08,$00,$A9,$6C,$0A,$03,$B9,$6C,$0B,$03,$C1,$6C,$0C,$03,$C9,$74,$1A,$03,$B9,$74,$1B,$03,$C1,$74,$1C,$03,$C9,$7C,$2A,$03,$B9,$7C,$2B,$03,$C1,$7C,$2C,$03,$C9,$80,$0D,$03,$D1,$80,$0E,$03,$D9,$80,$0F,$03,$E1,$88,$1F,$03,$E1,$88,$1E,$03,$D9,$88,$1D,$03,$D1,$90,$2D,$03,$D1,$90,$2E,$03,$D9,$90,$2F,$03,$E1,$C8,$37,$02,$9C,$C8,$38,$02,$A9,$C8,$39,$02,$B1,$C8,$3A,$02,$B9,$C8,$3B,$02,$C1,$C8,$3C,$02,$C9,$C8,$3D,$02,$D1

//---------- CHR Stuff ---------------------//
	
bank 2;								//CHR Banks dunno how to add this proprly 
org $8000
incbin CHR/CHR0MainTilesFrame1.bin	
						
incbin CHR/CHR1MainTilesFrame2.bin

incbin CHR/CHR2GameSprites.bin

incbin CHR/CHR3Menu.bin


bank 3;
org $8000
incbin CHR/CHR5TitleSprite.bin

incbin CHR/CHR6TitleTiles.bin

incbin CHR/CHR7TitleAnim.bin

incbin CHR/CHR8TitleAnim.bin
