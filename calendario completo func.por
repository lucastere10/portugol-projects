programa{
	inclua biblioteca Calendario --> cal
	inclua biblioteca Texto --> tx
	inclua biblioteca Matematica --> mat	
	inclua biblioteca Util
	inclua biblioteca Arquivos --> arq
	funcao inicio(){


	// ter 04/08/2023 19:55
	inteiro contador
	contador = 1
	
	enquanto (contador != 3600){
		Util.aguarde(1000)
		escreva(	cal.dia_semana_abreviado(cal.dia_semana_atual(), falso, falso), ", ", 	// Dia da Semana Abreviado
				cal.dia_mes_atual(), "/",
				cal.mes_atual(), "/",
				cal.ano_atual(), " ",
				cal.hora_atual(falso), ":",
				cal.minuto_atual(), ":",
				cal.segundo_atual(), "\n"
		)
		contador ++
	}	
}}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 305; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */