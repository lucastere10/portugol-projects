/*Exercícios com laço enquanto:
3) Faça um programa que leia um nome de usuário e a sua senha e não aceite se o usuário a a senha forem diferentes, mostrando uma mensagem de erro e voltando a pedir as informações.*/
programa{
	funcao inicio(){
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
}}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 225; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */