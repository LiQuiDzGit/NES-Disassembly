

; ---------------------------------------------------------------------------
; ===========================================================================

; Segment type:	Pure code
		;.segment BANK5
	
 	

sound:					; CODE XREF: mus+16J
		JMP	loc_80235
; ---------------------------------------------------------------------------

loc_80003:				; CODE XREF: sub_B4315+BJ
		CMP	#$FC ; '¸'
		BNE	loc_8000A
		JMP	loc_80129
; ---------------------------------------------------------------------------

loc_8000A:				; CODE XREF: BANK5:8005j
		CMP	#$FD ; '˝'
		BNE	loc_80011
		JMP	loc_8012D
; ---------------------------------------------------------------------------

loc_80011:				; CODE XREF: BANK5:800Cj
		CMP	#$FE ; '˛'
		BNE	loc_80020
		LDA	#1
		STA	byte_C4
		LDA	#0
		STA	loptr3
		JMP	loc_8013A
; ---------------------------------------------------------------------------

loc_80020:				; CODE XREF: BANK5:8013j
					; DATA XREF: BANK5:9F74o
		CMP	#$FF
		BNE	loc_8002F
		LDA	#1
		STA	byte_C4
		LDA	#0
		STA	loptr3
		JMP	loc_8018C
; ---------------------------------------------------------------------------

loc_8002F:				; CODE XREF: BANK5:8022j
		ASL	A
		TAX
		LDA	off_80A50,X
		STA	loptr
		LDA	off_80A50+1,X
		STA	hiptr
		LDY	#0
		LDA	(loptr),Y
		TAX
		AND	#$F
		BEQ	loc_800BB
		LDA	byte_C0
		AND	#$F
		STA	loptr2
		CPX	loptr2
		BCS	loc_8004F
		RTS
; ---------------------------------------------------------------------------

loc_8004F:				; CODE XREF: BANK5:804Cj
		STX	loptr2
		LDA	byte_C0
		AND	#$F0 ; ''
		ORA	loptr2
		STA	byte_C0
		LDA	#1
		STA	byte_C4
		LDA	#0
		STA	loptr3
		LDA	#0
		STA	byte_C7
		STA	byte_C8
		LDA	#4
		STA	loptr2
		LDA	#1

loc_8006D:				; CODE XREF: BANK5:80A3j
		CLC
		ADC	loptr
		STA	loptr
		LDA	#0
		ADC	hiptr
		STA	hiptr
		LDX	loptr3
		LDY	#0

loc_8007C:				; CODE XREF: BANK5:8085j
		LDA	(loptr),Y
		STA	unk_780,X
		INX
		INY
		CPY	#2
		BNE	loc_8007C
		LDY	#$E
		LDA	#0

loc_8008B:				; CODE XREF: BANK5:8090j
		STA	unk_780,X
		INX
		DEY
		BNE	loc_8008B
		LDA	byte_C1
		LSR	A
		BCS	loc_8009A
		JSR	sub_801B2

loc_8009A:				; CODE XREF: BANK5:8095j
		JSR	sub_80207
		DEC	loptr2
		BEQ	loc_800A6
		LDA	#2
		JMP	loc_8006D
; ---------------------------------------------------------------------------

loc_800A6:				; CODE XREF: BANK5:809Fj
		LDY	#2
		LDA	(loptr),Y
		STA	byte_7FC
		INY
		LDA	(loptr),Y
		STA	byte_7FD
		JSR	sub_80219
		LDA	#0
		STA	byte_C4
		RTS
; ---------------------------------------------------------------------------

loc_800BB:				; CODE XREF: BANK5:8042j
		LDA	byte_C0
		AND	#$F0 ; ''
		STA	loptr2
		CPX	loptr2
		BCS	loc_800C6
		RTS
; ---------------------------------------------------------------------------

loc_800C6:				; CODE XREF: BANK5:80C3j
		STX	loptr2
		LDA	byte_C0
		AND	#$F
		ORA	loptr2
		STA	byte_C0
		LDA	#1
		STA	byte_C4
		LDA	#0
		STA	loptr3
		LDX	#0
		LDA	#2
		CLC
		ADC	loptr
		STA	loptr5
		TXA
		ADC	hiptr
		STA	hiptr5
		STX	byte_D2
		STX	byte_D3
		LDY	#1
		LDA	(loptr),Y
		AND	#$F
		TAX
		ORA	byte_C1
		PHA
		STX	byte_C1
		LDA	#4
		STA	loptr2
		LDA	#2
		STA	hiptr2

loc_800FE:				; CODE XREF: BANK5:811Aj
		PLA
		LSR	A
		PHA
		BCC	loc_8010E
		JSR	sub_801B2
		LDA	byte_C1
		LSR	A
		BCS	loc_8010E
		JSR	sub_8016C

loc_8010E:				; CODE XREF: BANK5:8101j BANK5:8109j
		JSR	sub_80207
		LDA	#4
		CLC
		ADC	hiptr2
		STA	hiptr2
		DEC	loptr2
		BNE	loc_800FE
		JSR	sub_80219
		LDA	byte_C1
		STA	byte_CF
		PLA
		LDA	#0
		STA	byte_C4
		RTS
; ---------------------------------------------------------------------------

loc_80129:				; CODE XREF: BANK5:8007j
		INY
		STY	byte_C7
		RTS
; ---------------------------------------------------------------------------

loc_8012D:				; CODE XREF: BANK5:800Ej
		STY	byte_C8
		LDA	#1
		STA	byte_C9
		LDA	byte_CA
		AND	#1
		STA	byte_CA
		RTS
; ---------------------------------------------------------------------------

loc_8013A:				; CODE XREF: BANK5:801Dj
		LDA	byte_C0
		AND	#$F
		STA	byte_C0
		LDA	#4
		STA	loptr2
		LDA	#2
		STA	hiptr2

loc_80148:				; CODE XREF: BANK5:815Fj
		LDA	byte_C1
		LSR	A
		BCC	loc_80153
		JSR	sub_801B2
		JSR	sub_8016C

loc_80153:				; CODE XREF: BANK5:814Bj
		JSR	sub_80207
		LDA	#4
		CLC
		ADC	hiptr2
		STA	hiptr2
		DEC	loptr2
		BNE	loc_80148
		LDA	#0
		STA	byte_C1
		STA	byte_CF
		LDA	#0
		STA	byte_C4
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_8016C:				; CODE XREF: BANK5:810Bp BANK5:8150p
		LDA	loptr3
		CLC
		ADC	#$A
		TAX
		LDA	unk_780,X
		ORA	unk_781,X
		BNE	loc_801C4
		LDY	loptr2
		LDX	hiptr2
		JSR	sub_80222
		LDX	loptr3
		LDA	unk_780,X
		ORA	unk_781,X
		BNE	loc_801C4
		RTS
; End of function sub_8016C

; ---------------------------------------------------------------------------

loc_8018C:				; CODE XREF: BANK5:802Cj
		LDA	byte_C0
		AND	#$F0 ; ''
		STA	byte_C0
		LDA	#0
		STA	byte_C7
		STA	byte_C8
		LDA	#4
		STA	loptr2

loc_8019C:				; CODE XREF: BANK5:81ABj
		LDA	#0
		LDX	loptr3
		STA	unk_780,X
		STA	unk_781,X
		JSR	sub_80211
		DEC	loptr2
		BNE	loc_8019C
		LDA	#0
		STA	byte_C4
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_801B2:				; CODE XREF: BANK5:8097p BANK5:8103p ...
		LDY	#$F
		LDA	#$10
		CLC
		ADC	loptr3
		TAX
		LDA	#0

loc_801BC:				; CODE XREF: sub_801B2+Fj
		STA	unk_780,X
		INX
		DEY
		BNE	loc_801BC
		RTS
; End of function sub_801B2

; ---------------------------------------------------------------------------

loc_801C4:				; CODE XREF: sub_8016C+Cj
					; sub_8016C+1Dj
		LDA	loptr2
		PHA
		LDA	hiptr2
		PHA
		LDA	byte_7FC
		STA	loptr2
		LDA	byte_7FD
		STA	hiptr2
		LDA	loptr3
		CLC
		ADC	#6
		TAX
		LDA	unk_780,X
		AND	#$1F
		BEQ	loc_801EA
		TAY
		LDA	#0

loc_801E4:				; CODE XREF: BANK5:81E8j
		CLC
		ADC	#4
		DEY
		BNE	loc_801E4

loc_801EA:				; CODE XREF: BANK5:81DFj
		TAY
		TXA
		CLC
		ADC	#$E
		TAX
		LDA	#4

loc_801F2:				; CODE XREF: BANK5:81FEj
		PHA
		LDA	(loptr2),Y
		STA	unk_780,X
		INY
		INX
		PLA
		SEC
		SBC	#1
		BNE	loc_801F2
		PLA
		STA	hiptr2
		PLA
		STA	loptr2
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_80207:				; CODE XREF: BANK5:loc_8009Ap
					; BANK5:loc_8010Ep ...
		LSR	byte_C1
		BCC	sub_80211
		LDA	byte_C1
		ORA	#$80 ; 'Ä'
		STA	byte_C1
; End of function sub_80207


; =============== S U B	R O U T	I N E =======================================


sub_80211:				; CODE XREF: BANK5:81A6p sub_80207+2j
		LDA	#$1F
		CLC
		ADC	loptr3
		STA	loptr3
		RTS
; End of function sub_80211


; =============== S U B	R O U T	I N E =======================================


sub_80219:				; CODE XREF: BANK5:80B3p BANK5:811Cp
		LSR	byte_C1
		LSR	byte_C1
		LSR	byte_C1
		LSR	byte_C1
		RTS
; End of function sub_80219


; =============== S U B	R O U T	I N E =======================================


sub_80222:				; CODE XREF: sub_8016C+12p BANK5:8291p ...
		CPY	#1
		BEQ	loc_8022F
		LDA	#0
		STA	$4000,X
		STA	$4001,X
		RTS
; ---------------------------------------------------------------------------

loc_8022F:				; CODE XREF: sub_80222+2j
		LDA	#7
		STA	$4015
		RTS
; End of function sub_80222

; ---------------------------------------------------------------------------

loc_80235:				; CODE XREF: BANK5:soundj
		INC	byte_CA
		LDA	byte_C4
		BEQ	loc_8023C
		RTS
; ---------------------------------------------------------------------------

loc_8023C:				; CODE XREF: BANK5:8239j
		LDX	#$80 ; 'Ä'
		LDY	#7
		STX	loptr3
               lda #$60
		STa	hiptr3
		LDA	#0
		STA	byte_CB
		LDA	#4
		STA	byte_CE

loc_8024C:				; CODE XREF: BANK5:82B6j
		LDA	#1
		LDY	#$18
		CLC
		ADC	(loptr3),Y
		STA	(loptr3),Y
		LDA	#1
		LDY	#$1D
		CLC
		ADC	(loptr3),Y
		STA	(loptr3),Y
		LDA	byte_CF
		LSR	A
		BCC	loc_80266
		JSR	sub_8056D

loc_80266:				; CODE XREF: BANK5:8261j
		LDA	byte_30
		LSR	A
		BCC	loc_8026E
		JMP	loc_80286
; ---------------------------------------------------------------------------

loc_8026E:				; CODE XREF: BANK5:8269j
		LDY	#0
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BEQ	loc_80286
		LDA	#1
		LDY	#$E
		CLC
		ADC	(loptr3),Y
		STA	(loptr3),Y
		JSR	sub_806B4
		JMP	loc_80294
; ---------------------------------------------------------------------------

loc_80286:				; CODE XREF: BANK5:826Bj BANK5:8275j
		LDA	byte_CF
		LSR	A
		BCS	loc_80294
		LDX	byte_CB
		INX
		INX
		LDY	byte_CE
		JSR	sub_80222

loc_80294:				; CODE XREF: BANK5:8283j BANK5:8289j
		LSR	byte_CF
		BCC	loc_8029E
		LDA	byte_CF
		ORA	#$80 ; 'Ä'
		STA	byte_CF

loc_8029E:				; CODE XREF: BANK5:8296j
		DEC	byte_CE
		BEQ	loc_802B9
		LDA	#4
		CLC
		ADC	byte_CB
		STA	byte_CB
		LDA	#$1F
		CLC
		ADC	loptr3
		STA	loptr3
		LDA	#0
		ADC	hiptr3
		STA	hiptr3
		JMP	loc_8024C
; ---------------------------------------------------------------------------

loc_802B9:				; CODE XREF: BANK5:82A0j
		LDA	byte_C8
		AND	#$7F ; ''
		BEQ	loc_802DD
		CMP	byte_CA
		BNE	loc_802DD
		LDA	byte_CA
		AND	#1
		STA	byte_CA
		INC	byte_C9
		LDA	#$10
		CMP	byte_C9
		BNE	loc_802DD
		LDA	byte_C8
		BMI	loc_802D9
		LDA	#0
		STA	byte_C8

loc_802D9:				; CODE XREF: BANK5:82D3j
		LDA	#$F
		STA	byte_C9

loc_802DD:				; CODE XREF: BANK5:82BDj BANK5:82C1j ...
		LDA	byte_D2
		BEQ	loc_802E3
		DEC	byte_D2

loc_802E3:				; CODE XREF: BANK5:82DFj
		LSR	byte_CF
		LSR	byte_CF
		LSR	byte_CF
		LSR	byte_CF
		RTS
; ---------------------------------------------------------------------------

loc_802EC:				; CODE XREF: sub_806D3:loc_806FBj
		LDY	#$C
		LDA	(loptr3),Y
		LDY	#2
		CPY	byte_CE
		BEQ	loc_802F8
		AND	#$F

loc_802F8:				; CODE XREF: BANK5:82F4j
		STA	loptr4
		LDA	byte_C8
		AND	#$7F ; ''
		BEQ	loc_8032B
		LDA	byte_C9
		LDY	#2
		CPY	byte_CE
		BNE	loc_80310
		LDX	#$C

loc_8030A:				; CODE XREF: BANK5:830Ej
		CLC
		ADC	byte_C9
		DEX
		BNE	loc_8030A

loc_80310:				; CODE XREF: BANK5:8306j
		TAY
		LDA	byte_C8
		BMI	loc_80324
		LDX	#$FF

loc_80317:				; CODE XREF: BANK5:831Dj
		INX
		CPX	loptr4
		BEQ	loc_8032B
		DEY
		BNE	loc_80317
		STX	loptr4
		JMP	loc_8032B
; ---------------------------------------------------------------------------

loc_80324:				; CODE XREF: BANK5:8313j BANK5:8329j
		DEC	loptr4
		BEQ	loc_8032B
		DEY
		BNE	loc_80324

loc_8032B:				; CODE XREF: BANK5:82FEj BANK5:831Aj ...
		LDA	#2
		CMP	byte_CE
		BEQ	loc_8037C
		LDY	#$D
		LDA	(loptr3),Y
		TAX
		AND	#$7F ; ''
		BEQ	loc_8037C
		INY
		CMP	(loptr3),Y
		BEQ	loc_80347
		INY
		LDA	(loptr3),Y
		AND	#$F
		JMP	loc_8036C
; ---------------------------------------------------------------------------

loc_80347:				; CODE XREF: BANK5:833Dj
		LDA	#0
		STA	(loptr3),Y
		INY
		LDA	(loptr3),Y
		LSR	A
		LSR	A
		LSR	A
		LSR	A
		STA	hiptr4
		TXA
		BPL	loc_8035E
		LDA	#0
		SEC
		SBC	hiptr4
		STA	hiptr4

loc_8035E:				; CODE XREF: BANK5:8355j
		LDA	(loptr3),Y
		AND	#$F
		CLC
		ADC	hiptr4
		BPL	loc_8036C
		LDA	#0
		JMP	loc_80372
; ---------------------------------------------------------------------------

loc_8036C:				; CODE XREF: BANK5:8344j BANK5:8365j
		CMP	loptr4
		BCC	loc_80372
		LDA	loptr4

loc_80372:				; CODE XREF: BANK5:8369j BANK5:836Ej
		STA	loptr4
		LDA	(loptr3),Y
		AND	#$F0 ; ''
		ORA	loptr4
		STA	(loptr3),Y

loc_8037C:				; CODE XREF: BANK5:832Fj BANK5:8338j
		LDA	byte_CF
		LSR	A
		BCS	loc_80388
		LDA	#$C
		STA	hiptr4
		JMP	loc_8038F
; ---------------------------------------------------------------------------

loc_80388:				; CODE XREF: BANK5:837Fj
		LDA	#9
		STA	hiptr4
		JMP	loc_803FE
; ---------------------------------------------------------------------------

loc_8038F:				; CODE XREF: BANK5:8385j sub_8056D+22j
		LDY	#$16
		LDA	(loptr3),Y

loc_80393:				; DATA XREF: BANK5:off_81311o
		AND	#$7F ; ''
		BEQ	loc_803D5
		LDY	#$1D
		CMP	(loptr3),Y
		BEQ	loc_803A0
		JMP	loc_803CB
; ---------------------------------------------------------------------------

loc_803A0:				; CODE XREF: BANK5:839Bj
		LDA	#0
		STA	(loptr3),Y
		LDY	#$17
		LDA	(loptr3),Y
		LDY	#$1E
		CLC
		ADC	(loptr3),Y
		BEQ	loc_803B1
		BPL	loc_803B8

loc_803B1:				; CODE XREF: BANK5:83ADj
		LDA	#1
		STA	(loptr3),Y
		JMP	loc_803C2
; ---------------------------------------------------------------------------

loc_803B8:				; CODE XREF: BANK5:83AFj
		STA	(loptr3),Y
		CMP	#$10
		BCC	loc_803CB
		LDA	#$F
		STA	(loptr3),Y

loc_803C2:				; CODE XREF: BANK5:83B5j
		LDA	#0
		LDY	#$17
		SEC
		SBC	(loptr3),Y
		STA	(loptr3),Y

loc_803CB:				; CODE XREF: BANK5:839Dj BANK5:83BCj
		LDY	#$1E
		LDA	(loptr3),Y
		CMP	loptr4
		BCS	loc_803D5
		STA	loptr4

loc_803D5:				; CODE XREF: BANK5:8395j BANK5:83D1j
		LDY	#2
		CPY	byte_CE
		BEQ	loc_803E8
		LDA	hiptr4
		AND	#$7F ; ''
		TAY
		LDA	(loptr3),Y
		AND	#$F0 ; ''
		ORA	loptr4
		STA	loptr4

loc_803E8:				; CODE XREF: BANK5:83D9j
		LDX	byte_CB
		LDA	loptr4
		STA	$4000,X
		LDA	hiptr4
		BPL	loc_803FA
		LDA	#$90 ; 'ê'
		STA	hiptr4
		JMP	loc_803FE
; ---------------------------------------------------------------------------

loc_803FA:				; CODE XREF: BANK5:83F1j
		LDA	#9
		STA	hiptr4

loc_803FE:				; CODE XREF: BANK5:838Cj BANK5:83F7j
		LDA	hiptr4
		AND	#$7F ; ''
		TAY
		LDX	#0
		LDA	(loptr3),Y
		BEQ	loc_80418
		BPL	loc_8040C
		DEX

loc_8040C:				; CODE XREF: BANK5:8409j
		INY
		CLC
		ADC	(loptr3),Y
		STA	(loptr3),Y
		TXA
		INY
		ADC	(loptr3),Y
		STA	(loptr3),Y

loc_80418:				; CODE XREF: BANK5:8407j
		LDA	hiptr4
		BMI	loc_80422
		LDA	byte_CF
		LSR	A
		BCC	loc_80422
		RTS
; ---------------------------------------------------------------------------

loc_80422:				; CODE XREF: BANK5:841Aj BANK5:841Fj
		LDY	#$14
		LDA	(loptr3),Y
		AND	#$7F ; ''
		BNE	loc_8042D
		JMP	loc_804A9
; ---------------------------------------------------------------------------

loc_8042D:				; CODE XREF: BANK5:8428j
		LDY	#$18
		CMP	(loptr3),Y
		BEQ	loc_80436
		JMP	loc_804A9
; ---------------------------------------------------------------------------

loc_80436:				; CODE XREF: BANK5:8431j
		LDA	#0
		STA	(loptr3),Y
		TAX
		LDY	#$15
		LDA	(loptr3),Y
		ROL	A
		ROL	A
		ROL	A
		ROL	A
		AND	#7
		STA	loptr4
		LDY	#$19
		LDA	(loptr3),Y
		ASL	A
		BCC	loc_80456
		LDA	#0
		SEC
		SBC	loptr4
		STA	loptr4
		DEX

loc_80456:				; CODE XREF: BANK5:844Cj
		LDA	loptr4
		CLC
		LDY	#$1A
		ADC	(loptr3),Y
		STA	(loptr3),Y
		INY
		TXA
		ADC	(loptr3),Y
		STA	(loptr3),Y
		LDY	#$15
		LDA	(loptr3),Y
		AND	#$1F
		STA	loptr4
		LDY	#$19
		LDA	(loptr3),Y
		CLC
		ADC	#1
		STA	(loptr3),Y
		AND	#$7F ; ''
		CMP	loptr4
		BNE	loc_804A9
		LDA	(loptr3),Y
		AND	#$80 ; 'Ä'
		STA	(loptr3),Y
		LDY	#$14
		LDA	(loptr3),Y
		ASL	A
		BCS	loc_804A3
		LDA	(loptr3),Y
		ORA	#$80 ; 'Ä'
		STA	(loptr3),Y
		LDY	#$19
		LDA	(loptr3),Y
		BPL	loc_8049C
		AND	#$7F ; ''
		STA	(loptr3),Y
		JMP	loc_804A9
; ---------------------------------------------------------------------------

loc_8049C:				; CODE XREF: BANK5:8493j
		ORA	#$80 ; 'Ä'
		STA	(loptr3),Y
		JMP	loc_804A9
; ---------------------------------------------------------------------------

loc_804A3:				; CODE XREF: BANK5:8487j
		LDA	(loptr3),Y
		AND	#$7F ; ''
		STA	(loptr3),Y

loc_804A9:				; CODE XREF: BANK5:842Aj BANK5:8433j ...
		LDA	hiptr4
		AND	#$7F ; ''
		STA	hiptr4
		INC	hiptr4
		LDY	#$1A
		LDA	(loptr3),Y
		LDY	hiptr4
		CLC
		ADC	(loptr3),Y
		TAX
		LDY	#$1B
		LDA	(loptr3),Y
		INC	hiptr4
		LDY	hiptr4
		ADC	(loptr3),Y
		TAY
		LDA	#1
		CMP	byte_CE
		BNE	loc_804E5
		LDA	#$F
		STA	$4015
		TXA
		AND	#$F
		TAX
		INC	hiptr4
		LDY	hiptr4
		LDA	(loptr3),Y
		AND	#$80 ; 'Ä'
		STA	loptr4
		TXA
		ORA	loptr4
		TAX
		LDY	#0

loc_804E5:				; CODE XREF: BANK5:84CAj
		TXA
		LDX	byte_CB
		INX
		INX
		STA	$4000,X
		TYA
		LDY	#$1C
		CMP	(loptr3),Y
		BNE	loc_804F5
		RTS
; ---------------------------------------------------------------------------

loc_804F5:				; CODE XREF: BANK5:84F2j
		STA	(loptr3),Y
		ORA	#8
		STA	$4001,X
		RTS
; ---------------------------------------------------------------------------

loc_804FD:				; CODE XREF: sub_8056D+52j
					; sub_80706+99j
		LDY	#1
		CPY	byte_CE
		BNE	loc_80509
		LDA	#7
		STA	$4015
		RTS
; ---------------------------------------------------------------------------

loc_80509:				; CODE XREF: BANK5:8501j
		LDA	#0
		LDX	byte_CB
		INX
		INX
		STA	$4000,X
		STA	$4001,X
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_80516:				; CODE XREF: BANK5:854Dp sub_8056D+4Fp ...
		LDY	#$14
		LDA	(loptr3),Y
		AND	#$7F ; ''
		STA	(loptr3),Y
		LDY	#$16
		LDA	(loptr3),Y
		ASL	A
		BCC	loc_80535
		LDY	loptr4
		LDA	(loptr3),Y
		LDX	#2
		CPX	byte_CE
		BEQ	loc_80531
		AND	#$F

loc_80531:				; CODE XREF: sub_80516+17j
		LDY	#$1E
		STA	(loptr3),Y

loc_80535:				; CODE XREF: sub_80516+Dj
		LDX	#6
		LDA	#0
		LDY	#$18

loc_8053B:				; CODE XREF: sub_80516+29j
		STA	(loptr3),Y
		INY
		DEX
		BNE	loc_8053B
		LDA	#$FF
		LDY	#$1C
		STA	(loptr3),Y
		RTS
; End of function sub_80516

; ---------------------------------------------------------------------------

loc_80548:				; CODE XREF: sub_8056D+38j
					; sub_80706:loc_8074Fj
		LDY	#$1C
		LDA	(loptr3),Y
		PHA
		JSR	sub_80516
		PLA
		LDY	#$1C
		STA	(loptr3),Y
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_80556:				; CODE XREF: sub_8056D:loc_805C2p
					; sub_80706:loc_807C0p
		TXA
		ASL	A
		TAY
		INY
		PLA
		STA	loptr4
		PLA
		STA	hiptr4
		LDA	(loptr4),Y
		TAX
		INY
		LDA	(loptr4),Y
		STA	hiptr4
		STX	loptr4
		JMP	(loptr4)
; End of function sub_80556


; =============== S U B	R O U T	I N E =======================================


sub_8056D:				; CODE XREF: BANK5:8263p
		LDA	byte_D2
		BNE	loc_80574
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_80574:				; CODE XREF: sub_8056D+2j
		LDY	#$11
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BNE	loc_8057E
		RTS
; ---------------------------------------------------------------------------

loc_8057E:				; CODE XREF: sub_8056D+Ej
		INY
		LDA	(loptr3),Y
		LDY	#2
		CPY	byte_CE
		BEQ	loc_80589
		AND	#$F

loc_80589:				; CODE XREF: sub_8056D+18j
		STA	loptr4
		LDA	#$93 ; 'ì'
		STA	hiptr4
		JMP	loc_8038F
; ---------------------------------------------------------------------------

loc_80592:				; CODE XREF: sub_8056D+4j
					; sub_8056D+6Bj ...
		JSR	sub_806A0
		ASL	A
		BCS	loc_8059B
		JMP	loc_805C2
; ---------------------------------------------------------------------------

loc_8059B:				; CODE XREF: sub_8056D+29j
		TXA
		AND	#$F
		CMP	#$F
		BNE	loc_805A8
		JSR	sub_806A0
		JMP	loc_80548
; ---------------------------------------------------------------------------

loc_805A8:				; CODE XREF: sub_8056D+33j
		AND	#7
		STA	loptr4
		JSR	sub_806A0
		LDY	#$11
		STA	(loptr3),Y
		INY
		LDA	loptr4
		STA	(loptr3),Y
		LDA	#$13
		STA	loptr4
		JSR	sub_80516
		JMP	loc_804FD
; ---------------------------------------------------------------------------

loc_805C2:				; CODE XREF: sub_8056D+2Bj
		JSR	sub_80556
; ---------------------------------------------------------------------------
		.WORD loc_805D3
		.WORD loc_805DB
		.WORD loc_805E5
		.WORD loc_805F5
		.WORD loc_8060F
		.WORD loc_80640
		.WORD loc_80656
; ---------------------------------------------------------------------------

loc_805D3:				; DATA XREF: sub_8056D+58o
		JSR	sub_806A0
		STA	byte_D2
		JMP	loc_80592
; End of function sub_8056D

; ---------------------------------------------------------------------------

loc_805DB:				; DATA XREF: sub_8056D+5Ao
		JSR	sub_806A0
		LDY	#$10
		STA	(loptr3),Y
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_805E5:				; DATA XREF: sub_8056D+5Co
		JSR	sub_806A0
		STA	loptr4
		LDY	#$13
		LDA	(loptr3),Y
		AND	#$3F ; '?'
		ORA	loptr4
		JMP	loc_80608
; ---------------------------------------------------------------------------

loc_805F5:				; DATA XREF: sub_8056D+5Eo
		JSR	sub_806A0
		LDY	#2
		CPY	byte_CE
		BEQ	loc_80608
		STA	loptr4
		LDY	#$13
		LDA	(loptr3),Y
		AND	#$C0 ; '¿'
		ORA	loptr4

loc_80608:				; CODE XREF: BANK5:85F2j BANK5:85FCj
		LDY	#$13
		STA	(loptr3),Y
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_8060F:				; DATA XREF: sub_8056D+60o
		JSR	sub_806A0
		TXA
		BEQ	loc_8061B
		CPX	byte_D3
		BEQ	loc_8062C
		INC	byte_D3

loc_8061B:				; CODE XREF: BANK5:8613j
		JSR	sub_806A0
		STA	loptr4
		JSR	sub_806A0
		STA	hiptr5
		LDA	loptr4
		STA	loptr5
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_8062C:				; CODE XREF: BANK5:8617j
		LDA	#0
		STA	byte_D3
		LDA	#2
		CLC
		ADC	loptr5
		STA	loptr5
		LDA	#0
		ADC	hiptr5
		STA	hiptr5
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_80640:				; DATA XREF: sub_8056D+62o
		LDA	#$14
		STA	loptr4

loc_80644:				; CODE XREF: BANK5:8651j
		JSR	sub_806A0
		LDY	loptr4
		STA	(loptr3),Y
		INC	loptr4
		LDY	loptr4
		CPY	#$18
		BNE	loc_80644
		JMP	loc_80592
; ---------------------------------------------------------------------------

loc_80656:				; DATA XREF: sub_8056D+64o
		LDA	loptr5
		SEC
		SBC	#1
		STA	loptr5
		LDA	hiptr5
		SBC	#0
		STA	hiptr5
		LDA	byte_C0
		AND	#$F
		STA	byte_C0
		LDA	#0
		STA	byte_C1
		LDA	byte_CF
		AND	#$FE ; '˛'
		STA	byte_CF
		LDY	#$A
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BNE	loc_8068F
		LDX	byte_CB
		INX
		INX
		LDY	byte_CE
		JSR	sub_80222
		LDY	#0
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BNE	loc_8068F
		RTS
; ---------------------------------------------------------------------------

loc_8068F:				; CODE XREF: BANK5:867Aj BANK5:868Cj
		LDY	#6
		LDA	(loptr3),Y
		AND	#$1F
		TAX
		JSR	sub_808E1
		LDA	#$C
		STA	loptr4
		JMP	sub_80516

; =============== S U B	R O U T	I N E =======================================


sub_806A0:				; CODE XREF: sub_8056D:loc_80592p
					; sub_8056D+35p ...
		LDY	#0
		LDA	(loptr5),Y
		TAX
		LDA	#1
		CLC
		ADC	loptr5
		STA	loptr5
		LDA	#0
		ADC	hiptr5
		STA	hiptr5
		TXA
		RTS
; End of function sub_806A0


; =============== S U B	R O U T	I N E =======================================


sub_806B4:				; CODE XREF: BANK5:8280p
		LDA	byte_C7
		BEQ	sub_806C3

loc_806B8:				; CODE XREF: sub_806B4+Cj
		PHA
		JSR	sub_806C3
		PLA
		SEC
		SBC	#1
		BNE	loc_806B8
		RTS
; End of function sub_806B4


; =============== S U B	R O U T	I N E =======================================


sub_806C3:				; CODE XREF: sub_806B4+2j sub_806B4+5p
		LDY	#5
		LDA	(loptr3),Y
		ASL	A
		BCC	sub_806D3
		LDA	byte_CA
		AND	#1
		BEQ	sub_806D3
		JSR	sub_806D3
; End of function sub_806C3


; =============== S U B	R O U T	I N E =======================================


sub_806D3:				; CODE XREF: sub_806C3+5j sub_806C3+Bj ...
		LDY	#2
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BEQ	loc_806FE
		LDX	#$FF
		DEY
		LDA	(loptr3),Y
		SEC
		SBC	#4
		STA	(loptr3),Y
		TXA
		INY
		ADC	(loptr3),Y
		STA	(loptr3),Y
		DEY
		ORA	(loptr3),Y
		BEQ	loc_806FE
		LDY	#$A
		LDA	(loptr3),Y
		INY
		ORA	(loptr3),Y
		BNE	loc_806FB
		RTS
; ---------------------------------------------------------------------------

loc_806FB:				; CODE XREF: sub_806D3+25j
		JMP	loc_802EC
; ---------------------------------------------------------------------------

loc_806FE:				; CODE XREF: sub_806D3+7j
					; sub_806D3+1Cj
		LDY	#5
		LDA	(loptr3),Y
		AND	#$7F ; ''
		STA	(loptr3),Y
; End of function sub_806D3


; =============== S U B	R O U T	I N E =======================================


sub_80706:				; CODE XREF: sub_80706+12p
					; sub_80706+B7j ...
		JSR	sub_80935
		AND	#$F0 ; ''
		BNE	loc_80710
		JMP	loc_807C0
; ---------------------------------------------------------------------------

loc_80710:				; CODE XREF: sub_80706+5j
		CMP	#$20 ; ' '
		BNE	loc_8071F
		TXA
		AND	#7
		PHA
		JSR	sub_80706
		PLA
		JMP	loc_807A2
; ---------------------------------------------------------------------------

loc_8071F:				; CODE XREF: sub_80706+Cj
		CMP	#$30 ; '0'
		BNE	loc_80726
		JMP	loc_807B5
; ---------------------------------------------------------------------------

loc_80726:				; CODE XREF: sub_80706+1Bj
		TXA
		ROL	A
		ROL	A
		ROL	A
		ROL	A
		AND	#7
		TAY
		LDA	byte_80975,Y
		JSR	sub_80954

loc_80734:				; CODE XREF: BANK5:888Aj
		LDY	#6
		LDA	(loptr3),Y
		AND	#$E0 ; '‡'
		BEQ	loc_80752
		SEC
		SBC	#$20 ; ' '
		STA	loptr4
		LDA	(loptr3),Y
		AND	#$1F
		ORA	loptr4
		STA	(loptr3),Y
		LDA	byte_CF
		LSR	A
		BCC	loc_8074F
		RTS
; ---------------------------------------------------------------------------

loc_8074F:				; CODE XREF: sub_80706+46j
		JMP	loc_80548
; ---------------------------------------------------------------------------

loc_80752:				; CODE XREF: sub_80706+34j
		TXA
		AND	#$1F
		BNE	loc_8075B
		TAX
		JMP	loc_8077D
; ---------------------------------------------------------------------------

loc_8075B:				; CODE XREF: sub_80706+4Fj
		LDY	#1
		CPY	byte_CE
		BNE	loc_80766
		LDX	#0
		JMP	loc_8077D
; ---------------------------------------------------------------------------

loc_80766:				; CODE XREF: sub_80706+59j
		ASL	A
		LDY	#7
		CLC
		ADC	(loptr3),Y
		STA	loptr4
		LDA	#0
		INY
		ADC	(loptr3),Y
		STA	hiptr4
		LDY	#1
		LDA	(loptr4),Y
		TAX
		DEY
		LDA	(loptr4),Y

loc_8077D:				; CODE XREF: sub_80706+52j
					; sub_80706+5Dj
		LDY	#$A
		STA	(loptr3),Y
		INY
		TXA
		STA	(loptr3),Y
		LDY	#$D
		LDA	(loptr3),Y
		STA	loptr4
		AND	#$7F ; ''
		BEQ	loc_80792
		JSR	sub_808A9

loc_80792:				; CODE XREF: sub_80706+87j
		LDA	byte_CF
		LSR	A
		BCC	loc_80798
		RTS
; ---------------------------------------------------------------------------

loc_80798:				; CODE XREF: sub_80706+8Fj
		LDA	#$C
		STA	loptr4
		JSR	sub_80516
		JMP	loc_804FD
; ---------------------------------------------------------------------------

loc_807A2:				; CODE XREF: sub_80706+16j
		ROR	A
		ROR	A
		ROR	A
		ROR	A
		AND	#$E0 ; '‡'
		STA	loptr4
		LDY	#6
		LDA	(loptr3),Y
		AND	#$1F
		ORA	loptr4
		STA	(loptr3),Y
		RTS
; ---------------------------------------------------------------------------

loc_807B5:				; CODE XREF: sub_80706+1Dj
		LDA	#$80 ; 'Ä'
		LDY	#5
		ORA	(loptr3),Y
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_807C0:				; CODE XREF: sub_80706+7j
		JSR	sub_80556
; ---------------------------------------------------------------------------
		.WORD loc_807D7
		.WORD loc_807E1
		.WORD loc_807EB
		.WORD loc_807FB
		.WORD loc_80815
		.WORD loc_8085D
		.WORD loc_8087A
		.WORD loc_8088D
		.WORD loc_808C7
		.WORD loc_80917
; ---------------------------------------------------------------------------

loc_807D7:				; DATA XREF: sub_80706+BDo
		JSR	sub_80935
		LDY	#4
		STA	(loptr3),Y
		JMP	sub_80706
; End of function sub_80706

; ---------------------------------------------------------------------------

loc_807E1:				; DATA XREF: sub_80706+BFo
		JSR	sub_80935
		LDY	#9
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_807EB:				; DATA XREF: sub_80706+C1o
		JSR	sub_80935
		STA	loptr4
		LDY	#$C
		LDA	(loptr3),Y
		AND	#$3F ; '?'
		ORA	loptr4
		JMP	loc_8080E
; ---------------------------------------------------------------------------

loc_807FB:				; DATA XREF: sub_80706+C3o
		JSR	sub_80935
		LDY	#2
		CPY	byte_CE
		BEQ	loc_8080E
		STA	loptr4
		LDY	#$C
		LDA	(loptr3),Y
		AND	#$C0 ; '¿'
		ORA	loptr4

loc_8080E:				; CODE XREF: BANK5:87F8j BANK5:8802j
		LDY	#$C
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_80815:				; DATA XREF: sub_80706+C5o
		JSR	sub_80935
		TXA
		BEQ	loc_80831
		LDY	#5
		LDA	(loptr3),Y
		AND	#$7F ; ''
		STA	loptr4
		CPX	loptr4
		BEQ	loc_80844
		INC	loptr4
		LDA	(loptr3),Y
		AND	#$80 ; 'Ä'
		ORA	loptr4
		STA	(loptr3),Y

loc_80831:				; CODE XREF: BANK5:8819j
		JSR	sub_80935
		PHA
		JSR	sub_80935
		PLA
		LDY	#0
		STA	(loptr3),Y
		INY
		TXA
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_80844:				; CODE XREF: BANK5:8825j
		LDA	(loptr3),Y
		AND	#$80 ; 'Ä'
		STA	(loptr3),Y
		LDY	#0
		LDA	#2
		CLC
		ADC	(loptr3),Y
		STA	(loptr3),Y
		INY
		LDA	#0
		ADC	(loptr3),Y
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_8085D:				; DATA XREF: sub_80706+C7o
		JSR	sub_80935
		LDX	#<a8985
		LDY	#>a8985
		STX	loptr4
		STY	hiptr4
		ASL	A
		LDY	#7
		CLC
		ADC	loptr4
		STA	(loptr3),Y
		LDA	#0
		ADC	hiptr4
		INY
		STA	(loptr3),Y
		JMP	sub_80706
; ---------------------------------------------------------------------------

loc_8087A:				; DATA XREF: sub_80706+C9o
		JSR	sub_80935
		ROL	A
		ROL	A
		ROL	A
		ROL	A
		AND	#7
		TAY
		LDA	unk_8097D,Y
		JSR	sub_80954
		JMP	loc_80734
; ---------------------------------------------------------------------------

loc_8088D:				; DATA XREF: sub_80706+CBo
		JSR	sub_80935
		LDY	#$D
		STA	(loptr3),Y
		PHA
		JSR	sub_80935
		LDY	#$F
		STA	(loptr3),Y
		PLA
		STA	loptr4
		AND	#$7F ; ''
		BEQ	loc_808A6
		JSR	sub_808A9

loc_808A6:				; CODE XREF: BANK5:88A1j
		JMP	sub_80706

; =============== S U B	R O U T	I N E =======================================


sub_808A9:				; CODE XREF: sub_80706+89p BANK5:88A3p
		LDA	#0
		LDY	#$E
		STA	(loptr3),Y
		LDA	loptr4
		BPL	loc_808B8
		LDA	#$F
		JMP	loc_808BA
; ---------------------------------------------------------------------------

loc_808B8:				; CODE XREF: sub_808A9+8j
		LDA	#0

loc_808BA:				; CODE XREF: sub_808A9+Cj
		STA	loptr4
		LDY	#$F
		LDA	(loptr3),Y
		AND	#$F0 ; ''
		ORA	loptr4
		STA	(loptr3),Y
		RTS
; End of function sub_808A9

; ---------------------------------------------------------------------------

loc_808C7:				; DATA XREF: sub_80706+CDo
		JSR	sub_80935
		STA	loptr4
		LDY	#6
		LDA	(loptr3),Y
		AND	#$E0 ; '‡'
		ORA	loptr4
		STA	(loptr3),Y
		LDA	byte_CF
		LSR	A
		BCS	loc_808DE
		JSR	sub_808E1

loc_808DE:				; CODE XREF: BANK5:88D9j
		JMP	sub_80706

; =============== S U B	R O U T	I N E =======================================


sub_808E1:				; CODE XREF: BANK5:8696p BANK5:88DBp
		TXA
		BEQ	loc_808EC
		LDA	#0

loc_808E6:				; CODE XREF: sub_808E1+9j
		CLC
		ADC	#4
		DEX
		BNE	loc_808E6

loc_808EC:				; CODE XREF: sub_808E1+1j
		CLC
		ADC	byte_7FC
		STA	loptr4
		LDA	#0
		ADC	byte_7FD
		STA	hiptr4
		LDX	#0
		LDY	#$14

loc_808FD:				; CODE XREF: sub_808E1+33j
		LDA	(loptr4,X)
		STA	(loptr3),Y
		INY
		CPY	#$18
		BNE	loc_80907
		RTS
; ---------------------------------------------------------------------------

loc_80907:				; CODE XREF: sub_808E1+23j
		LDA	#1
		CLC
		ADC	loptr4
		STA	loptr4
		LDA	#0
		ADC	hiptr4
		STA	hiptr4
		JMP	loc_808FD
; End of function sub_808E1

; ---------------------------------------------------------------------------

loc_80917:				; DATA XREF: sub_80706+CFo
		LDY	#0
		LDA	#0
		STA	(loptr3),Y
		INY
		STA	(loptr3),Y
		LDA	byte_C0
		AND	#$F0 ; ''
		STA	byte_C0
		LDA	byte_CF
		LSR	A
		BCC	loc_8092C
		RTS
; ---------------------------------------------------------------------------

loc_8092C:				; CODE XREF: BANK5:8929j
		LDX	byte_CB
		INX
		INX
		LDY	byte_CE
		JMP	sub_80222

; =============== S U B	R O U T	I N E =======================================


sub_80935:				; CODE XREF: sub_80706p
					; sub_80706:loc_807D7p	...
		LDY	#0
		LDA	(loptr3),Y
		STA	loptr4
		INY
		LDA	(loptr3),Y
		STA	hiptr4
		DEY
		LDA	(loptr4),Y
		TAX
		LDA	#1
		CLC
		ADC	loptr4
		STA	(loptr3),Y
		LDA	#0
		ADC	hiptr4
		INY
		STA	(loptr3),Y
		TXA
		RTS
; End of function sub_80935


; =============== S U B	R O U T	I N E =======================================


sub_80954:				; CODE XREF: sub_80706+2Bp BANK5:8887p
		STA	loptr4
		LDA	#0
		STA	hiptr4
		LDY	#4
		LDA	(loptr3),Y
		TAY
		LDA	#0

loc_80961:				; CODE XREF: sub_80954+15j
		CLC
		ADC	loptr4
		BCC	loc_80968
		INC	hiptr4

loc_80968:				; CODE XREF: sub_80954+10j
		DEY
		BNE	loc_80961
		LDY	#2
		STA	(loptr3),Y
		INY
		LDA	hiptr4
		STA	(loptr3),Y
		RTS
; End of function sub_80954

; ---------------------------------------------------------------------------
byte_80975:	.BYTE 0			; DATA XREF: sub_80706+28r
		.BYTE 0
		.BYTE	2
		.BYTE	4
		.BYTE	8
		.BYTE $10
		.BYTE $20
		.BYTE $40 ; @
unk_8097D:	.BYTE	0		; DATA XREF: BANK5:8884r
		.BYTE	0
		.BYTE	3
		.BYTE	6
		.BYTE  $C
		.BYTE $18
		.BYTE $30 ; 0
		.BYTE $60 ; `
a8985:		.BYTE	0		; DATA XREF: BANK5:8860t BANK5:8862t
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE $F2 ; Ú
		.BYTE	7
		.BYTE $D6 ; ÷
		.BYTE	7
		.BYTE $14
		.BYTE	7
		.BYTE $AE ; Æ
		.BYTE	6
		.BYTE $4E ; N
		.BYTE	6
		.BYTE $F3 ; Û
		.BYTE	5
		.BYTE $9E ; û
		.BYTE	5
		.BYTE $4D ; M
		.BYTE	5
		.BYTE	1
		.BYTE	5
		.BYTE $BB ; ª
		.BYTE	4
		.BYTE $75 ; u
		.BYTE	4
		.BYTE $36 ; 6
		.BYTE	4
		.BYTE $F9 ; ˘
		.BYTE	3
		.BYTE $BF ; ø
		.BYTE	3
		.BYTE $8A ; ä
		.BYTE	3
		.BYTE $57 ; W
		.BYTE	3
		.BYTE $27 ; '
		.BYTE	3
		.BYTE $FA ; ˙
		.BYTE	2
		.BYTE $CF ; œ
		.BYTE	2
		.BYTE $A7 ; ß
		.BYTE	2
		.BYTE $81 ; Å
		.BYTE	2
		.BYTE $5D ; ]
		.BYTE	2
		.BYTE $3B ; ;
		.BYTE	2
		.BYTE $1A
		.BYTE	2
		.BYTE $FC ; ¸
		.BYTE	1
		.BYTE $E0 ; ‡
		.BYTE	1
		.BYTE $C5 ; ≈
		.BYTE	1
		.BYTE $AB ; ´
		.BYTE	1
		.BYTE $93 ; ì
		.BYTE	1
		.BYTE $7D ; }
		.BYTE	1
		.BYTE $67 ; g
		.BYTE	1
		.BYTE $53 ; S
		.BYTE	1
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $2E ; .
		.BYTE	1
		.BYTE $1D
		.BYTE	1
		.BYTE  $D
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE	0
		.BYTE $F0 ; 
		.BYTE	0
		.BYTE $E2 ; ‚
		.BYTE	0
		.BYTE $D5 ; ’
		.BYTE	0
		.BYTE $C9 ; …
		.BYTE	0
		.BYTE $BE ; æ
		.BYTE	0
		.BYTE $B3 ; ≥
		.BYTE	0
		.BYTE $A9 ; ©
		.BYTE	0
		.BYTE $A0 ; †
		.BYTE	0
		.BYTE $97 ; ó
		.BYTE	0
		.BYTE $8E ; é
		.BYTE	0
		.BYTE $86 ; Ü
		.BYTE	0
		.BYTE $7F ; 
		.BYTE	0
		.BYTE $78 ; x
		.BYTE	0
		.BYTE $71 ; q
		.BYTE	0
		.BYTE $6A ; j
		.BYTE	0
		.BYTE $64 ; d
		.BYTE	0
		.BYTE $5F ; _
		.BYTE	0
		.BYTE $59 ; Y
		.BYTE	0
		.BYTE $54 ; T
		.BYTE	0
		.BYTE $50 ; P
		.BYTE	0
		.BYTE $4B ; K
		.BYTE	0
		.BYTE $47 ; G
		.BYTE	0
		.BYTE $43 ; C
		.BYTE	0
		.BYTE $3F ; ?
		.BYTE	0
		.BYTE $3C ; <
		.BYTE	0
		.BYTE $38 ; 8
		.BYTE	0
		.BYTE $35 ; 5
		.BYTE	0
		.BYTE $32 ; 2
		.BYTE	0
		.BYTE $2F ; /
		.BYTE	0
		.BYTE $2C ; ,
		.BYTE	0
		.BYTE $2A ; *
		.BYTE	0
		.BYTE $28 ; (
		.BYTE	0
		.BYTE $25 ; %
		.BYTE	0
		.BYTE $23 ; #
		.BYTE	0
		.BYTE $21 ; !
		.BYTE	0
		.BYTE $1F
		.BYTE	0
		.BYTE $1E
		.BYTE	0
		.BYTE $1C
		.BYTE	0
		.BYTE $1A
		.BYTE	0
		.BYTE $19
		.BYTE	0
		.BYTE $17
		.BYTE	0
		.BYTE $16
		.BYTE	0
		.BYTE $15
		.BYTE	0
		.BYTE $14
		.BYTE	0
		.BYTE $12
		.BYTE	0
		.BYTE $11
		.BYTE	0
		.BYTE $10
		.BYTE	0
		.BYTE  $F
		.BYTE	0
		.BYTE  $F
		.BYTE	0
		.BYTE  $E
		.BYTE	0
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		.BYTE $FF
		;.BYTE $FF
		;.BYTE $FF
off_80A50:	.WORD unk_80AAA		; DATA XREF: BANK5:8031r BANK5:8036r
		.WORD unk_80CF6
		.WORD byte_80F9F
		.WORD unk_8114C
		.WORD unk_8135D
		.WORD unk_815BF
		.WORD unk_81675
		.WORD unk_81799
		.WORD unk_81873
		.WORD unk_81A9A
		.WORD unk_81BBD
		.WORD unk_81C68
		.WORD unk_81D09
		.WORD unk_81E2B
		.WORD unk_81F77
		.WORD unk_82136
		.WORD unk_82168
		.WORD unk_82183
		.WORD unk_82196
		.WORD unk_821B1
		.WORD unk_821C7
		.WORD unk_821D4
		.WORD unk_821E1
		.WORD unk_8220E
		.WORD unk_82221
		.WORD unk_8223C
		.WORD unk_82245
		.WORD unk_8226E
		.WORD unk_82287
		.WORD unk_822A0
		.WORD morze2
               
		.WORD unk_8244D
		.WORD unk_8247A
		.WORD unk_824A0
		.WORD unk_824DF
		.WORD unk_82530
		.WORD unk_82573
		.WORD unk_82586
		.WORD unk_82695
		.WORD unk_826DF
		.WORD unk_826E8
		.WORD unk_82701
		.WORD unk_82755
		.WORD unk_82768
		.WORD unk_82784
unk_80AAA:	.BYTE  $F		; DATA XREF: BANK5:off_80A50o
		.WORD unk_80AB5
		.WORD unk_80B65
		.WORD unk_80C00
		.WORD unk_80CBA
		.WORD unk_80CEA
unk_80AB5:	.BYTE	0		; DATA XREF: BANK5:8AABo
		.BYTE	5
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $50 ; P
		.BYTE	5
		.BYTE $1B
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
unk_80AE0:	.BYTE	8		; DATA XREF: BANK5:8B63o
		.BYTE	0
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $10
		.BYTE $96 ; ñ
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $A0 ; †
		.BYTE $91 ; ë
		.BYTE $96 ; ñ
		.BYTE $21 ; !
		.BYTE $94 ; î
		.BYTE $F4 ; Ù
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $10
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE $92 ; í
		.BYTE $A0 ; †
		.BYTE $92 ; í
		.BYTE $8F ; è
		.BYTE $92 ; í
		.BYTE	6
		.BYTE $93 ; ì
		.BYTE	6
		.BYTE $8F ; è
		.BYTE $93 ; ì
		.BYTE	6
		.BYTE $95 ; ï
		.BYTE	6
		.BYTE $91 ; ë
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $A0 ; †
		.BYTE $91 ; ë
		.BYTE $96 ; ñ
		.BYTE $21 ; !
		.BYTE $94 ; î
		.BYTE $F4 ; Ù
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE $92 ; í
		.BYTE $A0 ; †
		.BYTE $92 ; í
		.BYTE $8F ; è
		.BYTE $92 ; í
		.BYTE	6
		.BYTE $93 ; ì
		.BYTE	6
		.BYTE $8F ; è
		.BYTE $93 ; ì
		.BYTE	6
		.BYTE $95 ; ï
		.BYTE	6
		.BYTE $91 ; ë
		.BYTE $98 ; ò
		.BYTE	8
		.BYTE	1
		.BYTE $21 ; !
		.BYTE $FA ; ˙
		.BYTE $FA ; ˙
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	8
		.BYTE	2
		.BYTE	6
		.BYTE $CE ; Œ
		.BYTE $8F ; è
		.BYTE $90 ; ê
		.BYTE $F1 ; Ò
		.BYTE $D3 ; ”
		.BYTE $80 ; Ä
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $FA ; ˙
		.BYTE $21 ; !
		.BYTE $DB ; €
		.BYTE $9B ; õ
		.BYTE	5
		.BYTE $27 ; '
		.BYTE $B3 ; ≥
		.BYTE	5
		.BYTE $1B
		.BYTE $9D ; ù
		.BYTE $FB ; ˚
		.BYTE $21 ; !
		.BYTE $D8 ; ÿ
		.BYTE $98 ; ò
		.BYTE $BB ; ª
		.BYTE $9A ; ö
		.BYTE $D6 ; ÷
		.BYTE $80 ; Ä
		.BYTE $95 ; ï
		.BYTE $93 ; ì
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $CE ; Œ
		.BYTE $8F ; è
		.BYTE $90 ; ê
		.BYTE $F1 ; Ò
		.BYTE $D3 ; ”
		.BYTE $80 ; Ä
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $FA ; ˙
		.BYTE $21 ; !
		.BYTE $DB ; €
		.BYTE $9B ; õ
		.BYTE	5
		.BYTE $27 ; '
		.BYTE $B3 ; ≥
		.BYTE	5
		.BYTE $1B
		.BYTE $9D ; ù
		.BYTE $FB ; ˚
		.BYTE $D8 ; ÿ
		.BYTE $B1 ; ±
		.BYTE $9B ; õ
		.BYTE $9A ; ö
		.BYTE $F6 ; ˆ
		.BYTE $E0 ; ‡
		.BYTE	4
		.BYTE	0
		.WORD unk_80AE0
unk_80B65:	.BYTE	0		; DATA XREF: BANK5:8AADo
		.BYTE	5
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $D0 ; –
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $1B
		.BYTE $E0 ; ‡
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
unk_80B83:	.BYTE	2		; DATA XREF: BANK5:8BFEo
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $10
		.BYTE	5
		.BYTE $1B
		.BYTE $91 ; ë
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $A0 ; †
		.BYTE $8D ; ç
		.BYTE $91 ; ë
		.BYTE $21 ; !
		.BYTE $91 ; ë
		.BYTE $F1 ; Ò
		.BYTE $8D ; ç
		.BYTE $80 ; Ä
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE $8D ; ç
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE	6
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $8C ; å
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $A0 ; †
		.BYTE $8D ; ç
		.BYTE $91 ; ë
		.BYTE $21 ; !
		.BYTE $91 ; ë
		.BYTE $F1 ; Ò
		.BYTE $8D ; ç
		.BYTE $80 ; Ä
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE $8D ; ç
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE	6
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $8C ; å
		.BYTE $95 ; ï
		.BYTE	8
		.BYTE	1
		.BYTE $21 ; !
		.BYTE $F6 ; ˆ
		.BYTE $F6 ; ˆ
		.BYTE	8
		.BYTE	2
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE $AF ; Ø
		.BYTE $50 ; P
		.BYTE	6
		.BYTE $CA ;  
		.BYTE $8B ; ã
		.BYTE $8C ; å
		.BYTE $EE ; Ó
		.BYTE $CF ; œ
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $95 ; ï
		.BYTE $F6 ; ˆ
		.BYTE $21 ; !
		.BYTE $D8 ; ÿ
		.BYTE $98 ; ò
		.BYTE $BB ; ª
		.BYTE $9A ; ö
		.BYTE $F8 ; ¯
		.BYTE $21 ; !
		.BYTE $D5 ; ’
		.BYTE $95 ; ï
		.BYTE $B8
		.BYTE $95 ; ï
		.BYTE $D1
		.BYTE $80 ; Ä
		.BYTE $91
		.BYTE $8F ; è
		.BYTE $8C
		.BYTE	6
		.BYTE $CA ;  
		.BYTE $8B ; ã
		.BYTE $8C ; å
		.BYTE $EE ; Ó
		.BYTE $CF ; œ
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $95 ; ï
		.BYTE $F6 ; ˆ
		.BYTE $21 ; !
		.BYTE $D8 ; ÿ
		.BYTE $98 ; ò
		.BYTE $BB ; ª
		.BYTE $9A ; ö
		.BYTE $F8 ; ¯
		.BYTE $D5 ; ’
		.BYTE $AC ; ¨
		.BYTE $98 ; ò
		.BYTE $95 ; ï
		.BYTE $F1 ; Ò
		.BYTE $E0 ; ‡
		.BYTE	4
		.BYTE	0
		.WORD unk_80B83
unk_80C00:	.BYTE	0		; DATA XREF: BANK5:8AAFo
		.BYTE	5
		.BYTE	3
		.BYTE $50 ; P
		.BYTE	5
		.BYTE $1B
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $62 ; b
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $64 ; d
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $66 ; f
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $67 ; g
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
unk_80C26:	.BYTE	5		; DATA XREF: BANK5:8CB8o
		.BYTE $27 ; '
		.BYTE	3
		.BYTE $3F ; ?
unk_80C2A:	.BYTE $8A ; ä		; DATA XREF: BANK5:8C4Co
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $87 ; á
		.BYTE $87 ; á
		.BYTE $87 ; á
		.BYTE $87 ; á
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE	4
		.BYTE	1
		.WORD unk_80C2A
		.BYTE	3
		.BYTE $81 ; Å
unk_80C50:	.BYTE $8A ; ä		; DATA XREF: BANK5:8C53o
		.BYTE	4
		.BYTE  $F
		.WORD unk_80C50
		.BYTE $AA ; ™
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE $A0 ; †
		.BYTE $A9 ; ©
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $A9 ; ©
		.BYTE $A0 ; †
		.BYTE $A7 ; ß
		.BYTE $80 ; Ä
		.BYTE $87 ; á
		.BYTE $A7 ; ß
		.BYTE $A0 ; †
		.BYTE $AA ; ™
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE $A0 ; †
		.BYTE $AC ; ¨
		.BYTE $80 ; Ä
		.BYTE $8C ; å
		.BYTE $AC ; ¨
		.BYTE $A0 ; †
		.BYTE $A9 ; ©
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $A9 ; ©
		.BYTE $A0 ; †
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE $85 ; Ö
		.BYTE $A5 ; •
		.BYTE $A0 ; †
		.BYTE $AA ; ™
		.BYTE $A9 ; ©
		.BYTE $A7 ; ß
		.BYTE $A5 ; •
		.BYTE $AA ; ™
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE $A0 ; †
		.BYTE $A9 ; ©
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $A9 ; ©
		.BYTE $A0 ; †
		.BYTE $A7 ; ß
		.BYTE $80 ; Ä
		.BYTE $87 ; á
		.BYTE $A7 ; ß
		.BYTE $A0 ; †
		.BYTE $AA ; ™
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE $A0 ; †
		.BYTE $AC ; ¨
		.BYTE $80 ; Ä
		.BYTE $8C ; å
		.BYTE $AC ; ¨
		.BYTE $A0 ; †
		.BYTE $A9 ; ©
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $A9 ; ©
		.BYTE $A0 ; †
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE $85 ; Ö
		.BYTE $A5 ; •
		.BYTE $A0 ; †
		.BYTE	3
		.BYTE $45 ; E
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
unk_80CAD:	.BYTE $6A ; j		; DATA XREF: BANK5:8CB0o
		.BYTE	4
		.BYTE	7
		.WORD unk_80CAD
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE	4
		.BYTE	0
		.WORD unk_80C26
unk_80CBA:	.BYTE	0		; DATA XREF: BANK5:8AB1o
		.BYTE	5
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_80CC1:	.BYTE $30 ; 0		; DATA XREF: BANK5:8CC5o
		.BYTE $63 ; c
		.BYTE	4
		.BYTE $2F
		.WORD unk_80CC1
unk_80CC7:	.BYTE $63 ; c		; DATA XREF: BANK5:8CD3o BANK5:8CE8o
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	9
		.WORD unk_80CC7
unk_80CD5:	.BYTE $83 ; É		; DATA XREF: BANK5:8CDAo
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE $3F ; ?
		.WORD unk_80CD5
unk_80CDC:	.BYTE $30 ; 0		; DATA XREF: BANK5:8CE0o
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $B
		.WORD unk_80CDC
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	0
		.WORD unk_80CC7
unk_80CEA:	.BYTE	0		; DATA XREF: BANK5:8AB3o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $22 ; "
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $21 ; !
		.BYTE $80 ; Ä
		.BYTE	0
unk_80CF6:	.BYTE  $F		; DATA XREF: BANK5:8A52o
		.WORD unk_80D01
		.WORD unk_80E18
		.WORD unk_80EC6
		.WORD unk_80F54
		.WORD unk_80F97
unk_80D01:	.BYTE	0		; DATA XREF: BANK5:8CF7o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
unk_80D05:	.BYTE	8		; DATA XREF: BANK5:8E16o
		.BYTE	0
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $50 ; P
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE $22 ; "
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $92 ; í
		.BYTE $91 ; ë
		.BYTE $AF ; Ø
		.BYTE $CD ; Õ
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $89 ; â
		.BYTE $8A ; ä
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $10
		.BYTE $21 ; !
		.BYTE $F2 ; Ú
		.BYTE $D2 ; “
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE $EC ; Ï
		.BYTE $E8 ; Ë
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $50 ; P
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $D4 ; ‘
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE $CD ; Õ
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $89 ; â
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $B6 ; ∂
		.BYTE $21 ; !
		.BYTE $F2 ; Ú
		.BYTE $B2 ; ≤
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $21 ; !
		.BYTE $E8 ; Ë
		.BYTE $A8 ; ®
		.BYTE $80 ; Ä
		.BYTE $A9 ; ©
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE $91 ; ë
		.BYTE $8A ; ä
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE $2E ; .
		.BYTE $30 ; 0
		.BYTE $7D ; }
		.BYTE $30 ; 0
		.BYTE $7C ; |
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $69 ; i
		.BYTE $30 ; 0
		.BYTE $68 ; h
		.BYTE $30 ; 0
		.BYTE $67 ; g
		.BYTE $30 ; 0
		.BYTE $66 ; f
		.BYTE	5
		.BYTE $22 ; "
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE $89 ; â
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $89 ; â
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE $2E ; .
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $69 ; i
		.BYTE $30 ; 0
		.BYTE $68 ; h
		.BYTE $30 ; 0
		.BYTE $67 ; g
		.BYTE $30 ; 0
		.BYTE $66 ; f
		.BYTE $30 ; 0
		.BYTE $65 ; e
		.BYTE $30 ; 0
		.BYTE $64 ; d
		.BYTE	5
		.BYTE $22 ; "
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $88 ; à
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE $2E ; .
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $69 ; i
		.BYTE $30 ; 0
		.BYTE $68 ; h
		.BYTE $30 ; 0
		.BYTE $67 ; g
		.BYTE $30 ; 0
		.BYTE $66 ; f
		.BYTE $30 ; 0
		.BYTE $65 ; e
		.BYTE $30 ; 0
		.BYTE $64 ; d
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $62 ; b
		.BYTE $30 ; 0
		.BYTE $61 ; a
		.BYTE	5
		.BYTE $22 ; "
		.BYTE $86 ; Ü
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE $8A ; ä
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $86 ; Ü
		.BYTE $E5 ; Â
		.BYTE	8
		.BYTE	1
		.BYTE $F1 ; Ò
		.BYTE	4
		.BYTE	0
		.WORD unk_80D05
unk_80E18:	.BYTE	0		; DATA XREF: BANK5:8CF9o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	8
		.BYTE	0
unk_80E1E:	.BYTE	3		; DATA XREF: BANK5:8EC4o
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $50 ; P
		.BYTE	5
		.BYTE $16
		.BYTE	6
		.BYTE $B2 ; ≤
		.BYTE	6
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE	6
		.BYTE $B9 ; π
		.BYTE $99 ; ô
		.BYTE $98 ; ò
		.BYTE $B8 ; ∏
		.BYTE $B6 ; ∂
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE $8A ; ä
		.BYTE $89 ; â
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE	3
		.BYTE $39 ; 9
unk_80E45:	.BYTE $30 ; 0		; DATA XREF: BANK5:8E5Fo
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $92 ; í
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $99 ; ô
		.BYTE $30 ; 0
		.BYTE $9E ; û
		.BYTE $30 ; 0
		.BYTE $99 ; ô
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $92 ; í
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE	4
		.BYTE	1
		.WORD unk_80E45
unk_80E61:	.BYTE $30 ; 0		; DATA XREF: BANK5:8E7Fo
		.BYTE $88 ; à
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $30 ; 0
		.BYTE $9B ; õ
		.BYTE	5
		.BYTE $22 ; "
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE	5
		.BYTE $16
		.BYTE $30 ; 0
		.BYTE $9B ; õ
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE	4
		.BYTE	1
		.WORD unk_80E61
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $50 ; P
		.BYTE	6
		.BYTE $B2 ; ≤
		.BYTE	6
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE $DD ; ›
		.BYTE $80 ; Ä
		.BYTE $98 ; ò
		.BYTE $98 ; ò
		.BYTE $98 ; ò
		.BYTE $B6 ; ∂
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $70 ; p
		.BYTE $AA ; ™
		.BYTE $A9 ; ©
		.BYTE $AA ; ™
		.BYTE	6
		.BYTE $C6 ; ∆
		.BYTE $AA ; ™
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $B2 ; ≤
		.BYTE $B2 ; ≤
		.BYTE	6
		.BYTE $C8 ; »
		.BYTE $AC ; ¨
		.BYTE	6
		.BYTE $CF ; œ
		.BYTE $A9 ; ©
		.BYTE $EA ; Í
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $AD ; ≠
		.BYTE $B1 ; ±
		.BYTE $8A ; ä
		.BYTE $E9 ; È
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $89 ; â
		.BYTE $E8 ; Ë
		.BYTE	6
		.BYTE $A8 ; ®
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $88 ; à
		.BYTE $C6 ; ∆
		.BYTE $C8 ; »
		.BYTE $EA ; Í
		.BYTE $F6 ; ˆ
		.BYTE	4
		.BYTE	0
		.WORD unk_80E1E
unk_80EC6:	.BYTE	0		; DATA XREF: BANK5:8CFBo
		.BYTE	6
unk_80EC8:	.BYTE	3		; DATA XREF: BANK5:8F52o
		.BYTE $4F ; O
		.BYTE	5
		.BYTE $22 ; "
unk_80ECC:	.BYTE $86 ; Ü		; DATA XREF: BANK5:8ED0o
		.BYTE $92 ; í
		.BYTE	4
		.BYTE	3
		.WORD unk_80ECC
unk_80ED2:	.BYTE $88 ; à		; DATA XREF: BANK5:8ED6o
		.BYTE $94 ; î
		.BYTE	4
		.BYTE	3
		.WORD unk_80ED2
		.BYTE $8D ; ç
		.BYTE $99 ; ô
		.BYTE $8D ; ç
		.BYTE $99 ; ô
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $89 ; â
		.BYTE $95 ; ï
unk_80EE0:	.BYTE $8A ; ä		; DATA XREF: BANK5:8EE4o
		.BYTE $96 ; ñ
		.BYTE	4
		.BYTE	3
		.WORD unk_80EE0
unk_80EE6:	.BYTE $86 ; Ü		; DATA XREF: BANK5:8EEAo
		.BYTE $92 ; í
		.BYTE	4
		.BYTE	7
		.WORD unk_80EE6
unk_80EEC:	.BYTE $88 ; à		; DATA XREF: BANK5:8EF0o
		.BYTE $94 ; î
		.BYTE	4
		.BYTE	7
		.WORD unk_80EEC
unk_80EF2:	.BYTE $86 ; Ü		; DATA XREF: BANK5:8EF6o
		.BYTE $92 ; í
		.BYTE	4
		.BYTE	3
		.WORD unk_80EF2
unk_80EF8:	.BYTE $88 ; à		; DATA XREF: BANK5:8EFCo
		.BYTE $94 ; î
		.BYTE	4
		.BYTE	3
		.WORD unk_80EF8
unk_80EFE:	.BYTE $85 ; Ö		; DATA XREF: BANK5:8F02o
		.BYTE $91 ; ë
		.BYTE	4
		.BYTE	3
		.WORD unk_80EFE
unk_80F04:	.BYTE $8A ; ä		; DATA XREF: BANK5:8F08o
		.BYTE $96 ; ñ
		.BYTE	4
		.BYTE	3
		.WORD unk_80F04
unk_80F0A:	.BYTE $86 ; Ü		; DATA XREF: BANK5:8F0Eo
		.BYTE $92 ; í
		.BYTE	4
		.BYTE	7
		.WORD unk_80F0A
unk_80F10:	.BYTE $88 ; à		; DATA XREF: BANK5:8F14o
		.BYTE $94 ; î
		.BYTE	4
		.BYTE	5
		.WORD unk_80F10
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE	5
		.BYTE $22 ; "
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $8A ; ä
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $8A ; ä
		.BYTE $80 ; Ä
		.BYTE $AA ; ™
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $89 ; â
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $89 ; â
		.BYTE $80 ; Ä
		.BYTE $A9 ; ©
		.BYTE $89 ; â
		.BYTE	6
		.BYTE $A8 ; ®
		.BYTE $88 ; à
		.BYTE $80 ; Ä
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE	6
		.BYTE $A8 ; ®
		.BYTE $88 ; à
		.BYTE $80 ; Ä
		.BYTE $A8 ; ®
		.BYTE $88 ; à
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
unk_80F4B:	.BYTE $8A ; ä		; DATA XREF: BANK5:8F4Eo
		.BYTE	4
		.BYTE  $F
		.WORD unk_80F4B
		.BYTE	4
		.BYTE	0
		.WORD unk_80EC8
unk_80F54:	.BYTE	0		; DATA XREF: BANK5:8CFDo
		.BYTE	6
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_80F5B:	.BYTE $83 ; É		; DATA XREF: BANK5:8F61o BANK5:8F94o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE	4
		.BYTE  $D
		.WORD unk_80F5B
unk_80F63:	.BYTE $63 ; c		; DATA XREF: BANK5:8F66o
		.BYTE	4
		.BYTE  $B
		.WORD unk_80F63
		.BYTE $83 ; É
		.BYTE $83 ; É
unk_80F6A:	.BYTE $83 ; É		; DATA XREF: BANK5:8F70o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE	4
		.BYTE  $D
		.WORD unk_80F6A
unk_80F72:	.BYTE $63 ; c		; DATA XREF: BANK5:8F75o
		.BYTE	4
		.BYTE  $B
		.WORD unk_80F72
		.BYTE $83 ; É
		.BYTE $83 ; É
unk_80F79:	.BYTE $83 ; É		; DATA XREF: BANK5:8F82o
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	6
		.WORD unk_80F79
unk_80F84:	.BYTE $83 ; É		; DATA XREF: BANK5:8F87o
		.BYTE	4
		.BYTE	7
		.WORD unk_80F84
unk_80F89:	.BYTE $63 ; c		; DATA XREF: BANK5:8F8Co
		.BYTE	4
		.BYTE	7
		.WORD unk_80F89
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	0
		.WORD unk_80F5B
		.BYTE	9
unk_80F97:	.BYTE	0		; DATA XREF: BANK5:8CFFo
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE $83 ; É
		.BYTE	3
byte_80F9F:	.BYTE $F		; DATA XREF: BANK5:8A54o
		.WORD unk_80FAA
		.WORD unk_81040
		.WORD unk_810A7
		.WORD unk_8111D
		.WORD unk_81144
unk_80FAA:	.BYTE	0		; DATA XREF: BANK5:8FA0o
		.BYTE	7
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	8
		.BYTE	0
unk_80FB0:	.BYTE	2		; DATA XREF: BANK5:903Eo
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $9F ; ü
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE $1A
		.BYTE $CA ;  
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE $C9 ; …
		.BYTE $A5 ; •
		.BYTE $B1 ; ±
		.BYTE $CD ; Õ
		.BYTE $80 ; Ä
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE $CF ; œ
		.BYTE $AA ; ™
		.BYTE $B6 ; ∂
		.BYTE $D2 ; “
		.BYTE $80 ; Ä
		.BYTE $92 ; í
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $D4 ; ‘
		.BYTE $AF ; Ø
		.BYTE $B8 ; ∏
		.BYTE $D5 ; ’
		.BYTE $80 ; Ä
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $D1 ; —
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE $8D ; ç
		.BYTE $8C ; å
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE $A0 ; †
		.BYTE $50 ; P
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $B1 ; ±
		.BYTE	6
		.BYTE $AF ; Ø
		.BYTE $91 ; ë
		.BYTE $89 ; â
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE $92 ; í
		.BYTE $95 ; ï
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $B1 ; ±
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $91 ; ë
		.BYTE $D3 ; ”
		.BYTE $80 ; Ä
		.BYTE $93 ; ì
		.BYTE $91 ; ë
		.BYTE $93 ; ì
		.BYTE $D2 ; “
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $94 ; î
		.BYTE $92 ; í
		.BYTE $CF ; œ
		.BYTE $CC ; Ã
		.BYTE $D1 ; —
		.BYTE $D3 ; ”
		.BYTE $91 ; ë
		.BYTE $93 ; ì
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $9D ; ù
		.BYTE	5
		.BYTE $1A
		.BYTE	7
		.BYTE $B5 ; µ
		.BYTE $D0 ; –
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE $A0 ; †
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $B1 ; ±
		.BYTE $B2 ; ≤
		.BYTE $B4 ; ¥
		.BYTE $AC ; ¨
		.BYTE $A9 ; ©
		.BYTE $AF ; Ø
		.BYTE $A9 ; ©
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $8D ; ç
		.BYTE $CA ;  
		.BYTE $A0 ; †
		.BYTE $AF ; Ø
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE	7
		.BYTE $B5 ; µ
		.BYTE $50 ; P
		.BYTE $EF ; Ô
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $93 ; ì
		.BYTE $95 ; ï
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $9C ; ú
		.BYTE $9D ; ù
		.BYTE $98 ; ò
		.BYTE $95 ; ï
		.BYTE $98 ; ò
		.BYTE $91 ; ë
		.BYTE $8F ; è
		.BYTE $8D ; ç
		.BYTE $8C ; å
		.BYTE	4
		.BYTE	0
		.WORD unk_80FB0
unk_81040:	.BYTE	0		; DATA XREF: BANK5:8FA2o
		.BYTE	7
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	8
		.BYTE	0
unk_81048:	.BYTE	7		; DATA XREF: BANK5:90A5o
		.BYTE $9F ; ü
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE  $E
		.BYTE $D1 ; —
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $CF ; œ
		.BYTE $AC ; ¨
		.BYTE $B8 ; ∏
		.BYTE $D4 ; ‘
		.BYTE $80 ; Ä
		.BYTE $94 ; î
		.BYTE $98 ; ò
		.BYTE $99 ; ô
		.BYTE $D6 ; ÷
		.BYTE $B3 ; ≥
		.BYTE	5
		.BYTE $1A
		.BYTE $B3 ; ≥
		.BYTE $CD ; Õ
		.BYTE $80 ; Ä
		.BYTE $8D ; ç
		.BYTE $91 ; ë
		.BYTE $92 ; í
		.BYTE $CF ; œ
		.BYTE $AC ; ¨
		.BYTE $B4 ; ¥
		.BYTE $D1 ; —
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $95 ; ï
		.BYTE $EC ; Ï
		.BYTE	7
		.BYTE $A5 ; •
		.BYTE $30 ; 0
		.BYTE	5
		.BYTE  $E
		.BYTE $CA ;  
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $8C ; å
		.BYTE $8D ; ç
		.BYTE $C9 ; …
		.BYTE $A5 ; •
		.BYTE $B1 ; ±
		.BYTE $CD ; Õ
		.BYTE $80 ; Ä
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE $CF ; œ
		.BYTE $AA ; ™
		.BYTE $B6 ; ∂
		.BYTE $D2 ; “
		.BYTE $80 ; Ä
		.BYTE $92 ; í
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $D4 ; ‘
		.BYTE $AF ; Ø
		.BYTE $B8 ; ∏
		.BYTE	6
		.BYTE $D5 ; ’
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $F8 ; ¯
		.BYTE	5
		.BYTE $1A
		.BYTE $D2 ; “
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $F8 ; ¯
		.BYTE $D8 ; ÿ
		.BYTE $BB ; ª
		.BYTE $B9 ; π
		.BYTE $D8 ; ÿ
		.BYTE $D6 ; ÷
		.BYTE $D2 ; “
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $D8 ; ÿ
		.BYTE $BB ; ª
		.BYTE $BC ; º
		.BYTE $21 ; !
		.BYTE $FD ; ˝
		.BYTE $FD ; ˝
		.BYTE	4
		.BYTE	0
		.WORD unk_81048
unk_810A7:	.BYTE	0		; DATA XREF: BANK5:8FA4o
		.BYTE	7
		.BYTE	3
		.BYTE $5F ; _
unk_810AB:	.BYTE	5		; DATA XREF: BANK5:911Bo
		.BYTE $1A
unk_810AD:	.BYTE $8A ; ä		; DATA XREF: BANK5:90EFo
		.BYTE $96 ; ñ
		.BYTE $8A ; ä
		.BYTE $96 ; ñ
		.BYTE $8A ; ä
		.BYTE $96 ; ñ
		.BYTE $8A ; ä
		.BYTE $96 ; ñ
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $89 ; â
		.BYTE $95 ; ï
		.BYTE $88 ; à
		.BYTE $94 ; î
		.BYTE $88 ; à
		.BYTE $94 ; î
		.BYTE $88 ; à
		.BYTE $94 ; î
		.BYTE $88 ; à
		.BYTE $94 ; î
		.BYTE $87 ; á
		.BYTE $93 ; ì
		.BYTE $87 ; á
		.BYTE $93 ; ì
		.BYTE $87 ; á
		.BYTE $93 ; ì
		.BYTE $87 ; á
		.BYTE $93 ; ì
		.BYTE $86 ; Ü
		.BYTE $92 ; í
		.BYTE $86 ; Ü
		.BYTE $92 ; í
		.BYTE $86 ; Ü
		.BYTE $92 ; í
		.BYTE $86 ; Ü
		.BYTE $92 ; í
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $85 ; Ö
		.BYTE $91 ; ë
		.BYTE $83 ; É
		.BYTE $8F ; è
		.BYTE $81 ; Å
		.BYTE $8D ; ç
		.BYTE $8C ; å
		.BYTE $8C ; å
		.BYTE	4
		.BYTE	1
		.WORD unk_810AD
		.BYTE	5
		.BYTE $26 ; &
unk_810F3:	.BYTE $86 ; Ü		; DATA XREF: BANK5:90F6o
		.BYTE	4
		.BYTE	7
		.WORD unk_810F3
unk_810F8:	.BYTE $88 ; à		; DATA XREF: BANK5:90FBo
		.BYTE	4
		.BYTE	7
		.WORD unk_810F8
unk_810FD:	.BYTE $89 ; â		; DATA XREF: BANK5:9100o
		.BYTE	4
		.BYTE	7
		.WORD unk_810FD
unk_81102:	.BYTE $8A ; ä		; DATA XREF: BANK5:9105o
		.BYTE	4
		.BYTE	7
		.WORD unk_81102
unk_81107:	.BYTE $86 ; Ü		; DATA XREF: BANK5:910Ao
		.BYTE	4
		.BYTE	7
		.WORD unk_81107
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $89 ; â
unk_81114:	.BYTE $85 ; Ö		; DATA XREF: BANK5:9117o
		.BYTE	4
		.BYTE  $F
		.WORD unk_81114
		.BYTE	4
		.BYTE	0
		.WORD unk_810AB
unk_8111D:	.BYTE	0		; DATA XREF: BANK5:8FA6o
		.BYTE	7
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81124:	.BYTE $83 ; É		; DATA XREF: BANK5:9132o
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE  $F
		.WORD unk_81124
unk_81134:	.BYTE $80 ; Ä		; DATA XREF: BANK5:913Eo
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	7
		.WORD unk_81134
		.BYTE	4
		.BYTE	0
		.BYTE $24 ; $
		.BYTE $91 ; ë
unk_81144:	.BYTE	0		; DATA XREF: BANK5:8FA8o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $22 ; "
		.BYTE $80 ; Ä
		.BYTE	0
unk_8114C:	.BYTE  $F		; DATA XREF: BANK5:8A56o
		.WORD unk_81157
		.WORD unk_811E1
		.WORD unk_81263
		.WORD unk_812FD
		.WORD unk_81351
unk_81157:	.BYTE	0		; DATA XREF: BANK5:914Do
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
unk_8115B:	.BYTE	2		; DATA XREF: BANK5:91DFo
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $20
		.BYTE	5
		.BYTE $21 ; !
unk_81162:	.BYTE $8A ; ä		; DATA XREF: BANK5:916Bo
		.BYTE $60 ; `
		.BYTE $6A ; j
		.BYTE $ED ; Ì
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE	4
		.BYTE	1
		.WORD unk_81162
		.BYTE $8C ; å
		.BYTE $60 ; `
		.BYTE $6C ; l
		.BYTE $EF ; Ô
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $CC ; Ã
		.BYTE $AF ; Ø
		.BYTE $90 ; ê
		.BYTE $60 ; `
		.BYTE $70 ; p
		.BYTE $F1 ; Ò
		.BYTE	5
		.BYTE $2D ; -
		.BYTE $21 ; !
		.BYTE $ED ; Ì
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $21 ; !
		.BYTE $ED ; Ì
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $21 ; !
		.BYTE $EF ; Ô
		.BYTE $AF ; Ø
		.BYTE	5
		.BYTE $21 ; !
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $B2 ; ≤
		.BYTE $B1 ; ±
		.BYTE $A0 ; †
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $91 ; ë
		.BYTE $D1 ; —
		.BYTE	5
		.BYTE $15
		.BYTE $D2 ; “
		.BYTE $86 ; Ü
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE $92 ; í
		.BYTE $D4 ; ‘
		.BYTE $CF ; œ
		.BYTE $D4 ; ‘
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $92 ; í
		.BYTE $B1 ; ±
		.BYTE	8
		.BYTE	1
		.BYTE	7
		.BYTE $BF ; ø
		.BYTE $10
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE $21 ; !
		.BYTE $AC ; ¨
		.BYTE $AA ; ™
		.BYTE $A8 ; ®
		.BYTE	6
		.BYTE $CA ;  
		.BYTE $AD ; ≠
		.BYTE $CC ; Ã
		.BYTE $C8 ; »
		.BYTE $CC ; Ã
		.BYTE $CF ; œ
		.BYTE	8
		.BYTE	2
		.BYTE $F1 ; Ò
		.BYTE	8
		.BYTE	1
		.BYTE $F2 ; Ú
		.BYTE	6
		.BYTE $D1 ; —
		.BYTE $AF ; Ø
		.BYTE	6
		.BYTE $CD ; Õ
		.BYTE $B1 ; ±
		.BYTE $EF ; Ô
		.BYTE	7
		.BYTE $C0 ; ¿
		.BYTE $20
		.BYTE	8
		.BYTE	0
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE $B9 ; π
		.BYTE $D6 ; ÷
		.BYTE	6
		.BYTE $99 ; ô
		.BYTE $79 ; y
		.BYTE $BB ; ª
		.BYTE $D8 ; ÿ
		.BYTE	6
		.BYTE $9B ; õ
		.BYTE $7B ; {
		.BYTE $21 ; !
		.BYTE $FD ; ˝
		.BYTE $FD ; ˝
		.BYTE	4
		.BYTE	0
		.WORD unk_8115B
unk_811E1:	.BYTE	0		; DATA XREF: BANK5:914Fo
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
unk_811E7:	.BYTE	7		; DATA XREF: BANK5:9261o
		.BYTE $DF ; ﬂ
		.BYTE $20
		.BYTE	5
		.BYTE $15
		.BYTE $91 ; ë
		.BYTE $60 ; `
		.BYTE $71 ; q
		.BYTE $F6 ; ˆ
		.BYTE $B1 ; ±
		.BYTE $B5 ; µ
		.BYTE $B6 ; ∂
		.BYTE $92 ; í
		.BYTE $60 ; `
		.BYTE $72 ; r
		.BYTE $F6 ; ˆ
		.BYTE $B2 ; ≤
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $94 ; î
		.BYTE $60 ; `
		.BYTE $74 ; t
		.BYTE $F8 ; ¯
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE $D5 ; ’
		.BYTE $B8 ; ∏
		.BYTE $98 ; ò
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $F8 ; ¯
unk_81207:	.BYTE $96 ; ñ		; DATA XREF: BANK5:9210o
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $F9 ; ˘
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE $B9 ; π
		.BYTE	4
		.BYTE	1
		.WORD unk_81207
		.BYTE $98 ; ò
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $FB ; ˚
		.BYTE $B5 ; µ
		.BYTE $B8 ; ∏
		.BYTE $BB ; ª
		.BYTE $B8 ; ∏
		.BYTE $A0 ; †
		.BYTE $80 ; Ä
		.BYTE $98 ; ò
		.BYTE $98 ; ò
		.BYTE $98 ; ò
		.BYTE	6
		.BYTE $BD ; Ω
		.BYTE $98 ; ò
		.BYTE $D8 ; ÿ
		.BYTE $CD ; Õ
		.BYTE $81 ; Å
		.BYTE $86 ; Ü
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE $CF ; œ
		.BYTE $CC ; Ã
		.BYTE $CF ; œ
		.BYTE $83 ; É
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $AD ; ≠
		.BYTE $C0 ; ¿
		.BYTE $B1 ; ±
		.BYTE $D2 ; “
		.BYTE $86 ; Ü
		.BYTE $8A ; ä
		.BYTE $8D ; ç
		.BYTE $92 ; í
		.BYTE $D4 ; ‘
		.BYTE $CF ; œ
		.BYTE $D4 ; ‘
		.BYTE $B8 ; ∏
		.BYTE $B6 ; ∂
		.BYTE $F5 ; ı
		.BYTE $D6 ; ÷
		.BYTE $8A ; ä
		.BYTE $8F ; è
		.BYTE $92 ; í
		.BYTE $96 ; ñ
		.BYTE $B8 ; ∏
		.BYTE $B4 ; ¥
		.BYTE $D8 ; ÿ
		.BYTE $D9 ; Ÿ
		.BYTE $8D ; ç
		.BYTE $91 ; ë
		.BYTE $96 ; ñ
		.BYTE $99 ; ô
		.BYTE $BB ; ª
		.BYTE $B6 ; ∂
		.BYTE $DB ; €
		.BYTE	7
		.BYTE $C0 ; ¿
		.BYTE $20
		.BYTE	5
		.BYTE $21 ; !
		.BYTE $B6 ; ∂
		.BYTE $D1 ; —
		.BYTE	6
		.BYTE $96 ; ñ
		.BYTE $76 ; v
		.BYTE $B8 ; ∏
		.BYTE $D5 ; ’
		.BYTE	6
		.BYTE $98 ; ò
		.BYTE $78 ; x
		.BYTE $21 ; !
		.BYTE $F8 ; ¯
		.BYTE $F8 ; ¯
		.BYTE	4
		.BYTE	0
		.WORD unk_811E7
unk_81263:	.BYTE	0		; DATA XREF: BANK5:9151o
		.BYTE	6
		.BYTE	3
		.BYTE $5F ; _
		.BYTE	5
		.BYTE $21 ; !
unk_81269:	.BYTE $AA ; ™		; DATA XREF: BANK5:928Bo BANK5:92FBo
		.BYTE $A5 ; •
		.BYTE $AA ; ™
		.BYTE $A5 ; •
		.BYTE $AA ; ™
		.BYTE $A5 ; •
		.BYTE $AA ; ™
		.BYTE $A5 ; •
		.BYTE $A6 ; ¶
		.BYTE $A1 ; °
		.BYTE $A6 ; ¶
		.BYTE $A1 ; °
		.BYTE $A6 ; ¶
		.BYTE $A1 ; °
		.BYTE $A6 ; ¶
		.BYTE $A1 ; °
		.BYTE $A8 ; ®
		.BYTE $A3 ; £
		.BYTE $A8 ; ®
		.BYTE $A3 ; £
		.BYTE $A8 ; ®
		.BYTE $A3 ; £
		.BYTE $A8 ; ®
		.BYTE $A3 ; £
		.BYTE $A9 ; ©
		.BYTE $A5 ; •
		.BYTE $A9 ; ©
		.BYTE $A5 ; •
		.BYTE $A9 ; ©
		.BYTE $A5 ; •
		.BYTE $A9 ; ©
		.BYTE $A5 ; •
		.BYTE	4
		.BYTE	1
		.WORD unk_81269
unk_8128D:	.BYTE $86 ; Ü		; DATA XREF: BANK5:9290o
		.BYTE	4
		.BYTE	7
		.WORD unk_8128D
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
unk_8129A:	.BYTE $85 ; Ö		; DATA XREF: BANK5:929Do
		.BYTE	4
		.BYTE	7
		.WORD unk_8129A
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
		.BYTE $85 ; Ö
		.BYTE $85 ; Ö
unk_812A7:	.BYTE $86 ; Ü		; DATA XREF: BANK5:92AAo
		.BYTE	4
		.BYTE	7
		.WORD unk_812A7
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $88 ; à
		.BYTE $86 ; Ü
		.BYTE $86 ; Ü
unk_812B4:	.BYTE $85 ; Ö		; DATA XREF: BANK5:92B7o
		.BYTE	4
		.BYTE  $F
		.WORD unk_812B4
unk_812B9:	.BYTE $86 ; Ü		; DATA XREF: BANK5:92BCo
		.BYTE	4
		.BYTE	7
		.WORD unk_812B9
unk_812BE:	.BYTE $85 ; Ö		; DATA XREF: BANK5:92C1o
		.BYTE	4
		.BYTE	7
		.WORD unk_812BE
unk_812C3:	.BYTE $81 ; Å		; DATA XREF: BANK5:92C6o
		.BYTE	4
		.BYTE	7
		.WORD unk_812C3
unk_812C8:	.BYTE $83 ; É		; DATA XREF: BANK5:92CBo
		.BYTE	4
		.BYTE	7
		.WORD unk_812C8
		.BYTE $AA ; ™
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $AF ; Ø
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $AF ; Ø
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8F ; è
unk_812E9:	.BYTE $30 ; 0		; DATA XREF: BANK5:92EDo
		.BYTE $91 ; ë
		.BYTE	4
		.BYTE  $B
		.WORD unk_812E9
unk_812EF:	.BYTE $30 ; 0		; DATA XREF: BANK5:92F3o
		.BYTE $71 ; q
		.BYTE	4
		.BYTE  $B
		.WORD unk_812EF
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE	4
		.BYTE	0
		.WORD unk_81269
unk_812FD:	.BYTE	0		; DATA XREF: BANK5:9153o
		.BYTE	6
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81304:	.BYTE $A0 ; †		; DATA XREF: BANK5:934Fo
		.BYTE $A3 ; £
		.BYTE $A0 ; †
		.BYTE $A3 ; £
		.BYTE $A0 ; †
		.BYTE $A3 ; £
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	7
		.BYTE	4
off_81311:	.WORD loc_80393		; DATA XREF: BANK5:9319o
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $E
		.WORD off_81311+1
unk_8131B:	.BYTE $63 ; c		; DATA XREF: BANK5:931Eo
		.BYTE	4
		.BYTE	7
		.WORD unk_8131B
unk_81320:	.BYTE $83 ; É		; DATA XREF: BANK5:9327o
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	7
		.WORD unk_81320
unk_81329:	.BYTE $A3 ; £		; DATA XREF: BANK5:9338o
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	3
		.WORD unk_81329
unk_8133A:	.BYTE $30 ; 0		; DATA XREF: BANK5:933Eo
		.BYTE $83 ; É
		.BYTE	4
		.BYTE  $B
		.WORD unk_8133A
unk_81340:	.BYTE $30 ; 0		; DATA XREF: BANK5:9344o
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $B
		.WORD unk_81340
		.BYTE $80 ; Ä
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	0
		.WORD unk_81304
unk_81351:	.BYTE	0		; DATA XREF: BANK5:9155o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $21 ; !
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
unk_8135D:	.BYTE  $F		; DATA XREF: BANK5:8A58o
		.WORD unk_81368
		.WORD unk_813FB
		.WORD unk_814EE
		.WORD unk_8158F
		.WORD unk_815B7
unk_81368:	.BYTE	0		; DATA XREF: BANK5:935Eo
		.BYTE	7
		.BYTE	8
		.BYTE	0
unk_8136C:	.BYTE	3		; DATA XREF: BANK5:93F9o
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $FF
		.BYTE $30 ; 0
		.BYTE	5
		.BYTE $1E
		.BYTE $ED ; Ì
		.BYTE $F2 ; Ú
		.BYTE $F4 ; Ù
		.BYTE $F9 ; ˘
		.BYTE	6
		.BYTE $BB ; ª
		.BYTE $21 ; !
		.BYTE $D6 ; ÷
		.BYTE	6
		.BYTE $D6 ; ÷
		.BYTE $80 ; Ä
		.BYTE $99 ; ô
		.BYTE $98 ; ò
		.BYTE $21 ; !
		.BYTE $F4 ; Ù
		.BYTE	6
		.BYTE $D4 ; ‘
		.BYTE $B5 ; µ
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	7
		.BYTE $8F ; è
		.BYTE $10
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $C0 ; ¿
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $A0 ; †
		.BYTE $C0 ; ¿
		.BYTE $78 ; x
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $60 ; `
		.BYTE $C0 ; ¿
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $78 ; x
		.BYTE $78 ; x
		.BYTE $79 ; y
		.BYTE $60 ; `
		.BYTE $79 ; y
		.BYTE $60 ; `
		.BYTE $C0 ; ¿
		.BYTE $A0 ; †
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $C0 ; ¿
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $A0 ; †
		.BYTE $C0 ; ¿
		.BYTE $78 ; x
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $60 ; `
		.BYTE $C0 ; ¿
		.BYTE $60 ; `
		.BYTE $78 ; x
		.BYTE $78 ; x
		.BYTE $78 ; x
		.BYTE	6
		.BYTE $D9 ; Ÿ
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $BF ; ø
		.BYTE $20
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $DD ; ›
		.BYTE $80 ; Ä
		.BYTE $99 ; ô
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $DD ; ›
		.BYTE $80 ; Ä
		.BYTE $99 ; ô
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $9D ; ù
		.BYTE $99 ; ô
		.BYTE $99 ; ô
		.BYTE $9B ; õ
		.BYTE $9D ; ù
		.BYTE $99 ; ô
		.BYTE $30 ; 0
		.BYTE $99 ; ô
		.BYTE $30 ; 0
		.BYTE $9B ; õ
		.BYTE $30 ; 0
		.BYTE $9D ; ù
		.BYTE	5
		.BYTE $2A ; *
		.BYTE $B6 ; ∂
		.BYTE $B4 ; ¥
		.BYTE $B2 ; ≤
		.BYTE $B1 ; ±
		.BYTE $92 ; í
		.BYTE $91 ; ë
		.BYTE $92 ; í
		.BYTE $91 ; ë
		.BYTE $ED ; Ì
		.BYTE $A0 ; †
		.BYTE	6
		.BYTE $8F ; è
		.BYTE $6F ; o
		.BYTE $21 ; !
		.BYTE $F1 ; Ò
		.BYTE $F1 ; Ò
		.BYTE $E0 ; ‡
		.BYTE $E0 ; ‡
		.BYTE	4
		.BYTE	0
		.WORD unk_8136C
unk_813FB:	.BYTE	0		; DATA XREF: BANK5:9360o
		.BYTE	7
		.BYTE	5
		.BYTE $1E
unk_813FF:	.BYTE	3		; DATA XREF: BANK5:94ECo
		.BYTE $3A ; :
		.BYTE	2
		.BYTE	0
		.BYTE	7
		.BYTE $83 ; É
		.BYTE $10
unk_81406:	.BYTE $81 ; Å		; DATA XREF: BANK5:9409o
		.BYTE	4
		.BYTE $1F
		.WORD unk_81406
unk_8140B:	.BYTE $83 ; É		; DATA XREF: BANK5:9415o
		.BYTE $83 ; É
		.BYTE $86 ; Ü
		.BYTE $8A ; ä
		.BYTE $8F ; è
		.BYTE $8F ; è
		.BYTE $8A ; ä
		.BYTE $86 ; Ü
		.BYTE	4
		.BYTE	1
		.WORD unk_8140B
unk_81417:	.BYTE $88 ; à		; DATA XREF: BANK5:9421o
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $94 ; î
		.BYTE $94 ; î
		.BYTE $8F ; è
		.BYTE $8C ; å
		.BYTE	4
		.BYTE	1
		.WORD unk_81417
		.BYTE	2
		.BYTE	0
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $10
unk_8142A:	.BYTE $6A ; j		; DATA XREF: BANK5:9430o
		.BYTE $71 ; q
		.BYTE $76 ; v
		.BYTE $71 ; q
		.BYTE	4
		.BYTE	3
		.WORD unk_8142A
unk_81432:	.BYTE $68 ; h		; DATA XREF: BANK5:9438o
		.BYTE $6F ; o
		.BYTE $74 ; t
		.BYTE $6F ; o
		.BYTE	4
		.BYTE	3
		.WORD unk_81432
unk_8143A:	.BYTE $69 ; i		; DATA XREF: BANK5:9440o
		.BYTE $6F ; o
		.BYTE $75 ; u
		.BYTE $6F ; o
		.BYTE	4
		.BYTE	3
		.WORD unk_8143A
unk_81442:	.BYTE $6A ; j		; DATA XREF: BANK5:9448o
		.BYTE $71 ; q
		.BYTE $76 ; v
		.BYTE $71 ; q
		.BYTE	4
		.BYTE	3
		.WORD unk_81442
unk_8144A:	.BYTE $66 ; f		; DATA XREF: BANK5:9450o
		.BYTE $6D ; m
		.BYTE $72 ; r
		.BYTE $6D ; m
		.BYTE	4
		.BYTE	3
		.WORD unk_8144A
unk_81452:	.BYTE $65 ; e		; DATA XREF: BANK5:9458o
		.BYTE $6C ; l
		.BYTE $71 ; q
		.BYTE $6C ; l
		.BYTE	4
		.BYTE	3
		.WORD unk_81452
unk_8145A:	.BYTE $65 ; e		; DATA XREF: BANK5:9460o
		.BYTE $69 ; i
		.BYTE $71 ; q
		.BYTE $69 ; i
		.BYTE	4
		.BYTE	3
		.WORD unk_8145A
unk_81462:	.BYTE $6A ; j		; DATA XREF: BANK5:9468o
		.BYTE $71 ; q
		.BYTE $76 ; v
		.BYTE $71 ; q
		.BYTE	4
		.BYTE	3
		.WORD unk_81462
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $61 ; a
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6D ; m
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6D ; m
		.BYTE $71 ; q
		.BYTE $68 ; h
		.BYTE $6D ; m
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $6D ; m
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $79 ; y
		.BYTE	5
		.BYTE $12
		.BYTE $6C ; l
		.BYTE	5
		.BYTE $1E
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6C ; l
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6C ; l
		.BYTE $71 ; q
		.BYTE $68 ; h
		.BYTE $6C ; l
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $6C ; l
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $78 ; x
		.BYTE	5
		.BYTE $12
		.BYTE $6B ; k
		.BYTE	5
		.BYTE $1E
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6B ; k
		.BYTE $65 ; e
		.BYTE $68 ; h
		.BYTE $6B ; k
		.BYTE $71 ; q
		.BYTE $68 ; h
		.BYTE $6B ; k
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $6B ; k
		.BYTE $71 ; q
		.BYTE $74 ; t
		.BYTE $77 ; w
		.BYTE	5
		.BYTE $12
		.BYTE $6A ; j
		.BYTE	5
		.BYTE $1E
		.BYTE $61 ; a
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $61 ; a
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $6D ; m
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $6D ; m
		.BYTE $72 ; r
		.BYTE $6A ; j
		.BYTE $6D ; m
		.BYTE $72 ; r
		.BYTE $76 ; v
		.BYTE	5
		.BYTE $12
		.BYTE $6A ; j
		.BYTE	5
		.BYTE $1E
		.BYTE $63 ; c
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $63 ; c
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $6F ; o
		.BYTE $66 ; f
		.BYTE $6A ; j
		.BYTE $6F ; o
		.BYTE $72 ; r
		.BYTE $6A ; j
		.BYTE $6F ; o
		.BYTE $72 ; r
		.BYTE $76 ; v
		.BYTE	5
		.BYTE $12
		.BYTE $69 ; i
		.BYTE	5
		.BYTE $1E
		.BYTE $61 ; a
		.BYTE $66 ; f
		.BYTE $69 ; i
		.BYTE $61 ; a
		.BYTE $66 ; f
		.BYTE $69 ; i
		.BYTE $6D ; m
		.BYTE $66 ; f
		.BYTE $69 ; i
		.BYTE $6D ; m
		.BYTE $72 ; r
		.BYTE $69 ; i
		.BYTE $6D ; m
		.BYTE $72 ; r
		.BYTE $75 ; u
		.BYTE	2
		.BYTE	0
		.BYTE	7
		.BYTE $83 ; É
		.BYTE $10
unk_814E5:	.BYTE $81 ; Å		; DATA XREF: BANK5:94E8o
		.BYTE	4
		.BYTE $1F
		.WORD unk_814E5
		.BYTE	4
		.BYTE	0
		.WORD unk_813FF
unk_814EE:	.BYTE	0		; DATA XREF: BANK5:9362o
		.BYTE	7
		.BYTE	3
		.BYTE $5F ; _
		.BYTE	5
		.BYTE $1E
unk_814F4:	.BYTE $8D ; ç		; DATA XREF: BANK5:9503o BANK5:958Do
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $8D ; ç
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $8D ; ç
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6C ; l
		.BYTE $6D ; m
		.BYTE	4
		.BYTE	3
		.WORD unk_814F4
unk_81505:	.BYTE $8F ; è		; DATA XREF: BANK5:9514o
		.BYTE $6F ; o
		.BYTE $6F ; o
		.BYTE $8F ; è
		.BYTE $6F ; o
		.BYTE $6F ; o
		.BYTE $8F ; è
		.BYTE $6F ; o
		.BYTE $6F ; o
		.BYTE $6F ; o
		.BYTE $6F ; o
		.BYTE $6E ; n
		.BYTE $6F ; o
		.BYTE	4
		.BYTE	1
		.WORD unk_81505
		.BYTE $88 ; à
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $88 ; à
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $88 ; à
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $67 ; g
		.BYTE $68 ; h
unk_81523:	.BYTE $88 ; à		; DATA XREF: BANK5:9528o
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE	4
		.BYTE	3
		.WORD unk_81523
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $C0 ; ¿
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $88 ; à
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $C0 ; ¿
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $89 ; â
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $C0 ; ¿
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
unk_81542:	.BYTE $8A ; ä		; DATA XREF: BANK5:954Co
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $C0 ; ¿
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE	4
		.BYTE	1
		.WORD unk_81542
		.BYTE $88 ; à
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $C0 ; ¿
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $68 ; h
		.BYTE $89 ; â
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $C0 ; ¿
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
unk_8155E:	.BYTE $8A ; ä		; DATA XREF: BANK5:9561o
		.BYTE	4
		.BYTE	7
		.WORD unk_8155E
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $8D ; ç
		.BYTE $AD ; ≠
		.BYTE $A0 ; †
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $8C ; å
		.BYTE $AC ; ¨
		.BYTE $A0 ; †
		.BYTE	6
		.BYTE $AB ; ´
		.BYTE $8B ; ã
		.BYTE	6
		.BYTE $AB ; ´
		.BYTE $8B ; ã
		.BYTE	6
		.BYTE $A6 ; ¶
		.BYTE $86 ; Ü
		.BYTE	6
		.BYTE $A5 ; •
		.BYTE $85 ; Ö
		.BYTE	6
		.BYTE $A3 ; £
		.BYTE $83 ; É
		.BYTE	6
		.BYTE $A3 ; £
		.BYTE $83 ; É
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $89 ; â
		.BYTE $A9 ; ©
		.BYTE	6
		.BYTE $89 ; â
		.BYTE $69 ; i
unk_81586:	.BYTE $81 ; Å		; DATA XREF: BANK5:9589o
		.BYTE	4
		.BYTE $1F
		.WORD unk_81586
		.BYTE	4
		.BYTE	0
		.WORD unk_814F4
unk_8158F:	.BYTE	0		; DATA XREF: BANK5:9364o
		.BYTE	7
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81596:	.BYTE $80 ; Ä		; DATA XREF: BANK5:95A0o BANK5:95B5o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE  $F
		.WORD unk_81596
unk_815A2:	.BYTE $83 ; É		; DATA XREF: BANK5:95A5o
		.BYTE	4
		.BYTE $2F ; /
		.WORD unk_815A2
unk_815A7:	.BYTE $80 ; Ä		; DATA XREF: BANK5:95B1o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	3
		.WORD unk_815A7
		.BYTE	4
		.BYTE	0
		.WORD unk_81596
unk_815B7:	.BYTE	0		; DATA XREF: BANK5:9366o
		.BYTE $E0 ; ‡
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $22 ; "
		.BYTE $80 ; Ä
		.BYTE	0
unk_815BF:	.BYTE  $F		; DATA XREF: BANK5:8A5Ao
		.WORD unk_815CA
		.WORD unk_815F9
		.WORD unk_81628
		.WORD unk_81651
		.WORD unk_81671
unk_815CA:	.BYTE	0		; DATA XREF: BANK5:95C0o
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $FF
		.BYTE $40 ; @
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $20
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8E ; é
		.BYTE	6
		.BYTE $CF ; œ
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $93 ; ì
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $75 ; u
		.BYTE $75 ; u
		.BYTE $95 ; ï
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $95 ; ï
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $F6 ; ˆ
		.BYTE	9
unk_815F9:	.BYTE	0		; DATA XREF: BANK5:95C2o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $FF
		.BYTE $40 ; @
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $14
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $93 ; ì
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $95 ; ï
		.BYTE	6
		.BYTE $D6 ; ÷
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $30 ; 0
		.BYTE $9A ; ö
		.BYTE $30 ; 0
		.BYTE $9B ; õ
		.BYTE	6
		.BYTE $BB ; ª
		.BYTE $7D ; }
		.BYTE $7D ; }
		.BYTE $9D ; ù
		.BYTE $9A ; ö
		.BYTE $30 ; 0
		.BYTE $9D ; ù
		.BYTE $30 ; 0
		.BYTE $9D ; ù
		.BYTE $30 ; 0
		.BYTE $9D ; ù
		.BYTE $FD ; ˝
		.BYTE	9
unk_81628:	.BYTE	0		; DATA XREF: BANK5:95C4o
		.BYTE	6
		.BYTE	3
		.BYTE $6F ; o
		.BYTE	5
		.BYTE $14
		.BYTE $B6 ; ∂
		.BYTE $B5 ; µ
		.BYTE $B3 ; ≥
		.BYTE $B1 ; ±
		.BYTE	6
		.BYTE $AF ; Ø
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $8F ; è
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8E ; é
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $91 ; ë
		.BYTE $8F ; è
		.BYTE $8E ; é
		.BYTE $8C ; å
		.BYTE $89 ; â
		.BYTE $91 ; ë
		.BYTE $89 ; â
		.BYTE $8C ; å
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $AA ; ™
		.BYTE	9
unk_81651:	.BYTE	0		; DATA XREF: BANK5:95C6o
		.BYTE	6
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81658:	.BYTE $83 ; É		; DATA XREF: BANK5:9667o
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	2
		.WORD unk_81658
unk_81669:	.BYTE $30 ; 0		; DATA XREF: BANK5:966Do
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $B
		.WORD unk_81669
		.BYTE $83 ; É
		.BYTE	9
unk_81671:	.BYTE	0		; DATA XREF: BANK5:95C8o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
unk_81675:	.BYTE  $F		; DATA XREF: BANK5:8A5Co
		.WORD unk_81680
		.WORD unk_816CD
		.WORD unk_81719
		.WORD unk_8175F
		.WORD unk_81791
unk_81680:	.BYTE	0		; DATA XREF: BANK5:9676o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $85 ; Ö
		.BYTE $50 ; P
		.BYTE	5
		.BYTE $17
unk_81689:	.BYTE $80 ; Ä		; DATA XREF: BANK5:9691o BANK5:96CBo
		.BYTE $96 ; ñ
		.BYTE $74 ; t
		.BYTE $96 ; ñ
		.BYTE $71 ; q
		.BYTE $C0 ; ¿
		.BYTE	4
		.BYTE	1
		.WORD unk_81689
		.BYTE $96 ; ñ
		.BYTE $96 ; ñ
		.BYTE $A0 ; †
		.BYTE $96 ; ñ
		.BYTE $96 ; ñ
		.BYTE $A0 ; †
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $74 ; t
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $74 ; t
		.BYTE $76 ; v
		.BYTE $60 ; `
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
		.BYTE $76 ; v
unk_816A9:	.BYTE $80 ; Ä		; DATA XREF: BANK5:96B1o
		.BYTE $99 ; ô
		.BYTE $78 ; x
		.BYTE $99 ; ô
		.BYTE $74 ; t
		.BYTE $C0 ; ¿
		.BYTE	4
		.BYTE	1
		.WORD unk_816A9
		.BYTE $99 ; ô
		.BYTE $99 ; ô
		.BYTE $A0 ; †
		.BYTE $99 ; ô
		.BYTE $99 ; ô
		.BYTE $A0 ; †
		.BYTE $60 ; `
		.BYTE $79 ; y
		.BYTE $77 ; w
		.BYTE $79 ; y
		.BYTE $60 ; `
		.BYTE $79 ; y
		.BYTE $77 ; w
		.BYTE $79 ; y
		.BYTE $60 ; `
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE $79 ; y
		.BYTE	4
		.BYTE	0
		.WORD unk_81689
unk_816CD:	.BYTE	0		; DATA XREF: BANK5:9678o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $85 ; Ö
		.BYTE $50 ; P
		.BYTE	5
		.BYTE $17
unk_816D6:	.BYTE $80 ; Ä		; DATA XREF: BANK5:96DEo BANK5:9717o
		.BYTE $91 ; ë
		.BYTE $71 ; q
		.BYTE $91 ; ë
		.BYTE $6A ; j
		.BYTE $C0 ; ¿
		.BYTE	4
		.BYTE	1
		.WORD unk_816D6
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $A0 ; †
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $A0 ; †
		.BYTE $60 ; `
		.BYTE $71 ; q
		.BYTE $71 ; q
		.BYTE $71 ; q
		.BYTE $60 ; `
		.BYTE $71 ; q
		.BYTE $71 ; q
		.BYTE $71 ; q
		.BYTE $60 ; `
		.BYTE $6A ; j
		.BYTE $6C ; l
		.BYTE $6C ; l
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6F ; o
		.BYTE $6F ; o
unk_816F6:	.BYTE $80 ; Ä		; DATA XREF: BANK5:96FEo
		.BYTE $90 ; ê
		.BYTE $70 ; p
		.BYTE $90 ; ê
		.BYTE $6D ; m
		.BYTE $C0 ; ¿
		.BYTE	4
		.BYTE	1
		.WORD unk_816F6
		.BYTE $94 ; î
		.BYTE $94 ; î
		.BYTE $A0 ; †
		.BYTE $94 ; î
		.BYTE $94 ; î
		.BYTE $A0 ; †
		.BYTE $60 ; `
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $60 ; `
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	0
		.WORD unk_816D6
unk_81719:	.BYTE	0		; DATA XREF: BANK5:967Ao
		.BYTE	6
		.BYTE	3
		.BYTE $4F ; O
		.BYTE	5
		.BYTE $23 ; #
unk_8171F:	.BYTE $8A ; ä		; DATA XREF: BANK5:972Ao BANK5:975Do
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE	4
		.BYTE	1
		.WORD unk_8171F
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
unk_8173D:	.BYTE $8D ; ç		; DATA XREF: BANK5:9748o
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $8D ; ç
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $8D ; ç
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE	4
		.BYTE	1
		.WORD unk_8173D
		.BYTE $8D ; ç
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE $8D ; ç
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $8D ; ç
		.BYTE $8D ; ç
		.BYTE $A0 ; †
		.BYTE	4
		.BYTE	0
		.WORD unk_8171F
unk_8175F:	.BYTE	0		; DATA XREF: BANK5:967Co
		.BYTE	6
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE	3
		.BYTE $3D ; =
unk_81766:	.BYTE $83 ; É		; DATA XREF: BANK5:9775o BANK5:978Fo
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE	4
		.BYTE	1
		.WORD unk_81766
unk_81777:	.BYTE $83 ; É		; DATA XREF: BANK5:977Co
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	3
		.WORD unk_81777
unk_8177E:	.BYTE $30 ; 0		; DATA XREF: BANK5:9782o
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $B
		.WORD unk_8177E
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	0
		.WORD unk_81766
unk_81791:	.BYTE	0		; DATA XREF: BANK5:967Eo
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
unk_81799:	.BYTE  $F		; DATA XREF: BANK5:8A5Eo
		.WORD unk_817A4
		.WORD unk_817D3
		.WORD unk_817FB
		.WORD unk_81825
		.WORD unk_81873
unk_817A4:	.BYTE	0		; DATA XREF: BANK5:979Ao
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $BF ; ø
		.BYTE $F0 ; 
		.BYTE	5
		.BYTE $1B
		.BYTE	6
		.BYTE $B6 ; ∂
		.BYTE $96 ; ñ
		.BYTE $95 ; ï
		.BYTE $B5 ; µ
		.BYTE $95 ; ï
		.BYTE	6
		.BYTE $B4 ; ¥
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $B3 ; ≥
		.BYTE $30 ; 0
		.BYTE $B3 ; ≥
		.BYTE $30 ; 0
		.BYTE $B3 ; ≥
		.BYTE	6
		.BYTE $92 ; í
		.BYTE	6
		.BYTE $8F ; è
		.BYTE $92 ; í
		.BYTE $30 ; 0
		.BYTE $B1 ; ±
		.BYTE $30 ; 0
		.BYTE $AD ; ≠
		.BYTE $30 ; 0
		.BYTE $B1 ; ±
		.BYTE	6
		.BYTE $AF ; Ø
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $69 ; i
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $CA ;  
		.BYTE	9
unk_817D3:	.BYTE	0		; DATA XREF: BANK5:979Co
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $30 ; 0
		.BYTE	5
		.BYTE $1B
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $B1 ; ±
		.BYTE $91 ; ë
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $B1 ; ±
		.BYTE $30 ; 0
		.BYTE $B1 ; ±
		.BYTE $30 ; 0
		.BYTE $B1 ; ±
		.BYTE	6
		.BYTE $8F ; è
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $AD ; ≠
		.BYTE $30 ; 0
		.BYTE $A8 ; ®
		.BYTE $30 ; 0
		.BYTE $AD ; ≠
		.BYTE $C9 ; …
		.BYTE $C1 ; ¡
		.BYTE	9
unk_817FB:	.BYTE	0		; DATA XREF: BANK5:979Eo
		.BYTE	6
		.BYTE	3
		.BYTE $6F ; o
		.BYTE	5
		.BYTE $27 ; '
		.BYTE $AD ; ≠
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $AC ; ¨
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $AC ; ¨
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $AC ; ¨
		.BYTE $30 ; 0
		.BYTE $AC ; ¨
		.BYTE $30 ; 0
		.BYTE $AC ; ¨
		.BYTE $CF ; œ
		.BYTE $CD ; Õ
		.BYTE $AC ; ¨
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $65 ; e
		.BYTE $CA ;  
		.BYTE	9
unk_81825:	.BYTE	0		; DATA XREF: BANK5:97A0o
		.BYTE	6
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE	3
		.BYTE $3D ; =
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE	9
unk_81873:	.BYTE  $F		; DATA XREF: BANK5:8A60o BANK5:97A2o
		.WORD unk_8187E
		.WORD unk_818EB
		.WORD unk_81A2B
		.WORD unk_81A69
		.WORD unk_81A9A
unk_8187E:	.BYTE	0		; DATA XREF: BANK5:9874o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $82 ; Ç
		.BYTE $20
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	5
		.BYTE $14
		.BYTE $E0 ; ‡
		.BYTE $C0 ; ¿
		.BYTE $30 ; 0
		.BYTE $7D ; }
		.BYTE $30 ; 0
		.BYTE $7C ; |
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
unk_818A3:	.BYTE	7		; DATA XREF: BANK5:98E9o
		.BYTE $95 ; ï
		.BYTE $10
		.BYTE	2
		.BYTE $C0 ; ¿
unk_818A8:	.BYTE $8A ; ä		; DATA XREF: BANK5:98BEo
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE	4
		.BYTE	2
		.WORD unk_818A8
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $B1 ; ±
		.BYTE $AF ; Ø
		.BYTE $91 ; ë
unk_818C5:	.BYTE $8A ; ä		; DATA XREF: BANK5:98DBo
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $91 ; ë
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE	4
		.BYTE	2
		.WORD unk_818C5
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE	6
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $91 ; ë
		.BYTE	4
		.BYTE	0
		.WORD unk_818A3
unk_818EB:	.BYTE	0		; DATA XREF: BANK5:9876o
		.BYTE	6
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE	7
		.BYTE $82 ; Ç
		.BYTE $20
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	5
		.BYTE $20
		.BYTE $E0 ; ‡
		.BYTE $E0 ; ‡
unk_818F8:	.BYTE	5		; DATA XREF: BANK5:9A29o
		.BYTE $20
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE	5
		.BYTE $2C ; ,
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE	5
		.BYTE $20
		.BYTE $A0 ; †
		.BYTE $30 ; 0
		.BYTE $7D ; }
		.BYTE $30 ; 0
		.BYTE $7C ; |
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7C ; |
		.BYTE $30 ; 0
		.BYTE $7D ; }
		.BYTE $30 ; 0
		.BYTE $7E ; ~
		.BYTE	5
		.BYTE $2C ; ,
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $E0 ; ‡
		.BYTE	5
		.BYTE $20
unk_81988:	.BYTE $7D ; }		; DATA XREF: BANK5:998Eo
		.BYTE $7C ; |
		.BYTE $7B ; {
		.BYTE $7C ; |
		.BYTE	4
		.BYTE	3
		.WORD unk_81988
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $69 ; i
		.BYTE $30 ; 0
		.BYTE $68 ; h
		.BYTE $30 ; 0
		.BYTE $67 ; g
		.BYTE $30 ; 0
		.BYTE $66 ; f
		.BYTE $30 ; 0
		.BYTE $65 ; e
		.BYTE $30 ; 0
		.BYTE $64 ; d
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $62 ; b
		.BYTE $30 ; 0
		.BYTE $61 ; a
		.BYTE $30 ; 0
		.BYTE $6A ; j
		.BYTE $30 ; 0
		.BYTE $6B ; k
		.BYTE $30 ; 0
		.BYTE $6C ; l
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE	5
		.BYTE $2C ; ,
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE	5
		.BYTE $20
		.BYTE $30 ; 0
		.BYTE $6D ; m
		.BYTE $30 ; 0
		.BYTE $6E ; n
		.BYTE $30 ; 0
		.BYTE $6F ; o
		.BYTE $30 ; 0
		.BYTE $70 ; p
		.BYTE $30 ; 0
		.BYTE $71 ; q
		.BYTE $30 ; 0
		.BYTE $72 ; r
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $30 ; 0
		.BYTE $79 ; y
		.BYTE $30 ; 0
		.BYTE $7A ; z
		.BYTE $30 ; 0
		.BYTE $7B ; {
		.BYTE $30 ; 0
		.BYTE $7C ; |
		.BYTE $30 ; 0
		.BYTE $7D ; }
		.BYTE $30 ; 0
		.BYTE $7E ; ~
		.BYTE	5
		.BYTE $2C ; ,
		.BYTE $30 ; 0
		.BYTE $73 ; s
		.BYTE $30 ; 0
		.BYTE $74 ; t
		.BYTE $30 ; 0
		.BYTE $75 ; u
		.BYTE $30 ; 0
		.BYTE $76 ; v
		.BYTE $30 ; 0
		.BYTE $77 ; w
		.BYTE $30 ; 0
		.BYTE $78 ; x
		.BYTE $E0 ; ‡
		.BYTE	4
		.BYTE	0
		.WORD unk_818F8
unk_81A2B:	.BYTE	0		; DATA XREF: BANK5:9878o
		.BYTE	6
		.BYTE	3
		.BYTE $2F ; /
		.BYTE	5
		.BYTE $20
unk_81A31:	.BYTE $8A ; ä		; DATA XREF: BANK5:9A39o
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE	4
		.BYTE	3
		.WORD unk_81A31
unk_81A3B:	.BYTE $8A ; ä		; DATA XREF: BANK5:9A43o
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE	4
		.BYTE	5
		.WORD unk_81A3B
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $89 ; â
		.BYTE $89 ; â
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
unk_81A51:	.BYTE $8A ; ä		; DATA XREF: BANK5:9A59o
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE	4
		.BYTE	5
		.WORD unk_81A51
unk_81A5B:	.BYTE $89 ; â		; DATA XREF: BANK5:9A63o
		.BYTE $89 ; â
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE	4
		.BYTE	3
		.WORD unk_81A5B
		.BYTE	4
		.BYTE	0
		.BYTE $3B ; ;
		.BYTE $9A ; ö
unk_81A69:	.BYTE	0		; DATA XREF: BANK5:987Ao
		.BYTE	6
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81A70:	.BYTE $83 ; É		; DATA XREF: BANK5:9A76o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	3
		.WORD unk_81A70
unk_81A78:	.BYTE $83 ; É		; DATA XREF: BANK5:9A7Eo BANK5:9A98o
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	5
		.WORD unk_81A78
unk_81A80:	.BYTE $83 ; É		; DATA XREF: BANK5:9A83o
		.BYTE	4
		.BYTE	7
		.WORD unk_81A80
unk_81A85:	.BYTE $83 ; É		; DATA XREF: BANK5:9A8Bo
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
		.BYTE	4
		.BYTE	7
		.WORD unk_81A85
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $83 ; É
unk_81A91:	.BYTE $63 ; c		; DATA XREF: BANK5:9A94o
		.BYTE	4
		.BYTE	7
		.WORD unk_81A91
		.BYTE	4
		.BYTE	0
		.WORD unk_81A78
unk_81A9A:	.BYTE  $F		; DATA XREF: BANK5:8A62o BANK5:987Co
		.WORD unk_81AA5
		.WORD unk_81AEE
		.WORD unk_81B45
		.WORD unk_81B95
		.WORD unk_81BB9
unk_81AA5:	.BYTE	0		; DATA XREF: BANK5:9A9Bo
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $8A ; ä
		.BYTE $40 ; @
		.BYTE	8
		.BYTE	0
		.BYTE $E0 ; ‡
		.BYTE $E0 ; ‡
unk_81AB2:	.BYTE	5		; DATA XREF: BANK5:9AECo
		.BYTE $21 ; !
unk_81AB4:	.BYTE $B6 ; ∂		; DATA XREF: BANK5:9ACCo
		.BYTE $B6 ; ∂
		.BYTE $B6 ; ∂
		.BYTE	6
		.BYTE $96 ; ñ
		.BYTE $76 ; v
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $B5 ; µ
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $94 ; î
		.BYTE $74 ; t
		.BYTE	6
		.BYTE $B3 ; ≥
		.BYTE	6
		.BYTE $B3 ; ≥
		.BYTE $B3 ; ≥
		.BYTE	4
		.BYTE	1
		.WORD unk_81AB4
		.BYTE	5
		.BYTE $26 ; &
		.BYTE $B6 ; ∂
		.BYTE $B6 ; ∂
		.BYTE $B6 ; ∂
		.BYTE	6
		.BYTE $96 ; ñ
		.BYTE $76 ; v
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $B5 ; µ
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE $B4 ; ¥
		.BYTE	6
		.BYTE $94 ; î
		.BYTE $74 ; t
		.BYTE	6
		.BYTE $B3 ; ≥
		.BYTE	6
		.BYTE $B3 ; ≥
		.BYTE $B3 ; ≥
		.BYTE	4
		.BYTE	1
		.BYTE $D0 ; –
		.BYTE $9A ; ö
		.BYTE	4
		.BYTE	0
		.WORD unk_81AB2
unk_81AEE:	.BYTE	0		; DATA XREF: BANK5:9A9Do
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $8A ; ä
		.BYTE $40 ; @
		.BYTE	8
		.BYTE	0
		.BYTE $E0 ; ‡
		.BYTE $E0 ; ‡
unk_81AFB:	.BYTE	5		; DATA XREF: BANK5:9B43o
		.BYTE $21 ; !
unk_81AFD:	.BYTE $AD ; ≠		; DATA XREF: BANK5:9B0Ao
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $8D ; ç
		.BYTE $6D ; m
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE	4
		.BYTE	1
		.WORD unk_81AFD
		.BYTE	5
		.BYTE $15
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $B0 ; ∞
		.BYTE $B1 ; ±
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $B0 ; ∞
		.BYTE $B1 ; ±
		.BYTE	5
		.BYTE $26 ; &
unk_81B20:	.BYTE $AD ; ≠		; DATA XREF: BANK5:9B2Do
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $8D ; ç
		.BYTE $6D ; m
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE	4
		.BYTE	1
		.WORD unk_81B20
		.BYTE	5
		.BYTE $1A
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $B0 ; ∞
		.BYTE $B1 ; ±
		.BYTE $AC ; ¨
		.BYTE $AF ; Ø
		.BYTE $B0 ; ∞
		.BYTE $B1 ; ±
		.BYTE	4
		.BYTE	0
		.WORD unk_81AFB
unk_81B45:	.BYTE	0		; DATA XREF: BANK5:9A9Fo
		.BYTE	6
		.BYTE	3
		.BYTE $5F ; _
		.BYTE	5
		.BYTE $15
unk_81B4B:	.BYTE $8A ; ä		; DATA XREF: BANK5:9B4Fo
		.BYTE $96 ; ñ
		.BYTE	4
		.BYTE	7
		.WORD unk_81B4B
		.BYTE	5
		.BYTE $15
unk_81B53:	.BYTE $8A ; ä		; DATA XREF: BANK5:9B57o
		.BYTE $96 ; ñ
		.BYTE	4
		.BYTE  $F
		.WORD unk_81B53
unk_81B59:	.BYTE $8A ; ä		; DATA XREF: BANK5:9B63o
		.BYTE $96 ; ñ
		.BYTE $8C ; å
		.BYTE $98 ; ò
		.BYTE $8D ; ç
		.BYTE $99 ; ô
		.BYTE $8F ; è
		.BYTE $9B ; õ
		.BYTE	4
		.BYTE	1
		.WORD unk_81B59
unk_81B65:	.BYTE $8C ; å		; DATA XREF: BANK5:9B6Fo
		.BYTE $98 ; ò
		.BYTE $8F ; è
		.BYTE $9B ; õ
		.BYTE $90 ; ê
		.BYTE $9C ; ú
		.BYTE $91 ; ë
		.BYTE $9D ; ù
		.BYTE	4
		.BYTE	1
		.WORD unk_81B65
		.BYTE	5
		.BYTE $1A
unk_81B73:	.BYTE $8A ; ä		; DATA XREF: BANK5:9B77o
		.BYTE $96 ; ñ
		.BYTE	4
		.BYTE  $F
		.WORD unk_81B73
unk_81B79:	.BYTE $8A ; ä		; DATA XREF: BANK5:9B83o
		.BYTE $96 ; ñ
		.BYTE $8C ; å
		.BYTE $98 ; ò
		.BYTE $8D ; ç
		.BYTE $99 ; ô
		.BYTE $8F ; è
		.BYTE $9B ; õ
		.BYTE	4
		.BYTE	1
		.WORD unk_81B79
unk_81B85:	.BYTE $8C ; å		; DATA XREF: BANK5:9B8Fo
		.BYTE $98 ; ò
		.BYTE $8F ; è
		.BYTE $9B ; õ
		.BYTE $90 ; ê
		.BYTE $9C ; ú
		.BYTE $91 ; ë
		.BYTE $9D ; ù
		.BYTE	4
		.BYTE	1
		.WORD unk_81B85
		.BYTE	4
		.BYTE	0
		.BYTE $51 ; Q
		.BYTE $9B ; õ
unk_81B95:	.BYTE	0		; DATA XREF: BANK5:9AA1o
		.BYTE	6
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81B9C:	.BYTE $83 ; É		; DATA XREF: BANK5:9BB7o
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $80 ; Ä
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $80 ; Ä
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $80 ; Ä
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	0
		.WORD unk_81B9C
unk_81BB9:	.BYTE	0		; DATA XREF: BANK5:9AA3o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
unk_81BBD:	.BYTE  $F		; DATA XREF: BANK5:8A64o
		.WORD unk_81BC8
		.WORD unk_81BEF
		.WORD unk_81C14
		.WORD unk_81C36
		.WORD unk_81C68
unk_81BC8:	.BYTE	0		; DATA XREF: BANK5:9BBEo
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	5
		.BYTE $20
		.BYTE $AA ; ™
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $B0 ; ∞
		.BYTE $D1 ; —
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $96 ; ñ
		.BYTE $94 ; î
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $80 ; Ä
		.BYTE $94 ; î
		.BYTE $D6 ; ÷
		.BYTE	5
		.BYTE	8
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $AA ; ™
		.BYTE	9
unk_81BEF:	.BYTE	0		; DATA XREF: BANK5:9BC0o
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	5
		.BYTE $14
		.BYTE $A5 ; •
		.BYTE $A8 ; ®
		.BYTE $AA ; ™
		.BYTE $AB ; ´
		.BYTE $CC ; Ã
		.BYTE $80 ; Ä
		.BYTE $8C ; å
		.BYTE $8C ; å
		.BYTE $8F ; è
		.BYTE $91 ; ë
		.BYTE $91 ; ë
		.BYTE $8F ; è
		.BYTE $80 ; Ä
		.BYTE $91 ; ë
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE $D1 ; —
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $AA ; ™
		.BYTE	9
unk_81C14:	.BYTE	0		; DATA XREF: BANK5:9BC2o
		.BYTE	6
		.BYTE	3
		.BYTE $6F ; o
		.BYTE	5
		.BYTE $14
		.BYTE $B6 ; ∂
		.BYTE $B4 ; ¥
		.BYTE $B3 ; ≥
		.BYTE $B2 ; ≤
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $91 ; ë
		.BYTE $B1 ; ±
		.BYTE $A0 ; †
		.BYTE $96 ; ñ
		.BYTE $96 ; ñ
		.BYTE $94 ; î
		.BYTE $80 ; Ä
		.BYTE $96 ; ñ
		.BYTE $80 ; Ä
		.BYTE $94 ; î
		.BYTE $21 ; !
		.BYTE $96 ; ñ
		.BYTE $B6 ; ∂
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	5
		.BYTE $20
		.BYTE $80 ; Ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $AA ; ™
		.BYTE	9
unk_81C36:	.BYTE	0		; DATA XREF: BANK5:9BC4o
		.BYTE	6
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE	3
		.BYTE $3D ; =
unk_81C3D:	.BYTE $83 ; É		; DATA XREF: BANK5:9C42o
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	3
		.WORD unk_81C3D
unk_81C44:	.BYTE $63 ; c		; DATA XREF: BANK5:9C47o
		.BYTE	4
		.BYTE	7
		.WORD unk_81C44
		.BYTE $A3 ; £
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE	9
unk_81C68:	.BYTE  $F		; DATA XREF: BANK5:8A66o BANK5:9BC6o
		.WORD unk_81C73
		.WORD unk_81CA2
		.WORD unk_81CD1
		.WORD unk_81CF9
		.WORD unk_81D05
unk_81C73:	.BYTE	0		; DATA XREF: BANK5:9C69o
		.BYTE	3
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $FF
		.BYTE $F0 ; 
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $2F ; /
unk_81C80:	.BYTE $B1 ; ±		; DATA XREF: BANK5:9C85o
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81C80
unk_81C87:	.BYTE $B4 ; ¥		; DATA XREF: BANK5:9C8Co
		.BYTE $95 ; ï
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81C87
		.BYTE	5
		.BYTE $23 ; #
unk_81C90:	.BYTE $B1 ; ±		; DATA XREF: BANK5:9C95o
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81C90
unk_81C97:	.BYTE $B4 ; ¥		; DATA XREF: BANK5:9C9Co
		.BYTE $95 ; ï
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81C97
		.BYTE	4
		.BYTE	0
		.BYTE $7E ; ~
		.BYTE $9C ; ú
unk_81CA2:	.BYTE	0		; DATA XREF: BANK5:9C6Bo
		.BYTE	3
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE $FF
		.BYTE $F0 ; 
		.BYTE	8
		.BYTE	0
unk_81CAD:	.BYTE	5		; DATA XREF: BANK5:9CCFo
		.BYTE $2F ; /
unk_81CAF:	.BYTE $AF ; Ø		; DATA XREF: BANK5:9CB4o
		.BYTE $8F ; è
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CAF
unk_81CB6:	.BYTE $B3 ; ≥		; DATA XREF: BANK5:9CBBo
		.BYTE $93 ; ì
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CB6
		.BYTE	5
		.BYTE $23 ; #
unk_81CBF:	.BYTE $AF ; Ø		; DATA XREF: BANK5:9CC4o
		.BYTE $8F ; è
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CBF
unk_81CC6:	.BYTE $B3 ; ≥		; DATA XREF: BANK5:9CCBo
		.BYTE $93 ; ì
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CC6
		.BYTE	4
		.BYTE	0
		.WORD unk_81CAD
unk_81CD1:	.BYTE	0		; DATA XREF: BANK5:9C6Do
		.BYTE	3
		.BYTE	3
		.BYTE $4F ; O
		.BYTE	5
		.BYTE $23 ; #
unk_81CD7:	.BYTE $B1 ; ±		; DATA XREF: BANK5:9CDCo
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CD7
unk_81CDE:	.BYTE $B4 ; ¥		; DATA XREF: BANK5:9CE3o
		.BYTE $95 ; ï
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CDE
		.BYTE	5
		.BYTE $17
unk_81CE7:	.BYTE $B1 ; ±		; DATA XREF: BANK5:9CECo
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CE7
unk_81CEE:	.BYTE $B4 ; ¥		; DATA XREF: BANK5:9CF3o
		.BYTE $95 ; ï
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	7
		.WORD unk_81CEE
		.BYTE	4
		.BYTE	0
		.BYTE $D5 ; ’
		.BYTE $9C ; ú
unk_81CF9:	.BYTE	0		; DATA XREF: BANK5:9C6Fo
		.BYTE	3
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
unk_81D00:	.BYTE $E0 ; ‡		; DATA XREF: BANK5:9D03o
		.BYTE	4
		.BYTE	0
		.WORD unk_81D00
unk_81D05:	.BYTE	5		; DATA XREF: BANK5:9C71o
		.BYTE $22 ; "
		.BYTE $80 ; Ä
		.BYTE	0
unk_81D09:	.BYTE  $F		; DATA XREF: BANK5:8A68o
		.WORD unk_81D14
		.WORD unk_81D56
		.WORD unk_81D7D
		.WORD unk_81DC6
		.WORD unk_81E27
unk_81D14:	.BYTE	0		; DATA XREF: BANK5:9D0Ao
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $20
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $17
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $8D ; ç
		.BYTE $B9 ; π
		.BYTE	6
		.BYTE $98 ; ò
		.BYTE $76 ; v
		.BYTE $D4 ; ‘
		.BYTE $B1 ; ±
		.BYTE $A0 ; †
		.BYTE	6
		.BYTE $92 ; í
		.BYTE $72 ; r
		.BYTE $DB ; €
		.BYTE	6
		.BYTE $99 ; ô
		.BYTE $78 ; x
		.BYTE $D6 ; ÷
		.BYTE $B8 ; ∏
		.BYTE $B4 ; ¥
		.BYTE $96 ; ñ
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $94 ; î
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $30 ; 0
		.BYTE $96 ; ñ
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $9B ; õ
		.BYTE $80 ; Ä
		.BYTE $D9 ; Ÿ
		.BYTE $30 ; 0
		.BYTE $99 ; ô
		.BYTE $30 ; 0
		.BYTE $98 ; ò
		.BYTE $30 ; 0
		.BYTE $99 ; ô
		.BYTE	6
		.BYTE $92 ; í
		.BYTE $72 ; r
		.BYTE $BE ; æ
		.BYTE $BD ; Ω
		.BYTE $BB ; ª
		.BYTE $F9 ; ˘
		.BYTE	9
unk_81D56:	.BYTE	0		; DATA XREF: BANK5:9D0Co
		.BYTE	6
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $C5 ; ≈
		.BYTE $20
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $17
		.BYTE $A0 ; †
		.BYTE $C8 ; »
		.BYTE $A5 ; •
		.BYTE $E1 ; ·
		.BYTE $C6 ; ∆
		.BYTE $C8 ; »
		.BYTE $AD ; ≠
		.BYTE $B2 ; ≤
		.BYTE $B4 ; ¥
		.BYTE $B1 ; ±
		.BYTE $92 ; í
		.BYTE $80 ; Ä
		.BYTE $B2 ; ≤
		.BYTE $94 ; î
		.BYTE $80 ; Ä
		.BYTE $B4 ; ¥
		.BYTE $B5 ; µ
		.BYTE $B6 ; ∂
		.BYTE $B1 ; ±
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $B9 ; π
		.BYTE $B8 ; ∏
		.BYTE $B6 ; ∂
		.BYTE $F4 ; Ù
		.BYTE	9
unk_81D7D:	.BYTE	0		; DATA XREF: BANK5:9D0Eo
		.BYTE	6
		.BYTE	3
		.BYTE $2F ; /
		.BYTE	5
		.BYTE $23 ; #
unk_81D83:	.BYTE $AD ; ≠		; DATA XREF: BANK5:9D87o
		.BYTE $A8 ; ®
		.BYTE	4
		.BYTE	3
		.WORD unk_81D83
		.BYTE $AD ; ≠
		.BYTE $A6 ; ¶
		.BYTE $AD ; ≠
		.BYTE $A6 ; ¶
		.BYTE $AA ; ™
		.BYTE $A6 ; ¶
		.BYTE $AC ; ¨
		.BYTE $A8 ; ®
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A5 ; •
		.BYTE $A5 ; •
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $A8 ; ®
		.BYTE $A3 ; £
		.BYTE $A6 ; ¶
		.BYTE $A8 ; ®
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $30 ; 0
		.BYTE $8D ; ç
		.BYTE $AD ; ≠
		.BYTE $A0 ; †
		.BYTE	3
		.BYTE $5F ; _
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $6A ; j
		.BYTE $6A ; j
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE $A0 ; †
unk_81DBD:	.BYTE $30 ; 0		; DATA XREF: BANK5:9DC1o
		.BYTE $6A ; j
		.BYTE	4
		.BYTE  $B
		.WORD unk_81DBD
		.BYTE $8A ; ä
		.BYTE $8A ; ä
		.BYTE	9
unk_81DC6:	.BYTE	0		; DATA XREF: BANK5:9D10o
		.BYTE	6
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE	3
		.BYTE $3E ; >
unk_81DCD:	.BYTE $83 ; É		; DATA XREF: BANK5:9DE8o
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	1
		.WORD unk_81DCD
unk_81DEA:	.BYTE $83 ; É		; DATA XREF: BANK5:9DFFo
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	3
		.WORD unk_81DEA
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE $A0 ; †
unk_81E1E:	.BYTE $30 ; 0		; DATA XREF: BANK5:9E22o
		.BYTE $63 ; c
		.BYTE	4
		.BYTE  $B
		.WORD unk_81E1E
		.BYTE $83 ; É
		.BYTE $83 ; É
		.BYTE	9
unk_81E27:	.BYTE	1		; DATA XREF: BANK5:9D12o
		.BYTE $21 ; !
		.BYTE $80 ; Ä
		.BYTE	0
unk_81E2B:	.BYTE  $F		; DATA XREF: BANK5:8A6Ao
		.WORD unk_81E36
		.WORD unk_81ECF
		.WORD unk_81F17
		.WORD unk_81F6E
		.WORD unk_81F6F
unk_81E36:	.BYTE	0		; DATA XREF: BANK5:9E2Co
		.BYTE	9
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $FF
		.BYTE $10
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $2A ; *
		.BYTE $C8 ; »
		.BYTE $80 ; Ä
		.BYTE $88 ; à
		.BYTE $6A ; j
		.BYTE	6
		.BYTE $8C ; å
		.BYTE $AD ; ≠
		.BYTE $6C ; l
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $CC ; Ã
		.BYTE $80 ; Ä
		.BYTE $6A ; j
		.BYTE $68 ; h
		.BYTE $C8 ; »
		.BYTE $80 ; Ä
		.BYTE $88 ; à
		.BYTE $6A ; j
		.BYTE	6
		.BYTE $8C ; å
		.BYTE $AD ; ≠
		.BYTE $6C ; l
		.BYTE	6
		.BYTE $8A ; ä
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE	6
		.BYTE $CD ; Õ
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE $B4 ; ¥
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE $B4 ; ¥
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $74 ; t
		.BYTE	6
		.BYTE $96 ; ñ
		.BYTE $B1 ; ±
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AC ; ¨
		.BYTE $AD ; ≠
		.BYTE $AF ; Ø
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $A0 ; †
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE $74 ; t
		.BYTE $74 ; t
		.BYTE $A0 ; †
		.BYTE $71 ; q
		.BYTE $72 ; r
		.BYTE	8
		.BYTE	1
		.BYTE $94 ; î
		.BYTE $96 ; ñ
		.BYTE $98 ; ò
		.BYTE $9B ; õ
		.BYTE $F9 ; ˘
		.BYTE $A0 ; †
		.BYTE	0
		.BYTE  $A
		.BYTE	8
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $21 ; !
		.BYTE $8D ; ç
		.BYTE	6
		.BYTE $CD ; Õ
		.BYTE	5
		.BYTE $1E
		.BYTE	0
		.BYTE  $B
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE $80 ; Ä
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE $AD ; ≠
		.BYTE $80 ; Ä
		.BYTE $8A ; ä
		.BYTE $AD ; ≠
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE $89 ; â
		.BYTE $71 ; q
		.BYTE $6F ; o
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	6
		.BYTE $CD ; Õ
		.BYTE	9
unk_81ECF:	.BYTE	0		; DATA XREF: BANK5:9E2Eo
		.BYTE	9
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE $FF
		.BYTE $10
		.BYTE	8
		.BYTE	0
		.BYTE	5
		.BYTE $1E
		.BYTE $F1 ; Ò
		.BYTE $D1 ; —
		.BYTE $AD ; ≠
		.BYTE $8C ; å
		.BYTE $8A ; ä
		.BYTE $B6 ; ∂
		.BYTE $B2 ; ≤
		.BYTE $B6 ; ∂
		.BYTE $B3 ; ≥
		.BYTE	6
		.BYTE $D4 ; ‘
		.BYTE $A0 ; †
		.BYTE $ED ; Ì
		.BYTE $D1 ; —
		.BYTE $A0 ; †
		.BYTE $8F ; è
		.BYTE $8D ; ç
		.BYTE $B6 ; ∂
		.BYTE $B2 ; ≤
		.BYTE $B4 ; ¥
		.BYTE $B2 ; ≤
		.BYTE	6
		.BYTE $D4 ; ‘
		.BYTE $A0 ; †
		.BYTE $D9 ; Ÿ
		.BYTE $D8 ; ÿ
		.BYTE	6
		.BYTE $D6 ; ÷
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $B2 ; ≤
		.BYTE $B6 ; ∂
		.BYTE $B3 ; ≥
		.BYTE $B4 ; ¥
		.BYTE $B6 ; ∂
		.BYTE $B8 ; ∏
		.BYTE $80 ; Ä
		.BYTE $94 ; î
		.BYTE $DD ; ›
		.BYTE $DB ; €
		.BYTE	5
		.BYTE $2A ; *
		.BYTE $91 ; ë
		.BYTE $92 ; í
		.BYTE $94 ; î
		.BYTE $95 ; ï
		.BYTE $F6 ; ˆ
		.BYTE $A0 ; †
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE $A0 ; †
		.BYTE $C5 ; ≈
		.BYTE $C3 ; √
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $E1 ; ·
		.BYTE	9
unk_81F17:	.BYTE	0		; DATA XREF: BANK5:9E30o
		.BYTE	9
		.BYTE	3
		.BYTE $4F ; O
		.BYTE	5
		.BYTE $1E
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AC ; ¨
		.BYTE $AC ; ¨
		.BYTE $AA ; ™
		.BYTE $AA ; ™
		.BYTE $A8 ; ®
		.BYTE $A8 ; ®
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A7 ; ß
		.BYTE $A7 ; ß
		.BYTE $A8 ; ®
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $B1 ; ±
		.BYTE $B1 ; ±
		.BYTE $AF ; Ø
		.BYTE $AF ; Ø
		.BYTE $AA ; ™
		.BYTE $AA ; ™
		.BYTE $A8 ; ®
		.BYTE $A8 ; ®
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A8 ; ®
		.BYTE $A8 ; ®
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AC ; ¨
		.BYTE $AC ; ¨
		.BYTE $AA ; ™
		.BYTE $AA ; ™
		.BYTE $A8 ; ®
		.BYTE $A8 ; ®
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A7 ; ß
		.BYTE $A7 ; ß
		.BYTE $A8 ; ®
		.BYTE $AA ; ™
		.BYTE $AC ; ¨
		.BYTE $8D ; ç
		.BYTE $8F ; è
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $AC ; ¨
		.BYTE $AC ; ¨
		.BYTE $AA ; ™
		.BYTE	3
		.BYTE $81 ; Å
		.BYTE $AA ; ™
		.BYTE $E8 ; Ë
		.BYTE $A0 ; †
		.BYTE	0
		.BYTE  $A
		.BYTE $A0 ; †
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A8 ; ®
		.BYTE $A8 ; ®
		.BYTE $AD ; ≠
		.BYTE $AD ; ≠
		.BYTE $CD ; Õ
		.BYTE	0
		.BYTE  $B
		.BYTE $A0 ; †
		.BYTE $A6 ; ¶
		.BYTE $A6 ; ¶
		.BYTE $A8 ; ®
		.BYTE $88 ; à
		.BYTE $8C ; å
		.BYTE	6
		.BYTE $CD ; Õ
		.BYTE	9
unk_81F6E:	.BYTE	9		; DATA XREF: BANK5:9E32o
unk_81F6F:	.BYTE	0		; DATA XREF: BANK5:9E34o
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	4
		.WORD loc_80020+1
		.BYTE	0
unk_81F77:	.BYTE  $F		; DATA XREF: BANK5:8A6Co
		.WORD unk_81F82
		.WORD unk_81FF8
		.WORD unk_8209E
		.WORD unk_820D6
		.WORD unk_8212A
unk_81F82:	.BYTE	0		; DATA XREF: BANK5:9F78o
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	8
		.BYTE	1
		.BYTE	5
		.BYTE $21 ; !
		.BYTE	0
		.BYTE	8
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	6
		.BYTE $A5 ; •
		.BYTE $66 ; f
		.BYTE $67 ; g
		.BYTE $C8 ; »
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $6A ; j
		.BYTE $6B ; k
		.BYTE $CC ; Ã
		.BYTE	6
		.BYTE $AB ; ´
		.BYTE $6A ; j
		.BYTE $69 ; i
		.BYTE $C8 ; »
		.BYTE	6
		.BYTE $A7 ; ß
		.BYTE $66 ; f
		.BYTE $65 ; e
		.BYTE $C4 ; ƒ
		.BYTE	0
		.BYTE	7
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $6A ; j
		.BYTE $6B ; k
		.BYTE $CC ; Ã
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $6E ; n
		.BYTE $6F ; o
		.BYTE $D0 ; –
		.BYTE	6
		.BYTE $AF ; Ø
		.BYTE $6E ; n
		.BYTE $6D ; m
		.BYTE $CC ; Ã
		.BYTE	6
		.BYTE $AB ; ´
		.BYTE $6A ; j
		.BYTE $69 ; i
		.BYTE $C8 ; »
unk_81FC1:	.BYTE	0		; DATA XREF: BANK5:9FF6o
		.BYTE	6
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	8
		.BYTE	0
		.BYTE	7
		.BYTE $AF ; Ø
		.BYTE $20
		.BYTE	5
		.BYTE $15
		.BYTE	6
		.BYTE $A5 ; •
		.BYTE $66 ; f
		.BYTE $67 ; g
		.BYTE $C8 ; »
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $6A ; j
		.BYTE $6B ; k
		.BYTE $CC ; Ã
		.BYTE	6
		.BYTE $AB ; ´
		.BYTE $6A ; j
		.BYTE $69 ; i
		.BYTE $C8 ; »
		.BYTE	6
		.BYTE $A7 ; ß
		.BYTE $66 ; f
		.BYTE $65 ; e
		.BYTE $C4 ; ƒ
		.BYTE	6
		.BYTE $A9 ; ©
		.BYTE $6A ; j
		.BYTE $6B ; k
		.BYTE $CC ; Ã
		.BYTE	6
		.BYTE $AD ; ≠
		.BYTE $6E ; n
		.BYTE $6F ; o
		.BYTE $D0 ; –
		.BYTE	6
		.BYTE $B1 ; ±
		.BYTE $72 ; r
		.BYTE $73 ; s
		.BYTE $D4 ; ‘
		.BYTE	6
		.BYTE $B5 ; µ
		.BYTE $76 ; v
		.BYTE $77 ; w
		.BYTE $D8 ; ÿ
		.BYTE	4
		.BYTE	0
		.WORD unk_81FC1
unk_81FF8:	.BYTE	3		; DATA XREF: BANK5:9F7Ao
		.BYTE $3A ; :
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	7
		.BYTE $DF ; ﬂ
		.BYTE $10
		.BYTE	8
		.BYTE	1
		.BYTE	5
		.BYTE $15
		.BYTE	0
		.BYTE	8
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $6B ; k
		.BYTE $6C ; l
		.BYTE $CD ; Õ
		.BYTE	6
		.BYTE $AE ; Æ
		.BYTE $6F ; o
		.BYTE $70 ; p
		.BYTE $D1 ; —
		.BYTE	6
		.BYTE $B0 ; ∞
		.BYTE $6F ; o
		.BYTE $6E ; n
		.BYTE $CD ; Õ
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $6B ; k
		.BYTE $6A ; j
		.BYTE $C9 ; …
		.BYTE	0
		.BYTE	7
		.BYTE	6
		.BYTE $AA ; ™
		.BYTE $6B ; k
		.BYTE $6C ; l
		.BYTE $CD ; Õ
		.BYTE	6
		.BYTE $AE ; Æ
		.BYTE $6F ; o
		.BYTE $70 ; p
		.BYTE $D0 ; –
		.BYTE	6
		.BYTE $B0 ; ∞
		.BYTE $6F ; o
		.BYTE $6E ; n
		.BYTE $CD ; Õ
		.BYTE	6
		.BYTE $AC ; ¨
		.BYTE $6B ; k
		.BYTE $6A ; j
		.BYTE $C9 ; …
unk_8202F:	.BYTE	0		; DATA XREF: BANK5:A09Co
		.BYTE	6
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	7
		.BYTE $82 ; Ç
		.BYTE $20
		.BYTE	5
		.BYTE $15
		.BYTE	8
		.BYTE	2
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $85 ; Ö
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $87 ; á
		.BYTE $30 ; 0
		.BYTE $88 ; à
		.BYTE $30 ; 0
		.BYTE $88 ; à
		.BYTE $30 ; 0
		.BYTE $88 ; à
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $89 ; â
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8A ; ä
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8B ; ã
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE $30 ; 0
		.BYTE $8C ; å
		.BYTE	4
		.BYTE	0
		.WORD unk_8202F
unk_8209E:	.BYTE	0		; DATA XREF: BANK5:9F7Co
		.BYTE	8
		.BYTE	3
		.BYTE $4F ; O
		.BYTE	5
		.BYTE $21 ; !
unk_820A4:	.BYTE $A0 ; †		; DATA XREF: BANK5:A0A8o
		.BYTE $AA ; ™
		.BYTE	4
		.BYTE	7
		.WORD unk_820A4
		.BYTE	5
		.BYTE $2D ; -
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	0
		.BYTE	7
unk_820B0:	.BYTE $89 ; â		; DATA XREF: BANK5:A0B8o
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE $80 ; Ä
		.BYTE $69 ; i
		.BYTE $69 ; i
		.BYTE	4
		.BYTE	7
		.WORD unk_820B0
unk_820BA:	.BYTE	5		; DATA XREF: BANK5:A0D4o
		.BYTE $21 ; !
		.BYTE	3
		.BYTE $5F ; _
		.BYTE	0
		.BYTE	6
unk_820C0:	.BYTE $AA ; ™		; DATA XREF: BANK5:A0C4o
		.BYTE $A5 ; •
		.BYTE	4
		.BYTE	7
		.WORD unk_820C0
		.BYTE $A9 ; ©
		.BYTE $A5 ; •
		.BYTE	4
		.BYTE	6
		.BYTE $C6 ; ∆
		.BYTE $A0 ; †
		.BYTE $30 ; 0
		.BYTE $A9 ; ©
		.BYTE $30 ; 0
		.BYTE $A9 ; ©
		.BYTE $30 ; 0
		.BYTE $A9 ; ©
		.BYTE	4
		.BYTE	0
		.WORD unk_820BA
unk_820D6:	.BYTE	0		; DATA XREF: BANK5:9F7Eo
		.BYTE	8
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE	3
		.BYTE $3D ; =
unk_820DD:	.BYTE $A0 ; †		; DATA XREF: BANK5:A0E1o
		.BYTE $A3 ; £
		.BYTE	4
		.BYTE	6
		.WORD unk_820DD
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE	0
		.BYTE	7
unk_820EB:	.BYTE $A3 ; £		; DATA XREF: BANK5:A0F9o
		.BYTE $A3 ; £
		.BYTE $A3 ; £
		.BYTE $A3 ; £
		.BYTE $A3 ; £
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE	4
		.BYTE	1
		.WORD unk_820EB
unk_820FB:	.BYTE	3		; DATA XREF: BANK5:A128o
		.BYTE $3D ; =
		.BYTE	0
		.BYTE	6
unk_820FF:	.BYTE $83 ; É		; DATA XREF: BANK5:A112o
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $60 ; `
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE	4
		.BYTE	6
		.WORD unk_820FF
		.BYTE $83 ; É
		.BYTE $63 ; c
		.BYTE $63 ; c
		.BYTE $83 ; É
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE $30 ; 0
		.BYTE $63 ; c
		.BYTE	3
		.BYTE $3E ; >
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE $30 ; 0
		.BYTE $A3 ; £
		.BYTE	4
		.BYTE	0
		.WORD unk_820FB
unk_8212A:	.BYTE	2		; DATA XREF: BANK5:9F80o
		.BYTE $62 ; b
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE $82 ; Ç
		.BYTE	1
unk_82136:	.BYTE  $F		; DATA XREF: BANK5:8A6Eo
		.WORD unk_82141
		.WORD unk_8214C
		.WORD unk_82157
		.WORD unk_8215F
		.WORD unk_82168
unk_82141:	.BYTE	3		; DATA XREF: BANK5:A137o
		.BYTE $3A ; :
		.BYTE	0
		.BYTE	6
		.BYTE	5
		.BYTE $19
		.BYTE	7
		.BYTE $B5 ; µ
		.BYTE $30 ; 0
		.BYTE $F8 ; ¯
		.BYTE	9
unk_8214C:	.BYTE	3		; DATA XREF: BANK5:A139o
		.BYTE $3A ; :
		.BYTE	0
		.BYTE	6
		.BYTE	5
		.BYTE $19
		.BYTE	7
		.BYTE $95 ; ï
		.BYTE $10
		.BYTE $F6 ; ˆ
		.BYTE	9
unk_82157:	.BYTE	3		; DATA XREF: BANK5:A13Bo
		.BYTE $2F ; /
		.BYTE	0
		.BYTE	6
		.BYTE	5
		.BYTE $25 ; %
		.BYTE $F2 ; Ú
		.BYTE	9
unk_8215F:	.BYTE	3		; DATA XREF: BANK5:A13Do
		.BYTE $3D ; =
		.BYTE	0
		.BYTE	6
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $30 ; 0
		.BYTE $EC ; Ï
		.BYTE	9
unk_82168:	.BYTE $20		; DATA XREF: BANK5:8A70o BANK5:A13Fo
		.BYTE  $A
		.BYTE	1
		.BYTE $2F ; /
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $80 ; Ä
		.BYTE $D5 ; ’
		.BYTE	0
		.BYTE	3
		.BYTE	1
		.BYTE $1F
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $80 ; Ä
		.BYTE  $E
		.BYTE	1
		.BYTE $1F
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE	0
		.BYTE	5
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_82183:	.BYTE $20		; DATA XREF: BANK5:8A72o
		.BYTE  $A
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE  $B
		.BYTE $81 ; Å
		.BYTE $7D ; }
		.BYTE	0
		.BYTE	8
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_82196:	.BYTE $20		; DATA XREF: BANK5:8A74o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE $10
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $80 ; Ä
		.BYTE $FE ; ˛
		.BYTE	0
		.BYTE	7
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE	9
		.BYTE	1
		.BYTE $15
		.BYTE $81 ; Å
		.BYTE $FC ; ¸
		.BYTE	0
		.BYTE  $C
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_821B1:	.BYTE $20		; DATA XREF: BANK5:8A76o
		.BYTE  $A
		.BYTE	5
		.BYTE	4
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE	0
		.BYTE  $A
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_821C7:	.BYTE $10		; DATA XREF: BANK5:8A78o
		.BYTE	2
		.BYTE	0
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE $7F ; 
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $81 ; Å
		.BYTE $1D
		.BYTE	6
unk_821D4:	.BYTE $90 ; ê		; DATA XREF: BANK5:8A7Ao
		.BYTE	2
		.BYTE	0
		.BYTE $13
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $F2 ; Ú
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $FE ; ˛
		.BYTE	6
unk_821E1:	.BYTE $B0 ; ∞		; DATA XREF: BANK5:8A7Co
		.BYTE	3
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $F5 ; ı
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $6B ; k
		.BYTE	0
		.BYTE	7
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $F5 ; ı
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $6A ; j
		.BYTE	1
		.BYTE $F5 ; ı
		.BYTE $80 ; Ä
		.BYTE $48 ; H
		.BYTE	0
		.BYTE	7
		.BYTE	1
		.BYTE $F5 ; ı
		.BYTE $80 ; Ä
		.BYTE $47 ; G
unk_821FF:	.BYTE	1		; DATA XREF: BANK5:A20Bo
		.BYTE $FA ; ˙
		.BYTE $80 ; Ä
		.BYTE $36 ; 6
		.BYTE	0
		.BYTE	5
		.BYTE	1
		.BYTE $FA ; ˙
		.BYTE $80 ; Ä
		.BYTE $35 ; 5
		.BYTE	4
		.BYTE	3
		.WORD unk_821FF
		.BYTE	6
unk_8220E:	.BYTE $D0 ; –		; DATA XREF: BANK5:8A7Eo
		.BYTE  $A
		.BYTE	1
		.BYTE $E9 ; È
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	0
		.BYTE	7
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	9
		.BYTE	6
unk_82221:	.BYTE $10		; DATA XREF: BANK5:8A80o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE $2E ; .
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	5
		.BYTE	1
		.BYTE $E5 ; Â
		.BYTE $82 ; Ç
		.BYTE	4
		.BYTE $81 ; Å
		.BYTE $C5
		.BYTE	0
		.BYTE	8
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE	1
		.BYTE $E5 ; Â
		.BYTE $82 ; Ç
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE  $F
		.BYTE	6
unk_8223C:	.BYTE $40 ; @		; DATA XREF: BANK5:8A82o
		.BYTE	8
		.BYTE	0
		.BYTE	8
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $80 ; Ä
		.BYTE	9
		.BYTE	6
unk_82245:	.BYTE $50 ; P		; DATA XREF: BANK5:8A84o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE $25 ; %
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	7
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	1
		.BYTE $3F ; ?
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $81 ; Å
		.BYTE $FC ; ¸
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $80 ; Ä
		.BYTE  $E
		.BYTE	1
		.BYTE $1F
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE	6
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE $80 ; Ä
		.BYTE  $E
		.BYTE	6
unk_8226E:	.BYTE $60 ; `		; DATA XREF: BANK5:8A86o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE	5
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $8A ; ä
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $E
		.BYTE	1
		.BYTE $18
		.BYTE $82 ; Ç
		.BYTE $A7 ; ß
		.BYTE	0
		.BYTE $12
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE	6
unk_82287:	.BYTE $70 ; p		; DATA XREF: BANK5:8A88o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE	7
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $82 ; Ç
		.BYTE $FA ; ˙
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE	8
		.BYTE	1
		.BYTE $1C
		.BYTE $84 ; Ñ
		.BYTE $75 ; u
		.BYTE	0
		.BYTE $10
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_822A0:	.BYTE $80 ; Ä		; DATA XREF: BANK5:8A8Ao
		.BYTE  $F
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE	0
		.BYTE $43 ; C
		.BYTE $86 ; Ü
		.BYTE	3
		.BYTE	1
		.BYTE	5
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	5
		.BYTE	0
		.BYTE $43 ; C
		.BYTE $86 ; Ü
		.BYTE	3
		.BYTE	1
		.BYTE	4
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $8A ; ä
		.BYTE	5
		.BYTE	2
		.BYTE $23 ; #
		.BYTE $84 ; Ñ
		.BYTE	2
		.BYTE	1
		.BYTE	3
		.BYTE	3
		.BYTE $81 ; Å
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	1
		.BYTE $15
		.BYTE $81 ; Å
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $13
		.BYTE $82 ; Ç
		.BYTE $A7 ; ß
		.BYTE	1
		.BYTE	1
		.BYTE $82 ; Ç
		.BYTE $FA ; ˙
		.BYTE	0
		.BYTE $15
		.BYTE $80 ; Ä
		.BYTE	7
		.BYTE	1
		.BYTE $1A
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	1
		.BYTE $1C
		.BYTE $81 ; Å
		.BYTE $C5 ; ≈
		.BYTE	1
		.BYTE $1D
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	0
		.BYTE $25 ; %
		.BYTE $80 ; Ä
		.BYTE  $A
		.BYTE	6
unk_822EE:	.BYTE $C0 ; ¿		; DATA XREF: BANK5:8A8Co
		.BYTE	2
		.BYTE	0
		.BYTE	8
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	6

unk_8244D:	.BYTE $A0 ; †		; DATA XREF: BANK5:8A8Eo
		.BYTE  $F
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE  $A
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	5
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE $25 ; %
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	6
unk_8247A:	.BYTE $20		; DATA XREF: BANK5:8A90o
		.BYTE	7
		.BYTE	5
		.BYTE	4
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	0
		.BYTE $25 ; %
		.BYTE	3
		.BYTE $81 ; Å
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE $12
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	4
		.BYTE	5
		.BYTE $7C ; |
		.BYTE $A4 ; §
		.BYTE	6
unk_824A0:	.BYTE $A0 ; †		; DATA XREF: BANK5:8A92o
		.BYTE  $F
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	1
		.BYTE $FF
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $1F
		.BYTE	1
		.BYTE $FF
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $1C
		.BYTE	3
		.BYTE	0
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE	6
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	1
		.BYTE	2
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	1
		.BYTE	2
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE $19
		.BYTE	1
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	1
		.BYTE	1
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	1
		.BYTE	1
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE	9
		.BYTE	1
		.BYTE	1
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	6
unk_824DF:	.BYTE $F0 ; 		; DATA XREF: BANK5:8A94o
		.BYTE  $F
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $81 ; Å
		.BYTE $1D
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE $20
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $81 ; Å
		.BYTE $1D
		.BYTE	3
		.BYTE	0
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE	4
		.BYTE	1
		.BYTE $1F
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $A
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	1
		.BYTE $10
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE	8
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE  $F
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	0
		.BYTE	2
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $80 ; Ä
		.BYTE	1
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE $34 ; 4
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE $35 ; 5
		.BYTE	1
		.BYTE $FF
		.BYTE	3
		.BYTE $6F ; o
		.BYTE $80 ; Ä
		.BYTE $1A
		.BYTE	0
		.BYTE  $A
		.BYTE $80 ; Ä
		.BYTE	1
		.BYTE	6
unk_82530:	.BYTE $E0 ; ‡		; DATA XREF: BANK5:8A96o
		.BYTE  $F
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE	5
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE	4
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $86 ; Ü
		.BYTE $AE ; Æ
		.BYTE	1
		.BYTE	3
		.BYTE	3
		.BYTE $81 ; Å
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	0
		.BYTE  $C
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE $80 ; Ä
		.BYTE  $F
		.BYTE	1
		.BYTE	5
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	1
		.BYTE	1
		.BYTE $81 ; Å
		.BYTE $1D
		.BYTE	0
		.BYTE $10
		.BYTE	2
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	1
		.BYTE $1A
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	1
		.BYTE $1C
		.BYTE $81 ; Å
		.BYTE $C5 ; ≈
		.BYTE	1
		.BYTE $1D
		.BYTE $81 ; Å
		.BYTE $53 ; S
		.BYTE	0
		.BYTE $1A
		.BYTE $80 ; Ä
		.BYTE  $F
		.BYTE	6
unk_82573:	.BYTE $C0 ; ¿		; DATA XREF: BANK5:8A98o
		.BYTE	3
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	0
		.BYTE $4B ; K
		.BYTE	1
		.BYTE	2
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	6
unk_82586:	.BYTE $C0 ; ¿		; DATA XREF: BANK5:8A9Ao
		.BYTE  $B
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE $FC ; ¸
		.BYTE $83 ; É
		.BYTE $FD ; ˝
		.BYTE	0
		.BYTE	5
		.BYTE	3
		.BYTE $35 ; 5
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	3
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	4
		.BYTE	2
		.BYTE $88 ; à
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE	1
		.BYTE $FC ; ¸
		.BYTE $83 ; É
		.BYTE $FD ; ˝
		.BYTE	0
		.BYTE	5
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3C ; <
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	3
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	4
		.BYTE	2
		.BYTE $A8 ; ®
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE	1
		.BYTE $FC ; ¸
		.BYTE $83 ; É
		.BYTE $FD ; ˝
		.BYTE	0
		.BYTE	4
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3D ; =
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	2
		.BYTE	3
		.BYTE $3C ; <
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	4
		.BYTE	2
		.BYTE $C8 ; »
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	1
		.BYTE $FC ; ¸
		.BYTE $83 ; É
		.BYTE $FD ; ˝
		.BYTE	0
		.BYTE	4
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3E ; >
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	2
		.BYTE	3
		.BYTE $3E ; >
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	4
		.BYTE	3
		.BYTE $E8 ; Ë
		.BYTE $A5 ; •
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE	1
		.BYTE $FC ; ¸
		.BYTE $83 ; É
		.BYTE $FD ; ˝
		.BYTE	0
		.BYTE	3
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	1
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $F9 ; ˘
		.BYTE	0
		.BYTE	1
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE	4
		.BYTE	4
		.BYTE	3
		.BYTE	8
		.BYTE $A6 ; ¶
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $82 ; Ç
		.BYTE $3B ; ;
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $83 ; É
		.BYTE $57 ; W
		.BYTE	0
		.BYTE  $C
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE	1
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE	1
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $15
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE	2
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE	1
		.BYTE	2
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $15
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE	1
		.BYTE $FF
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE	1
		.BYTE $FF
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $20
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $35 ; 5
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	3
		.BYTE $35 ; 5
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $20
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $34 ; 4
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	3
		.BYTE $34 ; 4
		.BYTE	1
		.BYTE $FE ; ˛
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $20
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	6
unk_82695:	.BYTE $A0 ; †		; DATA XREF: BANK5:8A9Co
		.BYTE	2
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	0
		.BYTE  $A
		.BYTE	5
		.BYTE	3
		.BYTE $83 ; É
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE  $B
		.BYTE	3
		.BYTE $37 ; 7
		.BYTE $82 ; Ç
		.BYTE $81 ; Å
		.BYTE	0
		.BYTE  $A
		.BYTE	1
		.BYTE  $B
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE	9
		.BYTE	1
		.BYTE  $C
		.BYTE	3
		.BYTE $3D ; =
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE	9
		.BYTE	1
		.BYTE  $D
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE	8
		.BYTE	1
		.BYTE  $E
		.BYTE	3
		.BYTE $3B ; ;
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE	7
		.BYTE	1
		.BYTE  $F
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE  $F
		.BYTE	1
		.BYTE $F4 ; Ù
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	0
		.BYTE $13
		.BYTE	1
		.BYTE $F1 ; Ò
		.BYTE	3
		.BYTE $35 ; 5
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	6
unk_826DF:	.BYTE $40 ; @		; DATA XREF: BANK5:8A9Eo
		.BYTE	8
		.BYTE	0
		.BYTE	4
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE	6
		.BYTE	6
unk_826E8:	.BYTE $60 ; `		; DATA XREF: BANK5:8AA0o
		.BYTE  $A
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	1
		.BYTE	8
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $81 ; Å
		.BYTE $7D ; }
		.BYTE	0
		.BYTE  $A
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE  $D
		.BYTE	1
		.BYTE $15
		.BYTE $80 ; Ä
		.BYTE $FE ; ˛
		.BYTE	0
		.BYTE $13
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE	6
unk_82701:	.BYTE $70 ; p		; DATA XREF: BANK5:8AA2o
		.BYTE  $F
		.BYTE	2
		.BYTE $40 ; @
		.BYTE	5
		.BYTE	1
		.BYTE $41 ; A
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $39 ; 9
		.BYTE $80 ; Ä
		.BYTE $38 ; 8
		.BYTE	1
		.BYTE	1
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $80 ; Ä
		.BYTE $35 ; 5
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE $19
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $35 ; 5
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	7
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $33 ; 3
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $34 ; 4
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	7
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	1
		.BYTE	1
		.BYTE	3
		.BYTE $33 ; 3
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE	1
		.BYTE	2
		.BYTE	3
		.BYTE $30 ; 0
		.BYTE $8F ; è
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	7
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	6
unk_82755:	.BYTE $40 ; @		; DATA XREF: BANK5:8AA4o
		.BYTE  $A
		.BYTE	1
		.BYTE $B1 ; ±
		.BYTE	3
		.BYTE $3A ; :
		.BYTE $81 ; Å
		.BYTE $FC ; ¸
		.BYTE	0
		.BYTE	7
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	1
		.BYTE $FF
		.BYTE $80 ; Ä
		.BYTE	9
		.BYTE	6
unk_82768:	.BYTE $50 ; P		; DATA XREF: BANK5:8AA6o
		.BYTE	2
		.BYTE	0
		.BYTE	6
		.BYTE	2
		.BYTE $C0 ; ¿
		.BYTE	3
		.BYTE $3A ; :
		.BYTE	1
		.BYTE	7
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE	0
		.BYTE $22 ; "
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE	5
		.BYTE	2
		.BYTE $62 ; b
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE	1
		.BYTE $FA ; ˙
		.BYTE $81 ; Å
		.BYTE $AB ; ´
		.BYTE	6
unk_82784:	.BYTE $40 ; @		; DATA XREF: BANK5:8AA8o
		.BYTE	7
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE	2
		.BYTE $80 ; Ä
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	4
		.BYTE	3
		.BYTE $7F ; 
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	4
		.BYTE  $B
		.BYTE $86 ; Ü
		.BYTE $A7 ; ß
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE $70 ; p
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	4
		.BYTE  $B
		.BYTE $B0 ; ∞
		.BYTE $A7 ; ß
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE $70 ; p
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $38 ; 8
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	4
		.BYTE	6
		.BYTE $D4 ; ‘
		.BYTE $A7 ; ß
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	3
		.BYTE $36 ; 6
		.BYTE $80 ; Ä
		.BYTE $8F ; è
		.BYTE	0
		.BYTE	4
		.BYTE $80 ; Ä
		.BYTE $8E ; é
		.BYTE	6
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0

morze2:
                .BYTE $C0 ; ¿		; DATA XREF: BANK5:8A8Co
		.BYTE	2
		.BYTE	0
		.BYTE	8
		.BYTE	3
		.BYTE $3F ; ?
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		.BYTE	0
		.BYTE	3
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE $7F ; 
		
		.BYTE	0
		.BYTE	8
		.BYTE $80 ; Ä
		.BYTE	0
		.BYTE	6
