programa{
/*3) Fatorial: Escreva um algoritmo que leia um valor inicial A e imprima a seqüência de valores do cálculo de A! e o seu resultado. Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120*/
	funcao inicio(){
		inteiro input, fatorial
		real resultado
		cadeia texto = ""
		resultado = 1.00
		escreva("Numero: ") leia(input)
		para(fatorial = input; fatorial >= 1; fatorial--){
		   	se(fatorial == 1)	{texto = texto + fatorial}
		   	senao 			{texto = texto + fatorial + "x"}		  
	     	resultado = resultado * fatorial //n! = (n-1)! * n
        	}
        	escreva (input, "! = ", texto, " = ", resultado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 599; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */