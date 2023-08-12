programa{
	inclua biblioteca Util
	inclua biblioteca Matematica --> mat
	/*1) Uma clínica tem necessidade de informar o IMC (Índice de Massa Corporal) dos seus pacientes.
	Sabendo que o IMC se calcula da seguinte forma: divide-se o peso (em kg) pelo quadrado da altura 
	(em metros), crie um programa que faça o cálculo do IMC de um dado paciente.*/
	funcao exercicio_1() {
		//variáveis
		real peso, altura, imc
		cadeia status
	
		//input
		escreva("Peso (em kg): ")leia(peso)
		escreva("Altura (em metros): ")leia(altura)
	
		//lógica
		imc = peso / (altura * altura)
		
		escreva("IMC: ", imc, "\nStatus: ")
		se(imc < 18.5){escreva("Abaixo do peso")}
		se(imc >=18.5 e imc <= 24.9){escreva("Peso ideal")}
		se(imc >=25 e imc <=29.9){escreva("Sobrepeso")}
		se(imc > 30){escreva("Obeso")}	
	}	
	
	/*2) Uma contabilidade precisa calcular o Imposto de Renda dos funcionários de uma empresa.
	Dada a tabela do Imposto de Renda abaixo, solicite o salário de um funcionário e calcule o valor do imposto de renda a pagar, 
	tendo efetuado a dedução e informe para o contador o valor da base de cálculo, a alíquota aplicada, o valor deduzido e o imposto a pagar.*/
	funcao exercicio_2(){
		//variáveis
		real salario, imposto = 0.00, desconto_dependentes = 0.00
		inteiro n_dependentes = 0 // numero de dependentes
		
		//aliquotas
		const real aliquota1 = .0000
		const real aliquota2 = .0750
		const real aliquota3 = .1500
		const real aliquota4 = .2250
		const real aliquota5 = .2750

		//descontos
		const real descontos1 = 0.00
		const real descontos2 = 158.40
		const real descontos3 = 370.40
		const real descontos4 = 651.73
		const real descontos5 = 884.96
		
		//inputs
		escreva("Qual é o salário do funcionário? ")		leia(salario)
		escreva("quantos dependentes? ")				leia(n_dependentes)
		
		limpa()
		
		escreva("Salário: R$", salario, "\nDependentes: ", n_dependentes)
		escreva("\n\nValor da base de cálculo: R$", salario)

		//lógica
		se(salario <= 2112){
			desconto_dependentes = n_dependentes * descontos1
			imposto = salario * aliquota1 - desconto_dependentes
			escreva("\nAlíquota aplicada: %", mat.arredondar(aliquota1 * 100,2))
		}
		senao se(salario <= 2826.65){
			desconto_dependentes = n_dependentes * descontos2
			imposto = salario * aliquota2 - desconto_dependentes
			escreva("\nAlíquota aplicada: %", mat.arredondar(aliquota2 * 100,2))
		}
		senao se(salario <= 3751.05){
			desconto_dependentes = n_dependentes * descontos3
			imposto = salario * aliquota3 - desconto_dependentes
			escreva("\nAlíquota aplicada: %", mat.arredondar(aliquota3 * 100,2))
		}
		senao se(salario <= 4664.68){
			desconto_dependentes = n_dependentes * descontos4
			imposto = salario * aliquota4 - desconto_dependentes
			escreva("\nAlíquota aplicada: %", mat.arredondar(aliquota4 * 100,2))
		}
		senao se(salario > 4664.68){
			desconto_dependentes = n_dependentes * descontos5
			imposto = salario * aliquota5 - desconto_dependentes
			escreva("\nAlíquota aplicada: %", mat.arredondar(aliquota5 * 100,2))
		} senao { escreva("Valor inválido") }

		//caso imposto negativo
		se (imposto < 0){imposto = 0.00}
		
		escreva("\nDescontos aplicados para ", n_dependentes, " dependentes: R$", desconto_dependentes)
		escreva("\n\nVALOR DO IR: R$", mat.arredondar(imposto, 2))
		escreva("\nSALÁRIO LIQUIDO: R$", salario-imposto)
	}

	/*3) Fatorial: Escreva um algoritmo que leia um valor inicial A e imprima a seqüência de valores do cálculo de A! e o seu resultado. 
	Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120*/
	funcao exercicio_3() {
		// variáveis
	     inteiro dia, mes, ano
		logico dia_valido = falso, mes_valido = falso, ano_valido = falso, ano_bissexto = falso ,validacao = falso
	
	     /* Validações do numero de dias por mes
		* 31 dias = 1,3,5,7,8,10,12
		* 30 dias = 4,6,9,11
		* 28 dias = 2
		* 
		* Validação ano bissexto
		* - Divisível por 4 E Não pode ser divisível por 100.
		* - OU Divisível por 400.
		* 
		*/
	
		// inputs
	     escreva("Informe o dia: ")    	leia(dia)
	   	escreva("Informe o mês: ")   		leia(mes)
	 	escreva("Informe o ano: ")	 	leia(ano)
	
		// validação ano bissexto https://escolakids.uol.com.br/matematica/calculo-do-ano-bissexto.htm
		se (((ano % 4 == 0) e (ano % 100 != 0)) ou ano % 400 == 0){ 
			ano_bissexto = verdadeiro 
			escreva("\nAno Bissexto!\n")
		}
	
		// validação ano
		se (ano > 0){ ano_valido = verdadeiro}
		senao {escreva("\nAno inválido\n")}
			
		//validações mês
		se (mes > 0 e mes <=12){ mes_valido = verdadeiro}
		senao {escreva("\nMês inválido\n")}
		
		//validações dia
	  	se (dia >= 1){
	  		se (mes == 1 ou mes == 3 ou mes == 5 ou mes == 7 ou mes == 8 ou mes == 10 ou mes == 12){
				se (dia <=31){ dia_valido = verdadeiro} 
				senao{escreva("\nDia inválido\n")}
	  		}
	  		se (mes == 4 ou mes == 6 ou mes == 9 ou mes == 11){
				se (dia <=30){ dia_valido = verdadeiro} 
				senao{escreva("\nDia inválido, mês com 30 dias\n")}
	  		}
	  		se(mes == 2){
	  			se (ano_bissexto == verdadeiro){
	  				se (dia <= 29){ dia_valido = verdadeiro}
	  				senao{escreva("\nDia inválido, mês com 29 dias\n")}
	  			}
	  			senao{
	  				se (dia <= 28){ dia_valido = verdadeiro}
	  				senao{escreva("\nDia inválido, mês com 28 dias\n")}
	  			}
	  		}	
	  	} senao{escreva("\nDia inválido\n")}
	
		//validação final
		escreva("\nValidação do dia: ", dia_valido)
		escreva("\nValidação do mes: ", mes_valido)
		escreva("\nValidação do ano: ", ano_valido)
		
		se(dia_valido == verdadeiro e mes_valido == verdadeiro e ano_valido == verdadeiro){
			escreva("\n\nA data: ", dia,"/",mes,"/",ano, " é valida\n")
			validacao = verdadeiro
		}
		senao {escreva("\n\nA data: ", dia,"/",mes,"/",ano, " não é valida\n") }
		}


	// MENU
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
 * @POSICAO-CURSOR = 5711; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */