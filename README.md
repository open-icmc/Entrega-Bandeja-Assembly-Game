# Entrega-Bandeja-Assembly-Game
#### Projeto da disciplina SSC0119 Pratica em Organização de Computadores ministrada pelo professor Eduardo do Valle Simões.

Nessa disciplina os alunos trabalharam com o caminho de dados das intruções de um processador, conhecendo como cada instrução funciona e até criando uma e adicionando à arquitetura.
Em nosso projeto, implementamos a instrução POW2, que calcula a potência de 2 do número que estiver no registrador de argumento e guarda no outro registrador na parte esquerda


## :video_game: O jogo em Assembly



Nosso jogo é uma simulação pitoresca de um minigame que muitos alunos frequentadores do bandejão da USP de São Carlos jogam todo dia: A fuga da ducha do Tatuado do Bandeco
Bricadeiras à parte e todo respeito ao funcionário exemplar , temos aqui nosso jogo feito na linguagem Assembly do processador do professor Simões.

Incluir foto

Nele o aluno tem que pegar os objetivos na mesa e entregar no balcão sem se molhar, tente uma vez!
Ande utilizando WASD como nos jogos que conhecemos e tente chegar ao outro lado e voltar sem ser atingido pelas gotas geladas da ducha !

## :question: Como iniciar o jogo :question:

Para jogar você deve ter instalado o simulador disponibilizado pelo professor, na pasta Simulador, inclua o arquivo .asm que disponibilizamos,abra o simulador com o executável do Sublime,
abra o arquivo .asm e aperte F7, quando a janela do simulador abrir aperte HOME e se divirta !

## Incluindo nova instrução na arquitetura

 Como nova instrução implementamos a instrução POW2 que calcula a potência de 2 do segundo argumento da instrução e guarda o resultado no primeiro argumento
 ## montador.c
 ```c
  /* Instrucoes de 2 argumentos e 1 linha : instr (), () -> [...] */
            case NOT_CODE :	/* Eu pus aqui pois sera' Rx <- Not Ry */
	        case MOV_CODE :
            case OUTCHAR_CODE :
            case CMP_CODE :
            case POW2_CODE : // NOVA INSTRUCAO
                parser_SkipUntil(',');
                parser_SkipUntilEnd();
                end_cnt++;
                break;
```

## defs.h
 ```c
#define LMOD_CODE               95
#define NOP_CODE                0
#define INPUT_CODE              96
#define OUTPUT_CODE             97
#define POW2_CODE               99
```

## Agradecimentos
Os alunos (Nerds da Computação) agradecem o empenho do professor Simões e pelos conhecimentos passados para construção da arquitetura.:nerd_face:
