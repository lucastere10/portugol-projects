programa{
	// crie um programa que receba um numero e faça uma taboada de 1 a 10
	funcao inicio(){
		//variaveis
		inteiro input, valor_final, contador = 1

		escreva("escreva o numero: ") 
		leia(input)

		enquanto(contador < 11){
			valor_final = input * contador
			escreva(input, " * ", contador, " = ", valor_final, "\n")
			contador++
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 344; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */