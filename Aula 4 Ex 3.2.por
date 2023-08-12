programa{
/*2) Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles estão 
nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar quando for lido um número negativo.*/
	inclua biblioteca Util
	funcao inicio(){
		inteiro input, quadrante1 = 0, quadrante2 = 0, quadrante3 = 0, quadrante4 = 0, contador = 1
		faca{
			escreva("Numero: ") leia(input)
			//input = Util.sorteia(1,100) 
			limpa()
			se(input <= 25) quadrante1++
			senao se(input <= 50) quadrante2++
			senao se(input <= 75) quadrante3++
			senao se(input <= 100) quadrante4++
			escreva("Quadrante1: ", quadrante1, "\nQuadrante2: ", quadrante2, "\nQuadrante3: ", quadrante3, "\nQuadrante4: ", quadrante4, "\n\n")
			escreva("Contador: ", contador, "\n")
			contador++
		} enquanto(input >= 0) escreva("Numero Negativo!") //enquanto(contador != 100)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 288; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */