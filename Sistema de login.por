programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> u
	
	cadeia  mCliente[10][5] = {{"admin", "admin", "Administrador", "87654321", "12.345.678/0001-90"}, 
	{"lanches", "lanches123", "Ultra Lanches Co.", "12346548", "98.765.432/0002-10"}, 
	{"tech", "tech123", "Nova Tech", "43218765", "76.543.210/0003-30"}, 
	{"", "", "", "", ""}, 
	{"", "", "", "", ""}, 
	{"", "", "", "", ""}, 
	{"", "", "", "", ""}, 
	{"", "", "", "", ""}, 
	{"", "", "", "", ""}, 
	{"", "", "", "",""}}

	cadeia vVetor[10]
	
	funcao inicio()
	{
		menuLogin()
	}

	funcao menuLogin(){
    		//gerarTitulo("	    LOGIN")
		caracter opcao
		inteiro intOpcao
		u.aguarde(100)		
		escreva("\t(1) Login\n\t(2) Cadastrar\n\t(3) Sair\n\n  Opção: ") leia(opcao)
		intOpcao = tp.caracter_para_inteiro(opcao)
		enquanto (intOpcao > 3) {
			escreva("\n\tOpção Inváldia!") 
			u.aguarde(1500)
			menuLogin()
			}
		escolha(opcao){
			caso '1': fazerLogin(mCliente)		pare
			caso '2': cadastrarUsuario(mCliente) 	pare
			caso '3': pare
		}
    	}

	funcao fazerLogin(cadeia mMatriz[][]) {
		cadeia usuario, senha
		inteiro linhaAtual = 0, i
		escreva("Digite seu usuário: ") leia(usuario)	
		escreva("Digite sua senha: ") leia(senha)
		//verificar login
		para(i = 0; i < 10; i++){
			se(usuario == mMatriz[i][0]){linhaAtual = i}
		}
		se (mCliente[linhaAtual][1] == senha){ 
			escreva("Login Realizado com sucesso!")
		}
		senao {
			escreva("\nUsuário ou senha incorretos!")
			u.aguarde(1500)
			limpa()
			menuLogin()
		}				
	}
		
	funcao cadastrarUsuario(cadeia mMatriz[][]){
		cadeia nUsuario, nSenha
		inteiro i
		logico loop = verdadeiro
		
		escreva("\nNovo Usuário: ") 		leia(nUsuario)
		escreva("\nNova Senha: ") 		leia(nSenha)

		para(i = 0; i < 10; i++){
			escreva(i)
			se(mMatriz[i][0] == "" e loop == verdadeiro){
				mMatriz[i][0] = nUsuario
				mMatriz[i][1] = nSenha
				loop = falso
			}
		}	
		escreva("\n\nUsuário cadastrado com sucesso!")
		u.aguarde(2000)	
	}
	
    	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1764; 
 * @PONTOS-DE-PARADA = 69;
 * @SIMBOLOS-INSPECIONADOS = {mCliente, 6, 9, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */