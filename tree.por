programa{
	funcao inicio(){
		//variáveis
		inteiro eixo_x, eixo_y, n_espaco, n_base, n_folhas, arvore_input
		caracter caracter_arvore
		
		//input
		escreva("Qual é o tamanho da sua árvore? -> ")				leia(arvore_input)
		escreva("Escolha o caracter da sua árvore (ex: @): -> ")		leia(caracter_arvore)
		escreva("Árvore com ", arvore_input, " linhas.\n\n")

		//valores iniciais
		n_espaco = arvore_input - 1   //espaço árvore
		n_folhas = 1 				//somatório por andar da árvore
		n_base = arvore_input - 2 	//tamanho do caule

		//printar arvore
		para (eixo_y = 1; eixo_y < (arvore_input + 1); eixo_y++){	
			//printar espaco em branco
			para (eixo_x = 1; eixo_x < n_espaco+1; eixo_x++) escreva(" ") // espaço até a arvore
			//printar as folhas
			para (eixo_x = 1; eixo_x < n_folhas+1; eixo_x++) escreva(caracter_arvore) // folhas
			//atualizar valores das variáveis
			n_folhas = n_folhas + 2
			n_espaco = n_espaco - 1
			escreva("\n")
		}
		
		//printar o caule
		para (eixo_y = 1; eixo_y < 4; eixo_y++){
			para (eixo_x = 1; eixo_x < n_base+1; eixo_x++) {escreva(" ")}
			escreva("|||\n")
		}
}}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 426; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */