programa
{
	
	funcao inicio()
	{
		const cadeia usuario = "Lucas" 
		
		cadeia n_pessoa, n_empresa
		escreva("informe seu nome: ")
		leia(n_pessoa)
		escreva("informe o nome da empresa: ")
		leia(n_empresa)
		se(n_pessoa == usuario){
			escreva("\n\nAcesso Liberado\n\n")
			escreva("Bem vindo ", n_pessoa, " à ", n_empresa, "\n\n")
		}
		senao{
			escreva("Acesso Negado")
		}
	}
} 



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 386; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */