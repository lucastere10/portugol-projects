/*1) Desenvolver um algoritmo que leia um número não determinado de valores e calcule e escreva a média aritmética dos valores lidos, 
 a quantidade de valores positivos, a quantidade de valores negativos e o percentual de valores negativos e positivos*/
programa{
	inclua biblioteca Util
	inclua biblioteca Matematica --> mat
	funcao inicio(){	
		real input, somatorio = 0.00, resultado = 0.00
		real n_negativos = 0.00, n_positivos = 0.00, n_total = 0.00
		faca{
			escreva("Numero: ") leia(input)
			limpa()
			somatorio = somatorio + input
			n_total++
			resultado = (somatorio/n_total)
			se (input < 0) {n_negativos++}
			senao {n_positivos++}
			escreva("Input: ", input, "\nSomatório: ", somatorio, "\nn_total: ", n_total, "\nn_negativos: ", n_negativos, "\nn_positivos: ", n_positivos)
			escreva("\nPorcentagem Negativa: ", mat.arredondar((n_negativos/n_total)*100, 2), "%")
			escreva("\nPorcentagem Positiva: ", mat.arredondar((n_positivos/n_total)*100, 2), "%")
			escreva("\n\nRESULTADO: ", mat.arredondar(resultado,2), "\n\n")
		} enquanto (input != 0)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1073; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */