programa
{
	inclua biblioteca Tipos --> tp
	funcao inicio()
	{
		cadeia texto = "99"
		real num_real
		inteiro num_inteiro
		//escreva(tp.cadeia_para_inteiro(texto, 10))
		//escreva(tp.cadeia_para_real(texto))

		const cadeia vProdutos[6][3] 		= {
		{"PROD01", "Parafusos", "2.27"}	, 	{"PROD02","Arruelas", "7.89"}, 
		{"PROD03","Porcas", "4.32"}		, 	{"PROD04","Chaves de fenda", "29.90"}, 
		{"PROD05","Brocas", "8.98"}		, 	{"PROD06","Buchas", "2.89"}}
		/*{"","",""}					,	{"","",""},
		{"","",""}					,	{"","",""}
		}*/
		
		escreva(tp.cadeia_para_real(vProdutos[0][2]))
	}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */