programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Tipos --> tp
	//Vetores 
	const cadeia vProdutoCodigo[6] = {"1","2","3","4","5","6"}
	const cadeia vProdutoNome[6] = {"Parafuso", "Arruela", "Porca", "Chave de fenda", "Broca", "Bucha"}
	const real vProdutoPreco[6] = {2.00,3.00,1.00,2.00,3.00,4.00}
	//const inteiro vProdutoEstoque[6] = {}
	//const cadeia vProdutoDesc[6]

	//relatorio
	real valorLiquido
	real valorBruto
	real descontoFinal

	//tipo de pagamento
	//const real tipoPagamento[3] = {1.05, 1, 0.95}
	const real acrescimo = 1.05
	const real decrescimo = 0.95

	// =========================================== main ===========================================
	funcao inicio()
	{
		menuInicial()
	}

	// =========================================== menus ===========================================

	funcao menuInicial(){
        //listar produtos
        //calcular

		gerarTitulo("\tLOJA DE FERRAMENTAS HARD")
		cadeia nome, opcao
		escreva("Informe seu nome: ")
		leia(nome)
		limpa()

		gerarTitulo("LOJA DE FERRAMENTAS HARD")
		escreva ("Bem-vindo, ", nome, "\n")
		escreva("\nEscolha uma Opção:\n(1) Orçamento\t\t\n(2) Produtos\t\t\n(3) Sair\t\n\nOpção: ")
		leia (opcao)
		limpa()

    }

	
		//listar produtos


	// =========================================== funcoes ===========================================
	
	funcao linha(inteiro tamanho){
			para (inteiro i=0; i<tamanho; i++)
				escreva ("=")		
	}


	funcao gerarTitulo (cadeia titulo) {
		limpa()
		escreva("==============================\n")
		escreva("   "+titulo+"\n")
		escreva("==============================\n\n")        
    }

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1544; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */