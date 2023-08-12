programa
{
	//Bibliotecas
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Tipos --> tp
	
	//Vetores Produto
	const cadeia vProdutoCodigo[6] = {"1","2","3","4","5","6"}
	const cadeia vProdutoNome[6] = {"Parafuso", "Arruela", "Porca", "Chave de fenda", "Broca", "Bucha"}
	real vProdutoPreco[6] = {2.00,3.00,1.00,2.00,3.00,4.00}
	real vProdutoPrecoUnitarioLiquido[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, vProdutoModificadoUnitario[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	inteiro vProdutoQuantidadeUnitaria[] = {0, 0, 0, 0, 0, 0}
	inteiro vProdutoEstoque[6] = {60,50,10,80,30,20}

	//relatorio
	inteiro dataAtual = cal.dia_mes_atual()
	real valorLiquido = 0.0, valorBruto = 0.0, descontoFinal = 0.0

	//tipo de pagamento
	const real tipoPagamento[3] = {1.05, 1.00, 0.95}
	cadeia vMetodoPagamento[3] = {"Prazo","Credito","A Vista"}

	// =========================================== main ===========================================
	funcao inicio()
	{
		menuInicial()
	}
	
	// =========================================== menus ===========================================
	funcao menuInicial(){
	   //listar produtos
	   //calcular
		gerarTitulo("LOJA DE FERRAMENTAS HARD")
		cadeia nome
		caracter opcao
		escreva("Informe seu nome: ")
		leia(nome)
		limpa()
		//loading("Iniciando Programa", 250)
		limpa()
		//loading("Bem-vindo, " + nome + "!", 250)
	
		gerarTitulo("LOJA DE FERRAMENTAS HARD")
		escreva ("Bem-vindo, ", nome, ".\n")
		escreva("\nEscolha uma Opção:\n(1) Orçamento\t\t\n(2) Produtos\t\t\n(3) Sair\nOpção: ") leia(opcao)
		escolha(opcao){
			caso '1': gerarNovoOrcamento()			pare
			caso '2': listarProdutos()				pare
			caso '3': creditos() pare
			caso contrario: opcaoInvalida()
		}
	//limpa()
     }

    	funcao menuOrcamento(){}

    	funcao menuProdutos(){}

    	funcao menuClientes(){}

	// =========================================== funcoes ===========================================

	//INICIAR NOVO ORCAMENTO
	funcao gerarNovoOrcamento(){
		limpa()
		inteiro opcao
		escreva("1. Prazo\n")
		escreva("2. Crédito\n")
		escreva("3. Vista\n\n")
		escreva("Qual será o método de pagamento?: ") leia(opcao)
		enquanto(opcao > 3 ou opcao <= 0){
			escreva("Opção Inválida")
			u.aguarde(1000)
			gerarNovoOrcamento()
		}
		calcular(tipoPagamento[opcao-1]) //Envia o tipo de pagamento para ser
		//imprimirOrcamento(metodoPagamento[opcao-1])
	}

	funcao calcular(real metodoPagamento) {
		limpa()
		opcoesCompra(metodoPagamento)
		//limpa()
		//imprimirOrcamento()
	}
	
	funcao opcoesCompra(real metodoPagamento) {
		caracter codigoInformado
		inteiro contador = 0
		cadeia opcaoLoop
		
		faca {
			limpa()
			gerarTitulo("	ORÇAMENTO PREVIEW")							  
			escreva("(Digite 0 Para Finalizar a lista de compras)\n")				  											  
			escreva("\n")											 
			imprimirOrcamentoPreviewComQuantidade()											  
			
			escreva("\nInforme o código do Produto: ")                         
			leia(codigoInformado)
			enquanto(tp.caracter_para_inteiro(codigoInformado) > 6){	       
				escreva("PRODUTO NÂO ENCONTRADO") 						  
				u.aguarde(900)		
				pare//MODIFICADO			
			}													 
			escolha (codigoInformado) {
				caso '1':
						realizarCalculoVenda(0,metodoPagamento)
					pare
				caso '2':
						realizarCalculoVenda(1,metodoPagamento)
					pare
				caso '3':
						realizarCalculoVenda(2,metodoPagamento)
					pare
				caso '4':
						realizarCalculoVenda(3,metodoPagamento)
					pare
				caso '5':
						realizarCalculoVenda(4,metodoPagamento)
					pare
				caso '6':
						realizarCalculoVenda(5,metodoPagamento)
					pare
				caso '0': contador += 99
						
			}	
			
			se (contador >= 99) {
				limpa()
				imprimirOrcamentoPreviewComQuantidade()
				escreva("\nDeseja continuar com o orçamento? (s/n): ")
				leia(opcaoLoop)
				se (txt.caixa_baixa(opcaoLoop) == "s") pare	
				contador = 0
			}
			contador++
		} enquanto(verdadeiro)	


		imprimirRodaPe(metodoPagamento)
		pressioneEnterParaContinuar ("\n\nPressione enter para voltar ao menu")
		retornarMenu("",300)
	}

	funcao realizarCalculoVenda (inteiro indice, real metodoPagamento) {
		inteiro quantidade
		
		escreva("Produto Selecionado: "+vProdutoNome[indice])
		escreva("\nQuatidade: ")
	     leia(quantidade)
		
		vProdutoQuantidadeUnitaria[indice] = quantidade
		vProdutoPrecoUnitarioLiquido[indice] = (quantidade * vProdutoPreco[indice]) * metodoPagamento
		vProdutoModificadoUnitario[indice] = (vProdutoPreco[indice] * metodoPagamento)	
	}

	funcao imprimirRodaPe (real metodoPagamento) {
		limpa()
		loading("Verificando Método de Pagamento escolhido...\n", 150)
		limpa()
		loading("Calculando descontos...\n", 150)
		limpa()
		loading("Gerando Relatório, Aguarde...\n", 300)
		limpa()
		linha(96)
		escreva("\n  Cliente: TESTE BOTAFOGO" + "  Emissão: ")
		retornarDataAtual()
		escreva("		Validade: " + validadeEmissao() + "\n")
		linha(96)
		escreva("\n")
		imprimirOrcamentoPreview ()
		linha(96)
		para (inteiro i = 0; i < 6; i++) {
			valorBruto += (vProdutoPreco[i] * vProdutoQuantidadeUnitaria[i])
		}	
		valorLiquido = valorBruto * metodoPagamento
		se (metodoPagamento > 1 ou metodoPagamento < 1)
			descontoFinal = (valorBruto - valorLiquido) * -1
		escreva("\n| Valor Bruto: R$"+mat.arredondar(valorBruto, 2)) 
		se (metodoPagamento > 1) {
			escreva("\t| Acrescimo Total: +R$"	+ mat.arredondar(descontoFinal, 2)) 
		} senao se (metodoPagamento < 1) {
			escreva("\t| Desconto Total: -R$"	+ mat.arredondar(descontoFinal*-1, 2)) 
		} senao {
			escreva("\t| Desconto/Acrescimo atual: 0")
		}
		escreva("\t|\tVALOR LIQUIDO: R$"+mat.arredondar(valorLiquido, 2), "\t\t|") 
		escreva("\n")
		linha(96)
		escreva("\n")
		//imprimirOrcamentoPreview ()		
	}

	funcao imprimirOrcamentoPreview () {
     	
		escreva("|    COD     |", "     PROD\t\t\t|", "     QTDE\t|","    R$(Un.)\t|","    Valor líquido\t|", "\n")
		linha(96)
		escreva("\n")
		para (inteiro i=0;i<6; i++){
			escreva(	"|    ", vProdutoCodigo[i], 								cEsp(vProdutoCodigo[i],8),
					"|    ", vProdutoNome[i], 								cEsp(vProdutoNome[i],22),
					"|    ", vProdutoQuantidadeUnitaria[i], 					cEsp(tp.inteiro_para_cadeia(vProdutoQuantidadeUnitaria[i],10),11),
					"|    R$", mat.arredondar(vProdutoModificadoUnitario[i],2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoModificadoUnitario[i],   2)),9),
					"|    R$", mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2)),17),
					"|\n")
		}
	}

	funcao imprimirOrcamentoPreviewComQuantidade() {
	escreva("|    COD     |", "    PROD\t\t\t|", "    QTDE\t|","    R$(Un.)\t|","    Valor líquido\t|", "    Estoque\t      |", "\n")
	escreva("\n")
	para (inteiro i=0;i<6; i++){
		escreva(	"|    ", vProdutoCodigo[i], 								cEsp(vProdutoCodigo[i],8),
				"|    ", vProdutoNome[i], 								cEsp(vProdutoNome[i],22),
				"|    ", vProdutoQuantidadeUnitaria[i], 					cEsp(tp.inteiro_para_cadeia(vProdutoQuantidadeUnitaria[i],10),11),
				"|    R$", mat.arredondar(vProdutoModificadoUnitario[i],2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoModificadoUnitario[i],   2)),9),
				"|    R$", mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2)),17),
				"|    ", vProdutoEstoque[i], 								cEsp(tp.inteiro_para_cadeia(vProdutoEstoque[i], 10),17),
				"|\n")
	}
		/*para (inteiro i=0;i<6; i++){
			escreva("|\t", vProdutoCodigo[i], "\t|\t",
			vProdutoNome[i], "\t|\t", vProdutoQuantidadeUnitaria[i],
			"\t|\t", vProdutoModificadoUnitario[i], "\t|\t"
			, vProdutoPrecoUnitarioLiquido[i],"\t\t|\n")
		}*/
	}
     	
	funcao imprimirOrcamento() {
		
	}

	
	// =========================================== LISTAR ===========================================

	
    funcao listarProdutos(){
    			gerarTitulo("Lista de Produtos")
    			escreva("   ID \t\t NOME \t\t    PREÇO\n")
    			linha(50)
			para (inteiro i = 0 ; i < 6 ; i++) {
				escreva ("\n   " + vProdutoCodigo[i] + cEsp(vProdutoCodigo[i],13) +  vProdutoNome[i] + cEsp(vProdutoNome[i],21) +  vProdutoPreco[i])
			}
			pressioneEnterParaContinuar ("\n\nPressione enter para voltar ao menu")
			retornarMenu("",300)
     }

	
	// =========================================== utilitários =========================================== 
	
	funcao linha(inteiro tamanho){
			para (inteiro i=0; i<tamanho; i++)
				escreva ("=")		
	}

	funcao linhaSimples(inteiro tamanho){
			para (inteiro i=0; i<tamanho; i++)
				escreva ("-")		
	}

	funcao pressioneEnterParaContinuar(cadeia i) { //MODIFICADO, AGORA PODE ESCOLHER A MENSAGEM PARA PLOTAR
		cadeia enter
		escreva(i)	
		leia(enter)
	}

	funcao retornarMenu(cadeia i, inteiro tempo){
		escreva(i)
		u.aguarde(tempo)
		menuInicial()
	}

	funcao gerarTitulo (cadeia titulo) {
		limpa()
		escreva("==============================\n")
		escreva("   "+titulo+"\n")
		escreva("==============================\n\n")        
    }

	funcao opcaoInvalida(){
		escreva("\nOpção Inválida, retornando ao menu...")
		u.aguarde(2000)
		menuInicial()
	}

	funcao cadeia cEsp(cadeia texto,inteiro espaco){
		// texto se refere ao valor anterior, espaco sera o espacamento entre os valores
		inteiro j, x
		cadeia espacamento = ""//
		x = espaco - txt.numero_caracteres(texto)
		para(j = 1; j <= x; j++){espacamento = espacamento + " "}
		retorne espacamento
	}

    funcao retornarDataAtual(){
		escreva(cal.dia_semana_abreviado(cal.dia_semana_atual(), falso, falso), ", ", 	// Dia da Semana Abreviado
		cal.dia_mes_atual(), "/",
		cal.mes_atual(), "/",
		cal.ano_atual(), " ",
		cal.hora_atual(falso), ":",
		cal.minuto_atual(), ":",
		cal.segundo_atual()
		)
	}

	funcao cadeia validadeEmissao(){
		inteiro validade
		cadeia emissaoValidade
		validade = cal.dia_mes_atual() + 30
		se (validade > 31){
			emissaoValidade = (validade - 31) + "/" +  (cal.mes_atual() + 1) + "/" + cal.ano_atual()	
		}
		senao {emissaoValidade = validade + "/" +  cal.mes_atual() + "/" + cal.ano_atual()}
		retorne emissaoValidade
	}

	funcao creditos(){
		limpa()
		gerarTitulo("Agradecemos pela Preferencia!")	
		escreva("Créditos: \n\n")
		escreva("\tDouglas Maia \n\tGabriel Teixeira \n\tLucas Caldas \n\tNatally Almeida \n\tRaynan Avila \n\tTaynara Aguiar\n\n")
	}
		
	

	funcao loading(cadeia texto, inteiro i){
		escreva(texto, "\n|       | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|-      | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|--     | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|---    | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|----   | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|-----  | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|------ | loading")
		u.aguarde(i)
		limpa()
		escreva(texto, "\n|-------| loading")
		u.aguarde(i)		
	}
	
	// Função para listar produtos com opção de selecionar quantidade
	/*funcao listarProdutos(){
		inteiro i
		escreva("\nCódigo\tNome\t\t\tPreço\n")
		para (i = 0; i < 6; i++){
			inteiro codigoSelecionado, quantidade
			escreva("\nDigite o código do produto desejado: ")
			leia(codigoSelecionado)
			escreva("Digite a quantidade desejada: ")
			leia(quantidade)
	
			real precoTotal = vProdutoPreco[codigoSelecionado] * quantidade
			escreva("\nProduto: ", vProdutoNome[codigoSelecionado])
			escreva("\nQuantidade: ", quantidade)
			escreva("\nPreço total: R$", precoTotal)
		}
    }*/    

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2339; 
 * @DOBRAMENTO-CODIGO = [356];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */