# Entrega-Bandeja-Assembly-Game
#### Projeto da disciplina SSC0119 Pratica em Organização de Computadores ministrada pelo professor Eduardo do Valle Simões.

Nessa disciplina os alunos trabalharam com o caminho de dados das intruções de um processador, conhecendo como cada instrução funciona e até criando uma e adicionando à arquitetura.
Em nosso projeto, implementamos a instrução POW2, que calcula a potência de 2 do número que estiver no registrador de argumento e guarda no outro registrador na parte esquerda


## :video_game: O jogo em Assembly



Nosso jogo é uma simulação pitoresca de um minigame que muitos alunos frequentadores do bandejão da USP de São Carlos jogam todo dia: A fuga da ducha do Tatuado do Bandeco
Bricadeiras à parte e todo respeito ao funcionário exemplar , temos aqui nosso jogo feito na linguagem Assembly do processador do professor Simões.


Nele o aluno tem que pegar os objetivos na mesa e entregar no balcão sem se molhar, tente uma vez!
Ande utilizando WASD como nos jogos que conhecemos e tente chegar ao outro lado e voltar sem ser atingido pelas gotas geladas da ducha !

### :camera: Printsscreens do jogo :
![alt text](https://user-images.githubusercontent.com/83041423/179308970-b8a56d3f-cc16-4497-afb1-54844bb67334.jpg)
![alt text](https://user-images.githubusercontent.com/83041423/179308958-f0857ae9-42f1-446c-9fd5-c572be0957dc.jpg)
![alt text](https://user-images.githubusercontent.com/83041423/179308966-f79a4705-72c0-4db4-85c2-3ac851735a98.jpg)



## :question: Como iniciar o jogo :question:

Para jogar você deve ter instalado o simulador disponibilizado pelo professor, na pasta Simulador, inclua o arquivo .asm que disponibilizamos,abra o simulador com o executável do Sublime,
abra o arquivo .asm e aperte F7, quando a janela do simulador abrir aperte HOME e se divirta !

## Aqui algumas fotos das mudanças feitas no código da arquitetura em VHDL

![alt text](https://user-images.githubusercontent.com/65844604/179310441-a0917df1-8268-4b95-97b3-35798dfd9db2.png)
![alt text](https://user-images.githubusercontent.com/65844604/179310553-a6aa605b-aa41-482e-8eb7-c98c297fc85c.png)

## :computer: Incluindo nova instrução na arquitetura :computer:

 Como nova instrução implementamos a instrução POW2 que calcula a potência de 2 do segundo argumento da instrução e guarda o resultado no primeiro argumento
 
 ## Exemplo na testacpu.asm
 ```c
 loadn r0, #32
	loadn r1, #2
	loadn r2, #'Q'
	POW2 r1,r1
	add r2,r2,r1
	outchar r2, r0    ; Printa U na linha 32
```

## defs.h
 ```c
#define LMOD_CODE               95
#define NOP_CODE                0
#define INPUT_CODE              96
#define OUTPUT_CODE             97
#define POW2_CODE               99  // NOVA INSTRUCAO


/* Aritmethic Instructions(All should begin with "10"):	*/
#define ADD             "100000"
#define SUB             "100001"
#define MUL             "100010"
#define DIV             "100011"
#define INC             "100100"
#define LMOD            "100101"
#define POW2            "100110"


/*POW2*/
#define POW2_STR                "POW2"

```

 ## montador.c
 ```c
 // 1) Definir os separadores da Instrucao e quantas linhas do EXE (mif) ela necessita:
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
		
// 2) Explicar como o Montador vai montar os BITs da Instrucao e escrever no arquivo:	
                /* ==============
                    POW2 Rx Ry
                    ==============
                */

                case POW2_CODE:
                    str_tmp1 = parser_GetItem_s();
                    val1 = BuscaRegistrador(str_tmp1);
                    free(str_tmp1);
                    parser_Match(',');
                    str_tmp2 = parser_GetItem_s();
                    val2 = BuscaRegistrador(str_tmp2);
                    free(str_tmp2);
                    str_tmp1 = ConverteRegistrador(val1);
                    str_tmp2 = ConverteRegistrador(val2);
                    sprintf(str_msg, "%s%s%s0000", POW2, str_tmp1, str_tmp2);
                    free(str_tmp1);
                    free(str_tmp2);
                    parser_Write_Inst(str_msg, end_cnt);
                    end_cnt += 1;
                    break;

                /* ==============
		
// 3) Buscar o nome da instrucao na base de instrucoes e retornar 'op_code interno' da instrucao:		
	else if (strcmp(str_tmp, POW2_STR) == 0){
        	return POW2_CODE;
    	}
```
## Como compilar/utilizar o montador?
Para compilar, basta usar o gcc cos arquivos da parta Montador:
- _gcc *.c -o montador_

Para executar o 'montador', passe os seguintes parâmetros:
- _./montador <arquivo_entrada.asm> <arquivo_saida.mif>_

Dessa forma, o montador gerará o arquivo .mif que será utilizado na placa FPGA ou no simulador.

## Agradecimentos
Os alunos Susy (12694007), Otávio(11767796) e Adalton(12542435) agradecem o empenho do professor Simões e pelos conhecimentos passados para construção da arquitetura.:nerd_face:
