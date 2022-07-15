jmp main

Win: string  "VOCE VENCEU A BASICA!"
Dead: string "     VOCE MORREU!"
Msg: string  "   Jogar novamente? (s/n)"
Autores: string"   Feito por Susy, Otavio e Adalton   "

Letra: var #1		; Contem a letra que foi digitada

posPlayer: var #1	; Contem a posicao atual do Player
posAntPlayer: var #1; Contem a posicao anterior do Player

posGota1: var #1	; Contem a posicao atual da Gota1
posAntGota1: var #1	; Contem a posicao anterior do Gota

posGota2: var #1	; Contem a posicao atual da Gota
posAntGota2: var #1	; Contem a posicao anterior da Gota

posGota3: var #1	; Contem a posicao atual da Gota
posAntGota3: var #1	; Contem a posicao anterior da Gota

posGota4: var #1	; Contem a posicao atual da Gota
posAntGota4: var #1	; Contem a posicao anterior da Gota

posGota5: var #1	; Contem a posicao atual da Gota
posAntGota5: var #1	; Contem a posicao anterior da Gota

posGota6: var #1	; Contem a posicao atual da Gota
posAntGota6: var #1	; Contem a posicao anterior da Gota


posBandeja: var #1
posGarfo: var #1
posFaca: var #1
posColher: var #1

posFinalBandeja: var #1
posFinalGarfo: var #1
posFinalFaca: var #1
posFinalColher: var #1

pegouBandeja: var #1
pegouGarfo: var #1
pegouFaca: var #1
pegouColher: var #1 

colocouBandeja: var #1
colocouGarfo: var #1
colocouFaca: var #1
colocouColher: var #1

posicaoGotaInicial: var #1
posicaoGotaAtual: var #1
posCorreta: var #1
posGotaAnterior: var #1


;--------------------------  Codigo principal  ----------------------------
main:
	;---Tela Inicial---;
	call ApagaTela
	loadn r1, #telaInicioLinha0		; Imprime a tela inicial do jogo;
	loadn r2, #1536                 ; Cor da tela inicial #1536 --> teal
	call ImprimeTela
	
	Loop_Inicio:
		call DigLetra ; Le uma letra do teclado
		loadn r0, #' '; Quando a tecla espaco for acionada, comeca o jogo
		load r1, Letra
		cmp r0, r1
		jne Loop_Inicio
	

	;---Inicio do Jogo---;
	call ApagaTela
    
	loadn r1, #tela1Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #768 			    ; cor oliva! --mesa
	call ImprimeTela2   		; rotina de Impresao de Cenario na Tela Inteira

	loadn r1, #tela2Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #256   			; cor marrom!
	call ImprimeTela2   		; rotina de Impresao de Cenario na Tela Inteira

	loadn r1, #tela3Linha0		; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #2560		        ; cor lima! -borda
	call ImprimeTela2   		; rotina de Impresao de Cenario na Tela Inteira

	Loadn r0, #566
	store posPlayer, r0	
	store posAntPlayer, r0

	Loadn r0, #63		 
	store posGota1, r0	
	store posAntGota1, r0
	loadn r0, #1
	
	Loadn r0, #922			 
	store posGota2, r0	
	store posAntGota2, r0
	loadn r0, #2

	Loadn r0, #1116		
	store posGota3, r0	
	store posAntGota3, r0
	loadn r0, #3
	
	Loadn r0, #278			 
	store posGota4, r0
	store posAntGota4, r0
	loadn r0, #1
	
	Loadn r0, #1100		 
	store posGota5, r0
	store posAntGota5, r0
	loadn r0, #3

	Loadn r0, #455 
	store posGota6, r0
	store posAntGota6, r0
	loadn r0, #3


	;Posições dos itens
	Loadn r0, #597
	store posBandeja, r0
	
	Loadn r0, #596
	store posGarfo, r0
	
	Loadn r0, #595
	store posFaca, r0
	
	Loadn r0, #594                                            
	store posColher, r0
	;---------------------------;
	
	Loadn r0, #323
	store posFinalBandeja, r0
	
	Loadn r0, #483
	store posFinalGarfo, r0
	
	Loadn r0, #643
	store posFinalFaca, r0
	
	Loadn r0, #803
	store posFinalColher, r0
	;-------------------------------;
	
	loadn r0, #0
	store pegouBandeja, r0	; Inicializar var que controlam os itens pegos
	store pegouGarfo, r0		
	store pegouFaca, r0		
	store pegouColher, r0	
	
	store colocouBandeja, r0  ; Inicializar var que controlam se os itens foram colocados
	store colocouGarfo, r0		
	store colocouFaca, r0		
	store colocouColher, r0

	 
	call MovePlayer_Desenha
		
	call Desenha_Bandeja
	call Desenha_Garfo
	call Desenha_Faca
	call Desenha_Colher
	
	loadn r0, #0 ; Contador para os Mods	= 0
	loadn r2, #0 ; Para verificar se (mod(c/10)==0	
	
	Loop:
	
		loadn r1, #10
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0

		ceq MovePlayer	; Chama rotina de movimentacao do Player
	
	;-----------gotas-------------
		load r6, posGota1
		store posicaoGotaAtual, r6
		load r6,posAntGota1
		store posGotaAnterior, r6
		loadn r6,#49 ; Gota 1 comeca na pos 49
		store posicaoGotaInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0

		ceq MoveGota ; Chama rotina de movimentacao da Gota
	
		load r6,posicaoGotaAtual
		store posGota1,r6
		load r6,posGotaAnterior
		store posAntGota1, r6
		

		load r6, posGota2
		store posicaoGotaAtual, r6
		load r6,posAntGota2
		store posGotaAnterior, r6
		loadn r6,#52 ; Gota 2 comeca na pos 52
		store posicaoGotaInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
	
		ceq MoveGota ; Chama rotina de movimentacao da Gota 2

		load r6,posicaoGotaAtual
		store posGota2,r6
		load r6,posGotaAnterior
		store posAntGota2, r6
		

		load r6, posGota3
		store posicaoGotaAtual, r6
		load r6,posAntGota3
		store posGotaAnterior, r6
		loadn r6,#70 ; Gota 3 comeca na pos 70
		store posicaoGotaInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
			
		ceq MoveGota ; Chama rotina de movimentacao da Gota 3
		
		load r6,posicaoGotaAtual
		store posGota3,r6
		load r6,posGotaAnterior
		store posAntGota3, r6
		

		load r6, posGota4
		store posicaoGotaAtual, r6
		load r6,posAntGota4
		store posGotaAnterior, r6
		loadn r6,#65 ; Gota 4 comeca na pos 65
		store posicaoGotaInicial,r6

		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0
			
		ceq MoveGota	; Chama rotina de movimentacao do Gota 4
		
		load r6,posicaoGotaAtual
		store posGota4,r6
		load r6,posGotaAnterior
		store posAntGota4, r6
		

		load r6, posGota5
		store posicaoGotaAtual, r6
		load r6,posAntGota5
		store posGotaAnterior, r6
		loadn r6,#59 ; Gota 5 comeca na pos 59
		store posicaoGotaInicial,r6

		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0

		ceq MoveGota	; Chama rotina de movimentacao do Gota 5

		load r6,posicaoGotaAtual
		store posGota5,r6
		load r6,posGotaAnterior
		store posAntGota5, r6
		
		
		load r6, posGota6
		store posicaoGotaAtual, r6
		load r6,posAntGota6
		store posGotaAnterior, r6
		loadn r6,#55 ; Gota 6 comeca na pos 55
		store posicaoGotaInicial,r6
		
		loadn r1, #8
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0

		ceq MoveGota	; Chama rotina de movimentacao do Gota 5

		load r6,posicaoGotaAtual
		store posGota6,r6
		load r6,posGotaAnterior
		store posAntGota6, r6
		
		loadn r1, #10
		mod r1, r0, r1
		cmp r1, r2		; if (mod(c/10)==0

		ceq ChecaPos ; Chama rotina de verificacao de colisao
	
		call Delay
		inc r0 	;c++
		jmp Loop


;---------------------------
;--------- FUNÇÕES ---------
;---------------------------

MovePlayer:
	push r0
	push r1
		
	call MovePlayer_recalculaPos ; recalcula Posicao do Player

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
		
MovePlayer_Apaga: ; Apaga o Player preservando o Cenario!
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	load r0, posAntPlayer ; r0 = posAnt
	
	; --> r2 = Tela1Linha0 + posAnt + posAnt/40  
	; tem que somar posAnt/40 no ponteiro pois as linas da string terminam com /0 !!

	loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	add r2, r1, r0 ; r2 = Tela1Linha0 + posAnt
	loadn r4, #40
	div r3, r0, r4 ; r3 = posAnt/40
	add r2, r2, r3 ; r2 = Tela1Linha0 + posAnt + posAnt/40
	
	loadi r5, r2 ; r5 = Char (Tela(posAnt))
	
	outchar r5, r0 ; Apaga o Obj na tela com o Char correspondente na memoria do cenario
	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;----------------------------------
		
MovePlayer_recalculaPos: ; recalcula posicao do Player em funcao das Teclas pressionadas
	push r0
	push r1
	push r2
	push r3
	push r4

	load r0, posPlayer
	
	inchar r1 ; Le Teclado para controlar o Player
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
	
  	MovePlayer_recalculaPos_Fim: ; Se nao for nenhuma tecla valida, vai embora
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

MovePlayer_Desenha:	; Desenha caractere do Player
	push r0
	push r1
	
	Loadn r1, #'O'	; Player
	load r0, posPlayer
	outchar r1, r0
	store posAntPlayer, r0 ; Atualiza Posicao Anterior do Player = Posicao Atual
	
	pop r1
	pop r0
	rts

;----------------------------------

MoveGota:
	push r0
	push r1
	
	call MoveGota_recalculaPos
	
	load r0, posCorreta
	
	;store posGota1, r0
	store posicaoGotaAtual, r0
	
	; So Apaga e redesenha se (pos != posAnt)
	; if (pos != posAnt)	{	
	load r0, posicaoGotaAtual
	load r1, posGotaAnterior
	cmp r0, r1
	jeq MoveGota_Skip
	
	call MoveGota_Apaga
	call MoveGota_Desenha		;}
	
  	MoveGota_Skip:
		pop r1
		pop r0
		rts
			
; ----------------------------
			
MoveGota_Apaga:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	load r0, posGotaAnterior	; r0 == posAnt
	load r1, posAntPlayer 	; r1 = posAnt

	MoveGota_Apaga_Skip:	
	  
		; --> r2 = Tela1Linha0 + posAnt + posAnt/40  
		; tem que somar posAnt/40 no ponteiro pois as linhas da string terminam com /0 !!
		loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
		add r2, r1, r0	; r2 = Tela1Linha0 + posAnt
		loadn r4, #40
		div r3, r0, r4	; r3 = posAnt/40
		add r2, r2, r3	; r2 = Tela1Linha0 + posAnt + posAnt/40
		
		loadi r5, r2	; r5 = Char (Tela(posAnt))
	  
	  	MoveGota_Apaga_Fim:	
		outchar r5, r0	; Apaga o Obj na tela com o Char correspondente na memoria do cenario
		
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts

			
	;----------------------------------

	MoveGota_Desenha:
		push r0
		push r1
		push r2
		
		loadn r2, #1536
	
	
		Loadn r1, #'@' ; Gota
		add r1,r2,r1
		load r0, posicaoGotaAtual
		outchar r1, r0
		store posGotaAnterior, r0
		
		pop r2
		pop r1
		pop r0
		rts


MoveGota_recalculaPos:
	push r0
	push r1
	push r2
	push r3

	load r0, posicaoGotaAtual
	
 	loadn r3, #40
 	add r0, r0, r3
 	loadn r3, #1119
 	cmp r0, r3
 	jle MoveGota_FimSwitch

	load r0, posicaoGotaInicial
	store posCorreta, r0
	
	MoveGota_FimSwitch:
	store posCorreta, r0	; Grava a posicao alterada na memoria
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;----------------------------

Desenha_Bandeja: ; Desenha caractere da Bandeja
	push r0
	push r1
	
	Loadn r1, #'#'	; Item
	load r0, posBandeja
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
Desenha_Garfo:
	push r0
	push r1
	
	Loadn r1, #'Y' ; garfo
	load r0, posGarfo
	outchar r1, r0
	
	pop r1
	pop r0
	rts

Desenha_Faca:
	push r0
	push r1
	
	Loadn r1, #'l' ; faca
	load r0, posFaca
	outchar r1, r0
	
	pop r1
	pop r0
	rts

Desenha_Colher:	; Desenha caractere do Item
	push r0
	push r1
	
	Loadn r1, #'P'	; Item
	load r0, posColher
	outchar r1, r0
	
	pop r1
	pop r0
	rts
	
;----------------------------------

ChecaPos:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	
	;Verificar colisão com Gotas;
	load r0, posPlayer	; Testa se o Gota colidiu com o Player
	load r1, posGota1
	cmp r0, r1			; if posPlayer == posGota  BOOM!!
	jeq ColisaoPlayer
	
	load r1, posGota2
	cmp r0, r1			; if posPlayer == posGota   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posGota3
	cmp r0, r1			; if posPlayer == posGota   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posGota4
	cmp r0, r1			; if posPlayer == posGota   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posGota5
	cmp r0, r1			; if posPlayer == posGota   BOOM!!
	jeq ColisaoPlayer
	
	load r1, posGota6
	cmp r0, r1			; if posPlayer == posGota   BOOM!!
	jeq ColisaoPlayer
	;------------------------;
	
	;Verificar se o jogador alcançou os itens;
	load r1, posBandeja
	cmp r0, r1			; if posPlayer == posItem  Pega o Item!!
	jeq PegarBandeja
	
	load r1, posGarfo
	cmp r0, r1			; if posPlayer == posItem  Pega o Item!!
	jeq PegarGarfo
	
	load r1, posFaca
	cmp r0, r1			; if posPlayer == posItem  Pega o Item!!
	jeq PegarFaca
	
	load r1, posGarfo
	cmp r0, r1			; if posPlayer == posItem  Pega o Item!!
	jeq PegarItem4
	;------------------------;
	
	;Verificar se o jogador alcançou o campo em que se deve por as Items;
	load r1, posFinalBandeja
	cmp r0, r1			; if posPlayer == posItem  Coloca o Item!!
	jeq ColocarBandeja
	
	load r1, posFinalGarfo
	cmp r0, r1			; if posPlayer == posItem  Coloca o Item!!
	jeq ColocarGarfo
	
	load r1, posFinalFaca
	cmp r0, r1			; if posPlayer == posItem  Coloca o Item!!
	jeq ColocarFaca
	
	load r1, posFinalColher
	cmp r0, r1			; if posPlayer == posItem  Coloca o Item!!
	jeq ColocarColher
 
	jmp FimChecagem
	
;----------------------------------

PegarBandeja:
	load r1, pegouBandeja
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouBandeja, r2
	jmp FimChecagem
	
;----------------------------------

PegarGarfo:
	load r1, pegouGarfo
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouGarfo, r2
	jmp FimChecagem
	
;----------------------------------

PegarFaca:
	load r1, pegouFaca
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouFaca, r2
	jmp FimChecagem

;----------------------------------

PegarItem4:
	load r1, pegouColher
	loadn r2, #1
	cmp r1, r2
	jeq FimChecagem
	store pegouColher, r2
	jmp FimChecagem
	
;----------------------------------

ColocarBandeja:
	load r1, pegouBandeja
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouBandeja, r2
	load r1, posFinalBandeja
	dec r1
	store posBandeja, r1
	call Desenha_Bandeja
	call ChecarItensEntregues
	jmp FimChecagem
	
;----------------------------------

ColocarGarfo:
	load r1, pegouGarfo
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouGarfo, r2
	load r1, posFinalGarfo
	dec r1
	store posGarfo, r1
	call Desenha_Garfo
	call ChecarItensEntregues
	jmp FimChecagem

;----------------------------------

ColocarFaca:
	load r1, pegouFaca
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouFaca, r2
	load r1, posFinalFaca
	dec r1
	store posFaca, r1
	call Desenha_Faca
	call ChecarItensEntregues
	jmp FimChecagem

;----------------------------------

ColocarColher:
	load r1, pegouColher
	loadn r2, #1
	cmp r1, r2
	jne FimChecagem
	store colocouColher, r2
	load r1, posFinalColher
	dec r1
	store posGarfo, r1
	call Desenha_Colher
	call ChecarItensEntregues
	jmp FimChecagem
	

;Função que checa se os Items pegos foram colocadas no local correto
;Se todas os três estiverem nos locais adequados, declara vitória
ChecarItensEntregues:
	push r0
	push r1

	loadn r1, #1
	
	load r2, colocouBandeja
	cmp r1, r2
	jne FimChecagem_ItensEntregues
	
	load r2, colocouGarfo
	cmp r1, r2
	jne FimChecagem_ItensEntregues
	
	load r2, colocouFaca
	cmp r1, r2
	jne FimChecagem_ItensEntregues
	
	load r2, colocouColher
	cmp r1, r2
	jne FimChecagem_ItensEntregues
	

	jmp Vitoria
	jmp FimChecagem_ItensEntregues
	
	FimChecagem_ItensEntregues:
		pop r1
		pop r0
		rts
	

Vitoria:

	Loop_Inicio:
		call DigLetra 	; Le uma letra do teclado
		loadn r0, #'w'	; Quando a tecla 'w' for acionada,continua a execução
		load r1, Letra
		cmp r0, r1
		jne Loop_Inicio

	
	; Limpa a Tela !!
  	loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #0  			; cor branca!
	call ImprimeTela   		; rotina de Impresao de Cenario na Tela Inteira
	
	;imprime quer jogar novamente 
 	loadn r0, #761 
 	loadn r1, #Autores 
 	loadn r2, #0 
 	call ImprimeStr
  
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
	cmp r0, r1	; tecla == 's' ?
	jne FimJogo	; tecla nao e' 's'
	
	; Se quiser jogar novamente...
	call ApagaTela
	jmp main

;Checar se o player colidiu com o Gota
ColisaoPlayer:	
	; Limpa a Tela !!
  	loadn r1, #tela0Linha0	; Endereco onde comeca a primeira linha do cenario!!
	loadn r2, #0  			; cor branca!
	call ImprimeTela   		; rotina de Impresao de Cenario na Tela Inteira
	
	;imprime quer jogar novamente 
 	loadn r0, #761 
 	loadn r1, #Autores 
 	loadn r2, #0 
 	call ImprimeStr
  
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
tela1Linha0  : string "----------------------------------------"
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "                                        "
tela1Linha4  : string "                                        "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                           1.Busque     "
tela1Linha7  : string " +-^                      os objetivos  "
tela1Linha8  : string "   |                          aqui !    "
tela1Linha9  : string "   ^                                    "
tela1Linha10 : string "   |                                    "
tela1Linha11 : string "   ^                                    "
tela1Linha12 : string "   |                                    "
tela1Linha13 : string "   ^                                    "
tela1Linha14 : string "   |                         - >        "
tela1Linha15 : string "   ^                                    "
tela1Linha16 : string "   |                                    "
tela1Linha17 : string "   ^                                    "
tela1Linha18 : string "   |                                    "
tela1Linha19 : string "   ^                                    "
tela1Linha20 : string "   |                                    "
tela1Linha21 : string " +-^                                    "
tela1Linha22 : string "                                        "
tela1Linha23 : string "  2.Entregue                            "
tela1Linha24 : string "   percorrendo                          "
tela1Linha25 : string "   as setas !                           "
tela1Linha26 : string "   setas!                               "
tela1Linha27 : string "                                        "
tela1Linha28 : string "----------------------------------------"
tela1Linha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):
tela2Linha0  : string "----------------------------------------"
tela2Linha1  : string "            Cuidado para nao se         "
tela2Linha2  : string "             molhar MWHAHAW XD          "
tela2Linha3  : string " Saida                                  "
tela2Linha4  : string "                                        "
tela2Linha5  : string "                                        "
tela2Linha6  : string "                                        "
tela2Linha7  : string "                                        "
tela2Linha8  : string "                                        "
tela2Linha9  : string "                                        "
tela2Linha10 : string "                                        "
tela2Linha11 : string "                                        "
tela2Linha12 : string "                                 +------"
tela2Linha13 : string "                                 |      "
tela2Linha14 : string "                                 |      "
tela2Linha15 : string "                                 |      "
tela2Linha16 : string "                                 +------"
tela2Linha17 : string "                                        "
tela2Linha18 : string "                                        "
tela2Linha19 : string "                                        "
tela2Linha20 : string "                                        "
tela2Linha21 : string "                                        "
tela2Linha22 : string "                                        "
tela2Linha23 : string "                                        "
tela2Linha24 : string "                                        "
tela2Linha25 : string "                                        "
tela2Linha26 : string "                                        "
tela2Linha27 : string "                                        "
tela2Linha28 : string "----------------------------------------"
tela2Linha29 : string "                                        "

; Declara e preenche tela linha por linha (40 caracteres):9
tela3Linha0  : string "========================================"
tela3Linha1  : string "|                                      |"
tela3Linha2  : string "|                                      |"
tela3Linha3  : string "|                                      |"
tela3Linha4  : string "|                                      |"
tela3Linha5  : string "|                                      |"
tela3Linha6  : string "|                                      |"
tela3Linha7  : string "|                                      |"
tela3Linha8  : string "|                                      |"
tela3Linha9  : string "|                                      |"
tela3Linha10 : string "|                                      |"
tela3Linha11 : string "|                                      |"
tela3Linha12 : string "|                                      |"
tela3Linha13 : string "|                                      |"
tela3Linha14 : string "|                                      |"
tela3Linha15 : string "|                                      |"
tela3Linha16 : string "|                                      |"
tela3Linha17 : string "|                                      |"
tela3Linha18 : string "|                                      |"
tela3Linha19 : string "|                                      |"
tela3Linha20 : string "|                                      |"
tela3Linha21 : string "|                                      |"
tela3Linha22 : string "|                                      |"
tela3Linha23 : string "|                                      |"
tela3Linha24 : string "|                                      |"
tela3Linha25 : string "|                                      |"
tela3Linha26 : string "|                                      |"
tela3Linha27 : string "|                                      |"
tela3Linha28 : string "========================================"
tela3Linha29 : string "========================================"

; --------------------------------------------- TELA INICIAL ---------------------------------------------
telaInicioLinha0:  string "                                        "          
telaInicioLinha1:  string "                                        "    
telaInicioLinha2:  string "                                        "          
telaInicioLinha3:  string "   *** *  * ***** ***   ***  ***   **   "             
telaInicioLinha4:  string "  *    ** *   *   *  * *    *     *  *  "             
telaInicioLinha5:  string "  ***  * **   *   ***  ***  *  ** ****  "         
telaInicioLinha6:  string "  *    *  *   *   * *  *    *   * *  *  "         
telaInicioLinha7:  string "   *** *  *   *   *  *  ***  ***  *  *  "
telaInicioLinha8:  string "                                        "       
telaInicioLinha9:  string "   ***   **  *  * ***   *** ****  **    "
telaInicioLinha10: string "   *  * *  * ** * *  * *       * *  *   "
telaInicioLinha11: string "   ***  **** * ** *  * **      * ****   "
telaInicioLinha12: string "   *  * *  * *  * *  * *    *  * *  *   "
telaInicioLinha13: string "   ***  *  * *  * ***   ***  **  *  *   "
telaInicioLinha14: string "                                        "
telaInicioLinha15: string "                                        "
telaInicioLinha16: string "    ENTREGUE SUA BANDEJA E TALHERES     "
telaInicioLinha17: string "                                        "
telaInicioLinha18: string "      SEM LEVAR UM BANHO DA DUCHA       "
telaInicioLinha19: string "                                        "
telaInicioLinha20: string "          DO TATUADO PUTO >:(           "
telaInicioLinha21: string "                                        "
telaInicioLinha22: string "                                        "
telaInicioLinha23: string "      APERTE ESPACO PARA INICIAR!       "
telaInicioLinha24: string "                                        "
telaInicioLinha25: string " MOVIMENTE-SE COM AS TECLAS W, A, S e D "
telaInicioLinha26: string "                                        "
telaInicioLinha27: string "                                        "
telaInicioLinha28: string "                                        "
telaInicioLinha29: string "                                        "
