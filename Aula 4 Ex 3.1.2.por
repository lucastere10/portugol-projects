/*1) Desenvolver um algoritmo que leia um número não determinado de valores e calcule e escreva a média aritmética dos valores lidos, 
 a quantidade de valores positivos, a quantidade de valores negativos e o percentual de valores negativos e positivos*/
programa{
	inclua biblioteca Util
	inclua biblioteca Matematica --> mat
	funcao inicio(){
		inteiro input, contador = 0, lim_inf, lim_sup, n_interacoes
		real somatorio = 0.00, resultado = 0.00
		real n_negativos = 0.00, n_positivos = 0.00, n_total = 0.00
		escreva("Limite inferior: ") leia(lim_inf)
		escreva("Limite superior: ") leia(lim_sup)
		escreva("Numero de interações: ") leia(n_interacoes)
		real real_lim_inf = lim_inf, real_lim_sup = lim_sup //transformar valores inteiros em reais para conseguir calcular a porcentagem esperada de valores positivos e negativos
		faca{
			input = Util.sorteia(lim_inf,lim_sup)		//sortear valores não determinados
			limpa()
			//cálculos
			somatorio = somatorio + input
			n_total++
			resultado = (somatorio/n_total)
			//lógica
			se (input < 0)	{n_negativos++}
			senao		{n_positivos++}
			//output
			escreva("Input: [", lim_inf, ",", lim_sup, "]", "\nSomatório: ", somatorio, "\nn_total: ", n_total, "\nn_negativos: ", n_negativos, "\nn_positivos: ", n_positivos)
			escreva("\nPorcentagem Positiva: ", mat.arredondar((n_positivos/n_total)*100, 2), "%")
			escreva("\nPorcentagem Negativa: ", mat.arredondar((n_negativos/n_total)*100, 2), "%")
			escreva("\n\nRESULTADO: ", resultado, "\n\n")
			contador++
			//Util.aguarde(1000)  //se necessário colocar temporizador entre os loops
		} enquanto(contador != n_interacoes) //enquanto (input != 0) //enquanto(contador != 50)
		escreva("----- Controle -----\n")
		se(lim_inf < 0){
			lim_inf = lim_inf * (-1)
			escreva("\nPorcentagem Positiva: ", mat.arredondar((real_lim_sup/(real_lim_sup-real_lim_inf)  )* 100, 2), "%")
			escreva("\nPorcentagem Negativa: ", mat.arredondar((real_lim_sup/(real_lim_sup-real_lim_inf)-1)*-100, 2), "%")
		}
		escreva("\n\nCONTROLE: ", (lim_sup+lim_inf)/2, "\n\n")
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1996; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */