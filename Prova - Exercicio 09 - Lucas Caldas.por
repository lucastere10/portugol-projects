programa
{

	// PROVA 01 - EXERCICIO 9 - PORTUGOL - LUCAS MEDEIROS CALDAS - lucas.m.caldas@aluno.senai.br
	
	/*1. um local na memória para armazenar dados
	  2.	bloco de código pré-determinados e em uma quantidade de vezes determinados
	  3. verdadeiro
	  4. 24
	  5. Sequência de instruções ordenadas, finitas e não-ambíguas que são empregadas para executar uma tarefa
	  6. -20
	  7. certo
	  8. 0 1 1 2 3 5.
	  9. 
	  10.
	*/
	
	funcao inicio(){
		//variaveis
		inteiro i
		inteiro vNum1[10] = {50, 20, 90, 80, 60, 10, 70, 40, 30, 01}
		inteiro vNum2[20]
		
		//transferir conteudo do vetor 1 para o vetor 2
		para(i = 0; i < 10; i++) {vNum2[i] = vNum1[i]}

		escreva("vNum1: ")
		apresentarVetor(vNum1,10)
		escreva("\nvNum2: ")
		apresentarVetor(vNum2,20)
	}

	//escrever vetores
	funcao apresentarVetor(inteiro vetor[], inteiro tamanho){
		//variaveis	
		inteiro i
		//logica
		para(i = 0; i < tamanho; i++){
			se(vetor[i] > 0) {escreva(vetor[i] + " ")}
		}
	}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 960; 
 * @DOBRAMENTO-CODIGO = [5];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */