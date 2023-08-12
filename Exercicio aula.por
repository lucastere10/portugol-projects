/*
 * Crie um algoritmo que inclua numa matriz o nome, o sobrenome e a rua de 5 pessoas
 * Crie uma função para localizar a pessoa pelo nome e outra para localizar pelo
 * sobrenome e outra pelo endereço
 */
programa{
	inclua biblioteca Util
	funcao inicio(){
		inteiro i, j
		cadeia mUsuario[5][3]
		cadeia nome, sobrenome, endereco
		para (i = 0; i < 5; i++){
			escreva("Usuario: ", i)
			escreva("\nNome: ") leia(nome)
			mUsuario[i][0] = nome
			escreva("Sobrenome: ") leia(sobrenome)
			mUsuario[i][1] = sobrenome
			escreva("Endereco: ") leia(endereco)
			mUsuario[i][2] = endereco
			limpa()
		}		
		menu(mUsuario)
	}

	
	funcao menu(cadeia mUsuario[][]){
		inteiro opcao
		limpa()
		escreva("escolha a opcao para se pesquisar: \n Caso 1: Nome \n Caso 2: Sobrenome \n Caso 3: Listar \nOpção: ") leia(opcao)
		escolha(opcao){		
			caso 1:exercicio_1(mUsuario) pare
			caso 2:exercicio_2(mUsuario) pare
			caso 3:listar(mUsuario)
			caso contrario: pare
		}
	}

	funcao exercicio_1(cadeia mUsuario[][]){
		inteiro i
		cadeia nome
		caracter voltar
		escreva("\nEscreva o nome a ser pesquisado: ") leia(nome)
		para (i = 0; i < 5; i++){
			se (mUsuario[i][0] == nome){
				escreva("Nome: ", mUsuario[i][0])
				escreva("\nSobrenome: ", mUsuario[i][1])
				escreva("\nEndereco: ", mUsuario[i][2])
			}
			escreva("\n\n Voltar ao menu? ") leia(voltar) 
			se (voltar == 's'){
				limpa()
				menu(mUsuario)	
			}
		}
	}
	
	funcao exercicio_2(cadeia mUsuario[][]){
		inteiro i
		cadeia sobrenome
		caracter voltar
		escreva("\nEscreva o sobrenome a ser pesquisado: ") leia(sobrenome)
		para (i = 0; i < 5; i++){
			se (mUsuario[i][1] == sobrenome){
				escreva("Nome: ", mUsuario[i][0])
				escreva("\nSobrenome: ", mUsuario[i][1])
				escreva("\nEndereco: ", mUsuario[i][2])
			}
			escreva("\n\n Voltar ao menu? ") leia(voltar) 
			se (voltar == 's'){
				limpa()
				menu(mUsuario)	
			}
		}
	}

	funcao listar(cadeia mUsuario[][]){
		inteiro i, j
		caracter voltar
		para (i = 0; i < 5; i++){
			escreva("\nNome: ", mUsuario[i][0])
			escreva(" | Sobrenome: ", mUsuario[i][1])
			escreva(" | Endereco: ", mUsuario[i][2])
		}
		escreva("\n\n Voltar ao menu? ") leia(voltar) 
		se (voltar == 's'){
			limpa()
			menu(mUsuario)	
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2244; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */