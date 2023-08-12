/*Exercícios com laço enquanto:
3) Faça um programa que leia um nome de usuário e a sua senha e não aceite se o usuário a a senha forem diferentes, mostrando uma mensagem de erro e voltando a pedir as informações.*/
programa{
	const cadeia usuario_auth = "lucas", senha_auth = "123"
	funcao inicio() {
		//vars
		cadeia usuario, senha

		//input
		escreva("escreva seu nome: ") leia(usuario)
		escreva("escreva sua senha: ") leia(senha)

		//auth
		enquanto(usuario != usuario_auth ou senha != senha_auth){ 
			escreva("Usuário ou Senha inválidos\n")
			escreva("escreva seu nome: ") leia(usuario)
			escreva("escreva sua senha: ") leia(senha)
		}
		escreva("Nome e Senha válidos\n")
	}}

	
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 683; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */