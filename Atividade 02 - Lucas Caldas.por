programa
{

	//1) Escreva um aplicativo que recebe um número inteiro e mostre quantos números existem entre 1 até esse inteiro.*/
	funcao exercicio_1() {
		inteiro input, contador
		escreva("Digite o numero: ") leia(input)
		para(contador = 1; contador <= input; contador++) escreva(contador, "\n")
	}	
	
	//2) Faça um programa que peça uma nota, entre zero e dez. Mostre uma mensagem caso o valor seja inválido
	//e continue pedindo até que o usuário informe um valor válido.*/
	funcao exercicio_2(){
		real nota
		logico tentar_novamente = verdadeiro
		faca {
			escreva("\nnumero: ") leia(nota)
		    	enquanto (nota < 0 ou nota > 10) {
		    		escreva("Nota invalida\n")
		    		escreva("Numero: ") leia(nota)
		    	}
		    	escreva("Nota válida\n\n")
		    	escreva("fazer novamente?(verdadeiro/falso): ") 
		    	leia(tentar_novamente)
	    	} enquanto (tentar_novamente == verdadeiro)
	}

	//3) Faça um programa que leia um nome de usuário e a sua senha e não aceite se o usuário a a senha forem diferentes, 
	//mostrando uma mensagem de erro e voltando a pedir as informações.*/
	const cadeia usuario_auth = "lucas", senha_auth = "123"
	funcao exercicio_3() {
		//vars
		cadeia usuario, senha
		//input
		escreva("escreva seu usuário: ") leia(usuario)
		escreva("escreva sua senha: ") leia(senha)
		//auth
		enquanto(usuario != usuario_auth ou senha != senha_auth){ 
			escreva("\nUsuário ou Senha inválidos\n\n")
			escreva("escreva seu usuáro: ") leia(usuario)
			escreva("escreva sua senha: ") leia(senha)
		}
		escreva("Nome e Senha válidos\n")
	}
	
	funcao func_menu(){
		//escolher opção
		inteiro opcao
		escreva("\nO QUE DESEJA FAZER? \n\n 1. Exercício 1\n 2. Exercício 2\n 3. Exercício 3\n 4. Finalizar Programa\n\nOPÇÂO: ") leia(opcao)
		escolha(opcao){
			caso 1: exercicio_1() pare
			caso 2: exercicio_2() pare
			caso 3: exercicio_3() pare
			caso 4: pare
			caso contrario:
			escreva("\nOpção Inválida, favor escolher uma das opções acima. \n\nOPÇÂO: ")
		}
	}

	//main
	funcao inicio()
	{
		func_menu()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1262; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */