programa
{
	const cadeia USUARIO = "Lucas"
	const cadeia SENHA = "123"
	
	funcao inicio()
	{
		cadeia usuario, senha
		escreva("\nInforme o usuario: ")
		leia(usuario)
		escreva("\nInforme a senha: ")
		leia(senha)

		se (usuario == USUARIO e senha == SENHA){
			escreva("\nLogin realizado com sucesso!")			
		}
		senao{
			escreva("\nUsuário ou Senha incorreto.")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 380; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */