jmp main
Win: string "    VOCE VENCEU A BASICA!    "
Dead: string "       VOCE MORREU!       "
Msg: string "     Jogar novamente? (s/n)"

Letra: var #1			; Contem a letra que foi digitada

posPlayer: var #1			; Contem a posicao atual da Player
posAntPlayer: var #1		; Contem a posicao anterior da Player

posInimigo1: var #1		; Contem a posicao atual do Inimigo1
posAntInimigo1: var #1		; Contem a posicao anterior do Inimigo


posInimigo2: var #1		; Contem a posicao atual do Inimigo
posAntInimigo2: var #1	; Contem a posicao anterior do Inimigo


posInimigo3: var #1		; Contem a posicao atual do Inimigo
posAntInimigo3: var #1	; Contem a posicao anterior do Inimigo


posInimigo4: var #1		; Contem a posicao atual do Inimigo
posAntInimigo4: var #1	; Contem a posicao anterior do Inimigo


posInimigo5: var #1		; Contem a posicao atual do Inimigo
posAntInimigo5: var #1	; Contem a posicao anterior do Inimigo


posInimigo6: var #1		; Contem a posicao atual do Inimigo
posAntInimigo6: var #1	; Contem a posicao anterior do Inimigo


posBandeira1: var #1
posBandeira2: var #1
posBandeira3: var #1
posBandeira4: var #1

posFinalBandeira1: var #1
posFinalBandeira2: var #1
posFinalBandeira3: var #1
posFinalBandeira4: var #1

pegouBandeira1: var #1
pegouBandeira2: var #1
pegouBandeira3: var #1
pegouBandeira4: var #1 

colocouBandeira1: var #1
colocouBandeira2: var #1
colocouBandeira3: var #1
colocouBandeira4: var #1


posicaoInimigoInicial: var #1
posicaoInimigoAtual: var #1
posCorreta: var #1
posInimigoAnterior: var #1


;Codigo principal
main:
	;---Tela Inicial---;
	call ApagaTela
	loadn r1, #telaInicioLinha0		; Imprime a tela inicial do jogo;
	loadn r2, #1536                   ; Cor da tela inicial #512 --> verde
	call ImprimeTela
	
	Loop_Inicio:
		call DigLetra 			; Le uma letra do teclado
		loadn r0, #' '			; Quando a tecla espaco for acionada, comeca o jogo
		load r1, Letra
		cmp r0, r1
		jne Loop_Inicio
	
	
	;---Inicio do Jogo---;
	call ApagaTela
	;loadn r1, #tela1Linha0		; Endereco onde comeca a primeira linha do cenario!!
	;loadn r2, #1536 			; cor azul!
	;call ImprimeTela2   		;  rotina de Impresao de Cenario na Tela Inteira
    
	loadn r1, #tela2Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #768 			; cor verde! --mesa
	call ImprimeTela2   		;  rotina de Impresao de Cenario na Tela Inteira
    
	loadn r1, #tela3Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #256   			; cor vermelha! -contornos das bandejas
	call ImprimeTela2   		;  rotina de Impresao de Cenario na Tela Inteira

	loadn r1, #tela4Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #2560		    ; cor amerela! -borda
	call ImprimeTela2   		;  rotina de Impresao de Cenario na Tela Inteira

	Loadn r0, #566
	store posPlayer, r0		; Seta Posicao Atual da Player
	store posAntPlayer, r0	; Seta Posicao Anterior da Player
	
	Loadn r0, #63		 
	store posInimigo1, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo1, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #1

	
	Loadn r0, #922			 
	store posInimigo2, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo2, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #2

	
	Loadn r0, #1116			 
	store posInimigo3, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo3, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #3

	
	Loadn r0, #278			 
	store posInimigo4, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo4, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #1

	
	Loadn r0, #1100		 
	store posInimigo5, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo5, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #3

	
	Loadn r0, #455 
	store posInimigo6, r0		; Seta Posicao Atual do Inimigo
	store posAntInimigo6, r0	; Seta Posicao Anterior do Inimigo
	loadn r0, #3

	 
	 
	;Posições das Bandeiras no campo inimigo
	Loadn r0, #597
	store posBandeira1, r0		; Seta Posicao da Bandeira 1 #
	
	Loadn r0, #596
	store posBandeira2, r0		; Seta Posicao da Bandeira 2 P
	
	Loadn r0, #595
	store posBandeira3, r0		; Seta Posicao da Bandeira 3 S
	
	Loadn r0, #594                                            
	store posBandeira4, r0		; Seta Posicao da Bandeira 4 U
	;---------------------------;
	
	;Posições que as bandeiras devem ficar no campo do jogador
	Loadn r0, #323
	store posFinalBandeira1, r0		; Seta Posicao da Bandeira 1 
	
	Loadn r0, #483
	store posFinalBandeira2, r0		; Seta Posicao da Bandeira 2 
	
	Loadn r0, #643
	store posFinalBandeira3, r0		; Seta Posicao da Bandeira 3 
	
	Loadn r0, #803
	store posFinalBandeira4, r0		; Seta Posicao da Bandeira 4 
	;-------------------------------;
	
	loadn r0, #0
	store pegouBandeira1, r0		; Inicializar var que controlam as bandeiras capturadas
	store pegouBandeira2, r0		
	store pegouBandeira3, r0		
	store pegouBandeira4, r0	
	
	store colocouBandeira1, r0		; Inicializar var que controlam as bandeiras colocadas no campo
	store colocouBandeira2, r0		
	store colocouBandeira3, r0		
	store colocouBandeira4, r0

	 
	call MovePlayer_Desenha
		
	call Bandeira1_Desenha
	call Bandeira2_Desenha
	call Bandeira3_Desenha
	call Bandeira4_Desenha
		
	
	
	 
	
	loadn r0, #0			; Contador para os Mods	= 0
	loadn r2, #0			; Para verificar se (mod(c/10)==0	
	
	Loop:
	
		loadn r1, #10
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq MovePlayer	; Chama rotina de movimentacao da Player
	
		
		
		load r6, posInimigo1
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo1
		store posInimigoAnterior, r6
		loadn r6,#49 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo1,r6
		load r6,posInimigoAnterior
		store posAntInimigo1, r6
		

		
		load r6, posInimigo2
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo2
		store posInimigoAnterior, r6
		loadn r6,#52 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo 2
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo2,r6
		load r6,posInimigoAnterior
		store posAntInimigo2, r6
		
		
		
		load r6, posInimigo3
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo3
		store posInimigoAnterior, r6
		loadn r6,#70 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo 3
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo3,r6
		load r6,posInimigoAnterior
		store posAntInimigo3, r6
		

		load r6, posInimigo4
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo4
		store posInimigoAnterior, r6
		loadn r6,#65 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6

		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo 4
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo4,r6
		load r6,posInimigoAnterior
		store posAntInimigo4, r6
		

		load r6, posInimigo5
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo5
		store posInimigoAnterior, r6
		loadn r6,#59 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6

		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0	
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo 5
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo5,r6
		load r6,posInimigoAnterior
		store posAntInimigo5, r6
		
		
		
		load r6, posInimigo6
		store posicaoInimigoAtual, r6
		load r6,posAntInimigo6
		store posInimigoAnterior, r6
		loadn r6,#55 ;inimigo 1 comeca na pos 49
		store posicaoInimigoInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0	
		ceq MoveInimigo	; Chama rotina de movimentacao do Inimigo 5
		load r6,posicaoInimigoAtual ;inimigo 1 comeca na pos 49
		store posInimigo6,r6
		load r6,posInimigoAnterior
		store posAntInimigo6, r6
		
		loadn r1, #10
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
		ceq ChecaPos	; Chama rotina de verificacao de colisao
	
		call Delay
		inc r0 	;c++
		jmp Loop



;Funcoes
;--------------------------
;-----------Player-----------
;--------------------------

MovePlayer:
	push r0
	push r1
		
	call MovePlayer_recalculaPos		; recalcula Posicao da Player

	; So Apaga e redesenha se (pos != posAnt)
	; if (posPlayer != posAntPlayer)	{	
	load r0, posPlayer
	load r1, posAntPlayer
	cmp r0, r1
	jeq MovePlayer_Skip
	call MovePlayer_Apaga
	call MovePlayer_Desenha		;}
	
	MovePlayer_Skip:	
		pop r1
		pop r0
		rts
		
;------------------------
		
MovePlayer_Apaga:		; Apaga a Player preservando o Cenario!
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	load r0, posAntPlayer	; r0 = posAnt
	
	; --> r2 = Tela1Linha0 + posAnt + posAnt/40  
	; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add r2, r1, r0			; r2 = Tela1Linha0 + posAnt
	loadn r4, #40
	div r3, r0, r4			; r3 = posAnt/40
	add r2, r2, r3			; r2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi r5, r2			; r5 = Char (Tela(posAnt))
	
	outchar r5, r0			; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;--------------------------
		
MovePlayer_recalculaPos:		; recalcula posicao da Player em funcao das Teclas pressionadas
	push r0
	push r1
	push r2
	push r3
	push r4

	load r0, posPlayer
	
	inchar r1				; Le Teclado para controlar a Player
	loadn r2, #'a'
	cmp r1, r2
	jeq MovePlayer_recalculaPos_A
	
	loadn r2, #'d'
	cmp r1, r2
	jeq MovePlayer_recalculaPos_D
		
	loadn r2, #'w'
	cmp r1, r2
	jeq MovePlayer_recalculaPos_W
		
	loadn r2, #'s'
	cmp r1, r2
	jeq MovePlayer_recalculaPos_S
	
  	MovePlayer_recalculaPos_Fim:	; Se nao for nenhuma tecla valida, vai embora
		store posPlayer, r0
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts

  	MovePlayer_recalculaPos_A:	; Move Player para Esquerda
		loadn r1, #40
		loadn r2, #1
		mod r1, r0, r1	; Testa condicoes de Contorno 
		cmp r1, r2
		jeq MovePlayer_recalculaPos_Fim
		dec r0			; pos = pos -1
		loadn r4, #0
		jmp MovePlayer_recalculaPos_Fim
		
  	MovePlayer_recalculaPos_D:	; Move Player para Direita	
		loadn r1, #40
		loadn r2, #38
		mod r1, r0, r1	; Testa condicoes de Contorno 
		cmp r1, r2
		jeq MovePlayer_recalculaPos_Fim
		inc r0			; pos = pos + 1
		loadn r4, #2
		jmp MovePlayer_recalculaPos_Fim
	
  	MovePlayer_recalculaPos_W:	; Move Player para Cima
		loadn r1, #80
		cmp r0, r1		; Testa condicoes de Contorno 
		jle MovePlayer_recalculaPos_Fim
		loadn r1, #40
		sub r0, r0, r1	; pos = pos - 40
		loadn r4, #3
		jmp MovePlayer_recalculaPos_Fim

  	MovePlayer_recalculaPos_S:	; Move Player para Baixo
		loadn r1, #1079
		cmp r0, r1		; Testa condicoes de Contorno 
		jgr MovePlayer_recalculaPos_Fim
		loadn r1, #40
		add r0, r0, r1	; pos = pos + 40
		loadn r4, #1
		jmp MovePlayer_recalculaPos_Fim	

MovePlayer_Desenha:	; Desenha caractere da Player
	push r0
	push r1
	
	Loadn r1, #'$'	; Player
	load r0, posPlayer
	outchar r1, r0
	store posAntPlayer, r0	; Atualiza Posicao Anterior da Player = Posicao Atual
	
	pop r1
	pop r0
	rts

;-----------------------------------
;--------------Inimigo----------------
;----------------------------------

MoveInimigo:
	push r0
	push r1
	
	;load r1,posInimigo1 
	;store posicaoInimigoAtual,r1
	
	;loadn r1,#49 ;inimigo 1 comeca na pos 49
	;store posicaoInimigoInicial,r1
	
	call MoveInimigo_recalculaPos
	
	load r0, posCorreta
	
	;store posInimigo1, r0
	store posicaoInimigoAtual, r0
	
	; So Apaga e redesenha se (pos != posAnt)
	; if (pos != posAnt)	{	
	;load r0, posInimigo1
	;load r1, posAntInimigo1
	load r0, posicaoInimigoAtual
	load r1, posInimigoAnterior
	cmp r0, r1
	jeq MoveInimigo_Skip
	
	
	
	call MoveInimigo_Apaga
	call MoveInimigo_Desenha		;}
	
  	MoveInimigo_Skip:
		pop r1
		pop r0
		rts
			
; ----------------------------
			
MoveInimigo_Apaga:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	load r0, posInimigoAnterior	; r0 == posAnt
	load r1, posAntPlayer 	; r1 = posAnt
	;cmp r0, r1

	MoveInimigo_Apaga_Skip:	
	  
		; --> r2 = Tela1Linha0 + posAnt + posAnt/40  
		; tem que somar posAnt/40 no ponteiro pois as linhas da string terminam com /0 !!
		loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
		add r2, r1, r0	; r2 = Tela1Linha0 + posAnt
		loadn r4, #40
		div r3, r0, r4	; r3 = posAnt/40
		add r2, r2, r3	; r2 = Tela1Linha0 + posAnt + posAnt/40
		
		loadi r5, r2	; r5 = Char (Tela(posAnt))
	  
	  	MoveInimigo_Apaga_Fim:	
		outchar r5, r0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
		
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts

			
	;----------------------------------

	MoveInimigo_Desenha:
		push r0
		push r1
		push r2
		
		loadn r2, #1536
	
	
		Loadn r1, #'@'	; Inimigo
		add r1,r2,r1
		load r0, posicaoInimigoAtual
		outchar r1, r0
		store posInimigoAnterior, r0
		
		pop r2
		pop r1
		pop r0
		rts


MoveInimigo_recalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posicaoInimigoAtual
	
	
 	loadn r3, #40
 	add r0, r0, r3
 	loadn r3, #1119
 	cmp r0, r3
 	jle MoveInimigo_FimSwitch


	load r0, posicaoInimigoInicial
	store posCorreta, r0
	

		
	MoveInimigo_FimSwitch:
	store posCorreta, r0	; Grava a posicao alterada na memoria
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;----------------------------------

MoveInimigo6_Desenha:
	push r0
	push r1
	push r2
	loadn r2, #1536
	
	Loadn r1, #'@'	; Inimigo
	add r1,r2,r1
	load r0, posInimigo6
	outchar r1, r0
	store posAntInimigo6, r0
	
	pop r2
	pop r1
	pop r0
	rts


;----------------------------------
;------------BANDEIRA 1------------
;----------------------------------
Bandeira1_Desenha:	; Desenha caractere da Bandeira
	push r0
	push r1
	
	Loadn r1, #'P'	; Bandeira
	load r0, posBandeira1
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
;----------------------------------
;------------BANDEIRA 2------------
;----------------------------------
Bandeira2_Desenha:	; Desenha caractere da Bandeira
	push r0
	push r1
	
	Loadn r1, #'S'	; Bandeira
	load r0, posBandeira2
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
;----------------------------------
;------------BANDEIRA 3------------
;----------------------------------
Bandeira3_Desenha:	; Desenha caractere da Bandeira
	push r0
	push r1
	
	Loadn r1, #'U'	; Bandeira
	load r0, posBandeira3
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
;----------------------------------
;------------BANDEIRA 4------------
;----------------------------------
Bandeira4_Desenha:	; Desenha caractere da Bandeira
	push r0
	push r1
	
	Loadn r1, #'#'	; Bandeira
	load r0, posBandeira4
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
	

;----------------------------------
;------------CHECA POS-------------
;----------------------------------

ChecaPos:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	
	;Verificar colisão com inimigos;
	load r0, posPlayer	; Testa se o Inimigo colidiu com a Player
	load r1, posInimigo1
	cmp r0, r1			; if posPlayer == posInimigo  BOOM!!
	jeq ColisaoPlayer
	
	load r1, posInimigo2
	cmp r0, r1			; if posPlayer == posInimigo   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posInimigo3
	cmp r0, r1			; if posPlayer == posInimigo   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posInimigo4
	cmp r0, r1			; if posPlayer == posInimigo   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posInimigo5
	cmp r0, r1			; if posPlayer == posInimigo   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posInimigo6
	cmp r0, r1			; if posPlayer == posInimigo   BOOM!!
	jeq ColisaoPlayer
	;------------------------;
	
	;Verificar se o jogador alcançou as bandeiras;
	load r1, posBandeira1
	cmp r0, r1			; if posPlayer == posBandeira  Pega a bandeira!!
	jeq PegarBandeira1
	
	load r1, posBandeira2
	cmp r0, r1			; if posPlayer == posBandeira  Pega a bandeira!!
	jeq PegarBandeira2
	
	load r1, posBandeira3
	cmp r0, r1			; if posPlayer == posBandeira  Pega a bandeira!!
	jeq PegarBandeira3
	
	load r1, posBandeira4
	cmp r0, r1			; if posPlayer == posBandeira  Pega a bandeira!!
	jeq PegarBandeira4
	;------------------------;
	
	;Verificar se o jogador alcançou o campo em que se deve por as bandeiras;
	load r1, posFinalBandeira1
	cmp r0, r1			; if posPlayer == posBandeira  Coloca a bandeira!!
	jeq ColocarBandeira1
	
	load r1, posFinalBandeira2
	cmp r0, r1			; if posPlayer == posBandeira  Coloca a bandeira!!
	jeq ColocarBandeira2
	
	load r1, posFinalBandeira3
	cmp r0, r1			; if posPlayer == posBandeira  Coloca a bandeira!!
	jeq ColocarBandeira3
	
	load r1, posFinalBandeira4
	cmp r0, r1			; if posPlayer == posBandeira  Coloca a bandeira!!
	jeq ColocarBandeira4
 
	jmp FimChecagem
	
;----------------------------------
;---------PEGAR BANDEIRA 1---------
;----------------------------------

PegarBandeira1:
	load r1, pegouBandeira1
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouBandeira1, r2
	jmp FimChecagem
	
;----------------------------------
;---------PEGAR BANDEIRA 2---------
;----------------------------------

PegarBandeira2:
	load r1, pegouBandeira2
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouBandeira2, r2
	jmp FimChecagem
	
;----------------------------------
;---------PEGAR BANDEIRA 3---------
;----------------------------------

PegarBandeira3:
	load r1, pegouBandeira3
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouBandeira3, r2
	jmp FimChecagem

;----------------------------------
;---------PEGAR BANDEIRA 4---------
;----------------------------------

PegarBandeira4:
	load r1, pegouBandeira4
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouBandeira4, r2
	jmp FimChecagem
	
	
;----------------------------------
;--------COLOCAR BANDEIRA 1--------
;----------------------------------

ColocarBandeira1:
	load r1, pegouBandeira1
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouBandeira1, r2
	load r1, posFinalBandeira1
	dec r1
	store posBandeira1, r1
	call Bandeira1_Desenha
	call ChecarBandeirasColocadas
	jmp FimChecagem
	
;----------------------------------
;--------COLOCAR BANDEIRA 2--------
;----------------------------------

ColocarBandeira2:
	load r1, pegouBandeira2
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouBandeira2, r2
	load r1, posFinalBandeira2
	dec r1
	store posBandeira2, r1
	call Bandeira2_Desenha
	call ChecarBandeirasColocadas
	jmp FimChecagem
	
;----------------------------------
;--------COLOCAR BANDEIRA 3--------
;----------------------------------

ColocarBandeira3:
	load r1, pegouBandeira3
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouBandeira3, r2
	load r1, posFinalBandeira3
	dec r1
	store posBandeira3, r1
	call Bandeira3_Desenha
	call ChecarBandeirasColocadas
	jmp FimChecagem

;----------------------------------
;--------COLOCAR BANDEIRA 4--------
;----------------------------------

ColocarBandeira4:
	load r1, pegouBandeira4
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouBandeira4, r2
	load r1, posFinalBandeira4
	dec r1
	store posBandeira4, r1
	call Bandeira4_Desenha
	call ChecarBandeirasColocadas
	jmp FimChecagem
	

;Função que checa se as bandeiras pegas foram colocadas no local correto
;Se todas as quatro estiverem em suas devidas bases, declara vitória
ChecarBandeirasColocadas:
	push r0
	push r1

	loadn r1, #1
	
	load r2, colocouBandeira1
	cmp r1, r2
	jne FimChecagem_BandeirasColocadas
	
	load r2, colocouBandeira2
	cmp r1, r2
	jne FimChecagem_BandeirasColocadas
	
	load r2, colocouBandeira3
	cmp r1, r2
	jne FimChecagem_BandeirasColocadas
	
	load r2, colocouBandeira4
	cmp r1, r2
	jne FimChecagem_BandeirasColocadas
	

	jmp Vitoria
	jmp FimChecagem_BandeirasColocadas
	
	FimChecagem_BandeirasColocadas:
		pop r1
		pop r0
		rts
	

Vitoria:

	Loop_Inicio:
		call DigLetra 			; Le uma letra do teclado
		loadn r0, #'w'			; Quando a tecla 'w' for acionada,continua a execução
		load r1, Letra
		cmp r0, r1
		jne Loop_Inicio

	
	; Limpa a Tela !!
  	loadn r1, #tela4Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #0  			; cor branca!
	call ImprimeTela   		; rotina de Impresao de Cenario na Tela Inteira
	
	
	
	;loadn r1, #telafinalbasicaLinha0
	;loadn r2, #256  			; cor branca!
	;call ImprimeTela   		; rotina de Impresao da Basica
	
  
	;imprime Voce Venceu !!!
	loadn r0, #528
	loadn r1, #Win
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msg
	loadn r2, #0
	call ImprimeStr
	
	call DigLetra
	loadn r0, #'s'
	load r1, Letra
	cmp r0, r1				; tecla == 's' ?
	jne FimJogo	; tecla nao e' 's'
	
	; Se quiser jogar novamente...
	call ApagaTela
	jmp main

;Checar se o player colidiu com o inimigo
ColisaoPlayer:	
	; Limpa a Tela !!
  	loadn r1, #tela4Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #0  			; cor branca!
	call ImprimeTela   		; rotina de Impresao de Cenario na Tela Inteira
  
	;imprime Voce Perdeu !!!
	loadn r0, #528
	loadn r1, #Dead
	loadn r2, #0
	call ImprimeStr
	
	;imprime quer jogar novamente
	loadn r0, #605
	loadn r1, #Msg
	loadn r2, #0
	call ImprimeStr
	
	call DigLetra
	loadn r0, #'s'
	load r1, Letra
	cmp r0, r1				; tecla == 's' ?
	jne FimJogo	; tecla nao e' 's'
	
	; Se quiser jogar novamente...
	call ApagaTela
	jmp main
	
FimChecagem:
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0

	rts

FimJogo:
	call ApagaTela
	halt

;-----------------------------------
;---------------DELAY---------------
;-----------------------------------

Delay:
	;Utiliza Push e Pop para nao afetar os registradores do programa principal
	push r0
	push r1
	
	loadn r1, #5  				; a
   	Delay_volta2:				;Quebrou o contador acima em duas partes (dois loops de decremento)
	loadn r0, #3000				; b
   	Delay_volta: 
	dec r0						; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	dec r1
	jnz Delay_volta2
	
	pop r1
	pop r0
	
	rts		;return

;-----------------------------------
;-----------IMPRIME TELA------------
;-----------------------------------	

ImprimeTela: 	
	;  rotina de Impresao de Cenario na Tela Inteira
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r4 na pilha para ser usado na subrotina

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #41  	; incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = r0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	; resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5	
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------------	
;------IMPRIME STRING-------
;---------------------------
	
ImprimeStr:	
	;  rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera impresso
	;  r1 = endereco onde comeca a mensagem
	; r2 = cor da mensagem.   Obs: a mensagem sera impressa ate encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;-------------------------------------	
;-----------IMPRIME TELA 2------------	
;-------------------------------------	

ImprimeTela2: 	
	;  rotina de Impresao de Cenario na Tela Inteira
	;  r1 = endereco onde comeca a primeira linha do Cenario
	;  r2 = cor do Cenario para ser impresso

	push r0	; protege o r3 na pilha para ser usado na subrotina
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina

	loadn r0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn r3, #40  	; Incremento da posicao da tela!
	loadn r4, #41  	; incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela!
	loadn r6, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  		; incrementaposicao para a segunda linha na tela -->  r0 = r0 + 40
		add r1, r1, r4  		; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		add r6, r6, r4  		; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5				; Compara r0 com 1200
		jne ImprimeTela2_Loop	; Enquanto r0 < 1200

	; resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r6	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;---------------------------	
;-----IMPRIME STRING 2------
;---------------------------
	
ImprimeStr2:	
	;  rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera impresso
	;  r1 = endereco onde comeca a mensagem
	; r2 = cor da mensagem.   Obs: a mensagem sera impressa ate encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		storei r6, r4
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6			; Incrementa o ponteiro da String da Tela 0
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
   ; resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r6	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

;-------------------------------------	
;------------DIGITE LETRA-------------	
;-------------------------------------

DigLetra:	
; Espera que uma tecla seja digitada e salva na variavel global "Letra"
	push r0
	push r1
	loadn r1, #255	; Se nao digitar nada vem 255

   DigLetra_Loop:
		inchar r0			; Le o teclado, se nada for digitado = 255
		cmp r0, r1			;compara r0 com 255
		jeq DigLetra_Loop	; Fica lendo ate' que digite uma tecla valida

	store Letra, r0			; Salva a tecla na variavel global "Letra"

	pop r1
	pop r0
	rts

;-------------------------------------	
;-------------APAGA TELA--------------
;-------------------------------------

ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   	ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
			dec r0
			outchar r1, r0
			jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
	
;------------------------	

; Declara uma tela vazia para ser preenchida em tempo de execucao:
tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	

; Declara e preenche tela linha por linha (40 caracteres):
tela1Linha0  : string "                   ||                   "
tela1Linha1  : string "                   ||                   "
tela1Linha2  : string "                   ||                   "
tela1Linha3  : string "                   ||                   "
tela1Linha4  : string "                   ||                   "
tela1Linha5  : string "                   ||                   "
tela1Linha6  : string "                   ||                   "
tela1Linha7  : string "                   ||                   "
tela1Linha8  : string "                   ||                   "
tela1Linha9  : string "                   ||                   "
tela1Linha10 : string "                   ||                   "
tela1Linha11 : string "                   ||                   "
tela1Linha12 : string "                   ||                   "
tela1Linha13 : string "                   ||                   "
tela1Linha14 : string "                   ||                   "
tela1Linha15 : string "                   ||                   "
tela1Linha16 : string "                   ||                   "
tela1Linha17 : string "                   ||                   "
tela1Linha18 : string "                   ||                   "
tela1Linha19 : string "                   ||                   "
tela1Linha20 : string "                   ||                   "
tela1Linha21 : string "                   ||                   "
tela1Linha22 : string "                   ||                   "
tela1Linha23 : string "                   ||                   "
tela1Linha24 : string "                   ||                   "
tela1Linha25 : string "                   ||                   "
tela1Linha26 : string "                   ||                   "
tela1Linha27 : string "                   ||                   "
tela1Linha28 : string "                   ||                   "
tela1Linha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):
tela2Linha0  : string "----------------------------------------"
tela2Linha1  : string "                                        "
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                           1.Busque     "
tela2Linha7  : string " +-^                      os objetivos  "
tela2Linha8  : string "   |                          aqui !    "
tela2Linha9  : string "   ^                                    "
tela2Linha10 : string "   |                                    "
tela2Linha11 : string "   ^                                    "
tela2Linha12 : string "   |                                    "
tela2Linha13 : string "   ^                                    "
tela2Linha14 : string "   |                         - >        "
tela2Linha15 : string "   ^                                    "
tela2Linha16 : string "   |                                    "
tela2Linha17 : string "   ^                                    "
tela2Linha18 : string "   |                                    "
tela2Linha19 : string "   ^                                    "
tela2Linha20 : string "   |                                    "
tela2Linha21 : string " +-^                                    "
tela2Linha22 : string "                                        "
tela2Linha23 : string "  2.Entregue                            "
tela2Linha24 : string "   percorrendo                          "
tela2Linha25 : string "   as setas !                           "
tela2Linha26 : string "   setas!                               "
tela2Linha27 : string "                                        "
tela2Linha28 : string "----------------------------------------"
tela2Linha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):
tela3Linha0  : string "----------------------------------------"
tela3Linha1  : string "            Cuidado para nao se         "
tela3Linha2  : string "             molhar MWHAHAW XD          "
tela3Linha3  : string " Saida                                  "
tela3Linha4  : string "                                        "
tela3Linha5  : string "                                        "
tela3Linha6  : string "                                        "
tela3Linha7  : string "                                        "
tela3Linha8  : string "                                        "
tela3Linha9  : string "                                        "
tela3Linha10 : string "                                        "
tela3Linha11 : string "                                        "
tela3Linha12 : string "                                 +------"
tela3Linha13 : string "                                 |      "
tela3Linha14 : string "                                 |      "
tela3Linha15 : string "                                 |      "
tela3Linha16 : string "                                 +------"
tela3Linha17 : string "                                        "
tela3Linha18 : string "                                        "
tela3Linha19 : string "                                        "
tela3Linha20 : string "                                        "
tela3Linha21 : string "                                        "
tela3Linha22 : string "                                        "
tela3Linha23 : string "                                        "
tela3Linha24 : string "                                        "
tela3Linha25 : string "                                        "
tela3Linha26 : string "                                        "
tela3Linha27 : string "                                        "
tela3Linha28 : string "----------------------------------------"
tela3Linha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):9
tela4Linha0  : string "========================================"
tela4Linha1  : string "|                                      |"
tela4Linha2  : string "|                                      |"
tela4Linha3  : string "|                                      |"
tela4Linha4  : string "|                                      |"
tela4Linha5  : string "|                                      |"
tela4Linha6  : string "|                                      |"
tela4Linha7  : string "|                                      |"
tela4Linha8  : string "|                                      |"
tela4Linha9  : string "|                                      |"
tela4Linha10 : string "|                                      |"
tela4Linha11 : string "|                                      |"
tela4Linha12 : string "|                                      |"
tela4Linha13 : string "|                                      |"
tela4Linha14 : string "|                                      |"
tela4Linha15 : string "|                                      |"
tela4Linha16 : string "|                                      |"
tela4Linha17 : string "|                                      |"
tela4Linha18 : string "|                                      |"
tela4Linha19 : string "|                                      |"
tela4Linha20 : string "|                                      |"
tela4Linha21 : string "|                                      |"
tela4Linha22 : string "|                                      |"
tela4Linha23 : string "|                                      |"
tela4Linha24 : string "|                                      |"
tela4Linha25 : string "|                                      |"
tela4Linha26 : string "|                                      |"
tela4Linha27 : string "|                                      |"
tela4Linha28 : string "========================================"
tela4Linha29 : string "========================================"

; --------------------------------------------- TELA INICIAL ---------------------------------------------
telaInicioLinha0:  string "                                        "          
telaInicioLinha1:  string "                                        "    
telaInicioLinha2:  string "                                        "          
telaInicioLinha3:  string "                                        "             
telaInicioLinha4:  string "   *** *  * ***** ***   ***  ***   **   "             
telaInicioLinha5:  string "  *    ** *   *   *  * *    *     *  *  "         
telaInicioLinha6:  string "  ***  * **   *   ***  ***  *  ** ****  "         
telaInicioLinha7:  string "  *    *  *   *   * *  *    *   * *  *  "        
telaInicioLinha8:  string "   *** *  *   *   *  *  ***  ***  *  *  "
telaInicioLinha9:  string "                                        "
telaInicioLinha10: string "   ***   **  *  * ***   *** ****  **    "
telaInicioLinha11: string "   *  * *  * ** * *  * *       * *  *   "
telaInicioLinha12: string "   ***  **** * ** *  * **      * ****   "
telaInicioLinha13: string "   *  * *  * *  * *  * *    *  * *  *   "
telaInicioLinha14: string "   ***  *  * *  * ***   ***  **  *  *   "
telaInicioLinha15: string "                                        "
telaInicioLinha16: string "                                        "
telaInicioLinha17: string "                                        "
telaInicioLinha18: string "    ENTREGUE SUA BANDEJA E TALHERES     "
telaInicioLinha19: string "                                        "
telaInicioLinha20: string "      SEM LEVAR UM BANHO DA DUCHA       "
telaInicioLinha21: string "                                        "
telaInicioLinha22: string "          DO TATUADO PUTO >:(           "
telaInicioLinha23: string "                                        "
telaInicioLinha24: string "      APERTE ESPACO PARA INICIAR!       "
telaInicioLinha25: string "                                        "
telaInicioLinha26: string "                                        "
telaInicioLinha27: string "                                        "
telaInicioLinha28: string "                                        "
telaInicioLinha29: string "                                        "


