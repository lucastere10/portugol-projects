programa{
	inclua biblioteca Util
	inclua biblioteca Matematica --> mat
	/*1) Desenvolver um algoritmo que leia um número não determinado de valores e calcule e escreva a média aritmética dos valores lidos, 
	 a quantidade de valores positivos, a quantidade de valores negativos e o percentual de valores negativos e positivos*/
	funcao exercicio_1() {
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
	
	/*2) Escrever um algoritmo que leia uma quantidade desconhecida de números e conte quantos deles estão 
	nos seguintes intervalos: [0-25], [26-50], [51-75] e [76-100]. A entrada de dados deve terminar quando for lido um número negativo.*/
	funcao exercicio_2(){
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

	/*3) Fatorial: Escreva um algoritmo que leia um valor inicial A e imprima a seqüência de valores do cálculo de A! e o seu resultado. 
	Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120*/
	funcao exercicio_3() {
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
 * @POSICAO-CURSOR = 3157; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */