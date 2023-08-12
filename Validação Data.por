programa{
    funcao inicio(){

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
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 677; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */