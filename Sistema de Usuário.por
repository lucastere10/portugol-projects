// CRIAR UM SISTEMA DE LOGIN PUXANDO DE ARQUIVOS EXTERNOS
programa{
	//libs
	inclua biblioteca Calendario --> cal
	inclua biblioteca Texto --> tx
	inclua biblioteca Matematica --> mat	
	inclua biblioteca Util
	inclua biblioteca Arquivos --> a

	//novo registro
	funcao novo_registro(){
		//arquivo
		cadeia caminho_do_arquivo = "./usuario.txt"
		inteiro arquivo_usuario = a.abrir_arquivo(caminho_do_arquivo, a.MODO_ACRESCENTAR)

		//dados
		cadeia user_nome
		cadeia user_sobrenome
		inteiro user_idade
		cadeia user_curso
		cadeia usuario
		limpa()
		escreva("-------- NOVO USUARIO --------")
		escreva("\nNome: ") 		leia(user_nome)
		escreva("Sobrenome: ") 	leia(user_sobrenome)
		escreva("Idade: ") 		leia(user_idade)
		escreva("Curso: ") 		leia(user_curso)
		usuario = user_nome + " " + user_sobrenome + "|" + user_idade + "|" + user_curso
		escreva("\n\n", usuario)
		a.escrever_linha(usuario, arquivo_usuario)
		limpa()			
		escreva("\nUsuário cadastrado com sucesso!\n\n")
		a.fechar_arquivo(arquivo_usuario)
		func_menu()
	}

	funcao verificar_registros(){
		cadeia caminho_do_arquivo = "./usuario.txt"
		inteiro arquivo_usuario = a.abrir_arquivo(caminho_do_arquivo, a.MODO_LEITURA)
		cadeia linha = ""
		limpa()
		escreva("\n ---------- CLIENTES ---------- \n\n")
		inteiro numero_da_linha = 0
		enquanto (nao a.fim_arquivo(arquivo_usuario)){
			numero_da_linha = numero_da_linha + 1
			linha = a.ler_linha(arquivo_usuario)		
			escreva("Linha ", numero_da_linha, ": ", linha, "\n")		
		}
		a.fechar_arquivo(arquivo_usuario)
		func_menu()
	}

	funcao remover_registros(){
		caracter apagar
		escreva("Deseja realmente apagar todos os registros? (S/N): ") leia(apagar)
		se (apagar == 'S'){
			cadeia caminho_do_arquivo = "./usuario.txt"
			inteiro arquivo_usuario = a.abrir_arquivo(caminho_do_arquivo, a.MODO_ESCRITA)
			a.escrever_linha("----- LISTA DE USUARIOS -----", arquivo_usuario)
			a.fechar_arquivo(arquivo_usuario)
			limpa()
			escreva("Registros removidos com sucesso!\n")
			func_menu()
		}
		senao func_menu()
		
	}

	//menu de escolha
	funcao func_menu(){
		//escolher opção
		inteiro opcao
		escreva("\nO QUE DESEJA FAZER? \n\n 1. Verificar Clientes\n 2. Registrar Novo Cliente\n 3. Remover Registros\n 4. Finalizar Programa\n\nOPÇÂO: ") leia(opcao)
		escolha(opcao){
			caso 1: verificar_registros() pare
			caso 2: novo_registro() pare
			caso 3: remover_registros() pare
			caso 4: pare
			caso contrario:
			escreva("\nOpção Inválida, favor escolher uma das opções acima. \n\nOPÇÂO: ")
		}
	}

	//func main
	funcao inicio(){	
		func_menu()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1877; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */