//****************************************
// Rom info
//****************************************
arch nes.cpu			// set processor architecture (NES)
header					// rom has a header		


banksize $4000			// set the size of each bank.

bank 0;
//---------------------------- Multiple Hijacks and stuff  ----------------------------------------------//

org $9131				//Wait on Titlescreen till you press start.
	LDA $F5                  
	CMP #$10                 
	BEQ StartMenuSceen               
	JSR TitleScreen 	//Should be ok to use this old hijack.. hopfully noone did changes on that screen..               
	JMP $9131
StartMenuSceen:	
	JMP $C114                
	



org $917b
	jsr HDpackMusic


bank 1;
base $c000

//org $c804			//HotFix MuteMusic might change when assembled different. Disable writes to RAM $06f5
nop
nop
nop



org $d000			//More Free Space
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
	
//----------------------------------------------------
HDpackMusic:
	txa				//HijackFix 
	pha
	tya
	pha
	
	
	lda $f5			//ButtonCheckFrame
	and #$c0		//Check A and B
	beq HDpackMusicEnd
	lda $705
	
	bne $03			//Mute
	inc $4101	
	
	sta $4105	
	
HDpackMusicEnd:
	pla				//HijackFix 
	tax
	pla
	tay
	jsr $9dfa		//HijackFix
	rts