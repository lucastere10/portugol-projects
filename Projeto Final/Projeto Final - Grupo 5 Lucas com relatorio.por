programa
{
	/*v.4 MODIFICACOES
	 * modificado: loading no menu agora só acontece quando o usuario digitar o nome
	 * adicionado: nome do cliente no orcamento
	 * adicionado: funcao estoque como limitante na hora da compra
	 * adicionado: estoque agora é atualizado após imprimir novo orçamento
	 */
	 
	//OBS: PARA A FUNCAO EXPORTAR FUNCIONAR, É NECESSÁRIO TER UM ARQUIVO relatorio.txt na mesma pasta do arquivo .portugol
	
	//Bibliotecas
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Tipos --> tp
	inclua biblioteca Arquivos --> a
	
	//Vetores Produto
	const cadeia vProdutoCodigo[6] = {"1","2","3","4","5","6"}
	const cadeia vProdutoNome[6] = {"Parafuso", "Arruela", "Porca", "Chave de fenda", "Broca", "Bucha"}
	real vProdutoPreco[6] = {2.00,3.00,1.00,2.00,3.00,4.00}
	real vProdutoPrecoUnitarioLiquido[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, vProdutoModificadoUnitario[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	inteiro vProdutoQuantidadeUnitaria[] = {0, 0, 0, 0, 0, 0}
	inteiro vProdutoEstoque[6] = {60,50,10,80,30,20}
	
	//relatorio
	cadeia usuarioAtual = ""
	inteiro dataAtual = cal.dia_mes_atual()
	real valorLiquido = 0.0, valorBruto = 0.0, descontoFinal = 0.0

	//tipo de pagamento
	const real tipoPagamento[3] = {1.05, 1.00, 0.95}
	cadeia vMetodoPagamento[3] = {"Prazo","Credito","A Vista"}

	//arquivo
	logico relatorioArquivo = falso

	// =========================================== main ===========================================
	funcao inicio()
	{
		menuInicial(falso)
	}
	
	// =========================================== menus ===========================================
	funcao menuInicial(logico nomeRegistrado){
	   //listar produtos
	   //calcular
		caracter opcao 
		
		se (nao nomeRegistrado) {
			gerarTitulo("LOJA DE FERRAMENTAS MODO EASY")
			escreva("Informe seu nome: ")
			leia(usuarioAtual) limpa()
			loading("Iniciando Programa", 75) limpa()
			loading("Verificando relatorio.txt ..." , 150)
			relatorioArquivo = a.arquivo_existe("./relatorio.txt")
			escreva(" " + relatorioArquivo) u.aguarde(500) limpa()
			loading("Bem-vindo, " + usuarioAtual + "!", 120) u.aguarde(500)															//LOADING			
		}
		gerarTitulo("LOJA DE FERRAMENTAS HARD")
		escreva ("Bem-vindo, ", usuarioAtual, ".\n")
		escreva("\nEscolha uma Opção:\n(1) Orçamento\t\t\n(2) Produtos\t\t\n(3) Sair\nOpção: ") leia(opcao)
		escolha(opcao){
			caso '1': gerarNovoOrcamento() pare
			caso '2': listarProdutos() pare
			caso '3': creditos() pare
			caso '4': se(relatorioArquivo == verdadeiro){
					lerArquivo("./relatorio.txt")
					} senao{
						limpa()
						retornarMenu("arquivo relatorio.txt não encontrado, retornando ao menu", 1800)
					} pare
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
		caracter opcao
		logico loop = verdadeiro
		
		
		faca  {
		
			escreva("1. Prazo\n")
			escreva("2. Crédito\n")
			escreva("3. Vista\n\n")
			escreva("4. Retornar Menu\n")
			escreva("Qual será o método de pagamento?: ") leia(opcao)

			escolha (opcao) {
				caso '1':
					loop = falso
					calcular(tipoPagamento[0])
					
					pare
				caso '2':
					loop = falso
					calcular(tipoPagamento[1]) 
					
					pare
				caso '3':
					loop = falso
					calcular(tipoPagamento[2]) 
						
					pare
				caso '4':
					loop = falso
					retornarMenu("", 200)
					pare
				caso contrario:
					escreva("\nOpção invalida")
					u.aguarde(750)
					limpa()	
			}
			
		} enquanto (loop)

	}

	funcao calcular(real metodoPagamento) {
		limpa()
		zerarOrcamento()
		opcoesCompra(metodoPagamento)
		//limpa()
		//imprimirOrcamento()
	}
	
	funcao opcoesCompra(real metodoPagamento) {
		cadeia codigoInformado
		inteiro contador = 0, i
		cadeia opcaoLoop
		cadeia quantidade = ""
		
		faca {
			limpa()
			faca{
				limpa()
				gerarTitulo("   ORÇAMENTO PREVIEW\t\t\t\t\t\t(Digite 0 Para Finalizar a lista de compras)")							  			  											  
				escreva("\n")											 
				imprimirOrcamentoPreviewComQuantidade()											  
				//limpa()
				escreva("\nInforme o código do Produto: ") leia(codigoInformado)
				se (codigoInformado == "0") {
					contador = 100
					pare
				}
				escreva("Quantidade: ") leia(quantidade)
				
			} enquanto (nao validarEntrada(codigoInformado) ou nao validarEntrada(quantidade))
			
			
														 
			escolha (tp.cadeia_para_inteiro(codigoInformado, 10)) {
				caso 1:		
						realizarCalculoVenda(0, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso 2:
						realizarCalculoVenda(1, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso 3:
						realizarCalculoVenda(2, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso 4:
						realizarCalculoVenda(3, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso 5:
						realizarCalculoVenda(4, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso 6:
						realizarCalculoVenda(5, tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
					pare
				caso contrario:
					se (codigoInformado != "0") {
						escreva("PRODUTO NÂO ENCONTRADO")						  
						u.aguarde(900)		
					}
			}
			
			se (contador >= 99) {
				limpa()
				linhaSimples(119) escreva("\n")
				imprimirOrcamentoPreviewComQuantidade()
				escreva("\nDeseja gerar o orçamento? (s/n): ")
				leia(opcaoLoop)
				se (txt.caixa_baixa(opcaoLoop) == "s") pare	
				contador = 0
			}
			contador++
		} enquanto(verdadeiro)	
		imprimirRodaPe(metodoPagamento)
		para(i = 0; i < 6; i++) {
			vProdutoEstoque[i] = vProdutoEstoque[i] - vProdutoQuantidadeUnitaria[i]
		}
		se(relatorioArquivo == verdadeiro){
			exportarRelatorio(usuarioAtual)
			escreva("\n\n Relatório exportado para ./relatorio.txt\n")	
			escreva("Para acessa-lo vá a opção Verificar Relatórios")
		}
		pressioneEnterParaContinuar ("\n\nPressione enter para voltar ao menu")
		retornarMenu("",300)
	}

	funcao realizarCalculoVenda (inteiro indice, inteiro quantidade, real metodoPagamento) {
		real calculoBruto

		se(quantidade > vProdutoEstoque[indice]){
			escreva("estoque insuficiente")
			u.aguarde(2000)
		}
		senao{		
			calculoBruto = quantidade * vProdutoPreco[indice]
			vProdutoQuantidadeUnitaria[indice] = quantidade 
			
			se (metodoPagamento == 0) {
				vProdutoPrecoUnitarioLiquido[indice] = mat.arredondar(calculoBruto, 2)
				vProdutoModificadoUnitario[indice] = mat.arredondar(vProdutoPreco[indice], 2)
			} senao {
				vProdutoPrecoUnitarioLiquido[indice] = mat.arredondar(calculoBruto * metodoPagamento, 2)
				vProdutoModificadoUnitario[indice] = mat.arredondar((calculoBruto * metodoPagamento) / quantidade, 2)  //calculoBruto * metodoPagamento - calculoBruto
			}	
		}
	}

	funcao imprimirOrcamentoPreviewComQuantidade() {
		escreva("|    COD     |    PROD\t\t\t|    QTDE\t|    R$(Un.)\t|    Valor líquido\t|    Estoque\t      |\n\n")
		para (inteiro i=0;i<6; i++){
			escreva(	"|    " +cEsp(vProdutoCodigo[i],8)+
				"|    "+ cEsp(vProdutoNome[i],22)+
				"|    "+ cEsp(""+vProdutoQuantidadeUnitaria[i],11)+
				"|    R$"+ cEsp(""+vProdutoModificadoUnitario[i],9),
				"|    R$"+ cEsp(""+vProdutoPrecoUnitarioLiquido[i],17),
				"|    "+cEsp(""+vProdutoEstoque[i],17),
				"|\n")
		}
	}
     	
	funcao imprimirOrcamento(cadeia pMetodo){
		limpa()	linha(97)
		escreva("\n| Cliente: " + cEsp(txt.caixa_alta(usuarioAtual),26) + " | Emissão: ")	retornarDataAtual()
		escreva(" | Validade: " + validadeEmissao() + " |\n")	linha(97)
		escreva("\n|\t\t\t\t  -= PRODUTOS SELECIONADOS =-    \t\t\t\t|\n")	linha(97)		escreva("\n") 
		escreva("|      COD\t|", "     PROD\t\t|", "     QTDE\t|","    R$(un.)\t|","    Valor líquido\t|", "\n")	linha(97)	escreva ("\n")
		para (inteiro i=0;i<6; i++){se (vProdutoQuantidadeUnitaria[i] > 0){
			escreva(
				"|\t#", 	vProdutoCodigo[i], 
				"\t|  ",	cEsp(+ vProdutoNome[i],21),
				"|\t", 	vProdutoQuantidadeUnitaria[i],
				"\t|\t", 	vProdutoModificadoUnitario[i], 
				"\t|\t",	vProdutoPrecoUnitarioLiquido[i],
				"\t\t|\n")
			}
		} linha(97)
	}

	funcao imprimirRodaPe (real metodoPagamento) {
		cadeia Pagamento = "A vista"
		limpa()
		loading("Verificando Método de Pagamento escolhido...\n", 130) limpa()														//LOADING
		loading("Calculando descontos...\n", 130) limpa()
		loading("Gerando Relatório, Aguarde...\n", 280) limpa()
		imprimirOrcamento (Pagamento)
		para (inteiro i = 0; i < 6; i++) {
			valorBruto += (vProdutoPreco[i] * vProdutoQuantidadeUnitaria[i])
		}	
		valorLiquido = valorBruto * metodoPagamento
		descontoFinal = (valorBruto - valorLiquido) * -1
		escreva("\n| Valor Bruto: R$"+mat.arredondar(valorBruto, 2)) 
		se (metodoPagamento > 1) {
			escreva("\t| Acrescimo Total: +R$"	+ mat.arredondar(descontoFinal, 2)) 
		} senao se (metodoPagamento < 1) {
			escreva("\t| Desconto Total: -R$" + mat.arredondar(descontoFinal*-1, 2)) 
		} senao {
			escreva("\t| Desconto/Acrescimo: 0")
		}
		escreva("\t|\t VALOR TOTAL: R$"+mat.arredondar(valorLiquido, 2), "\t\t|") 
		escreva("\n")
		linha(97)
		escreva("\n")
		//imprimirOrcamentoPreview ()		
	}
	
	// =========================================== LISTAR ===========================================

	
    funcao listarProdutos(){
    			gerarTitulo("Lista de Produtos")
    			escreva("   ID \t\t NOME \t\t\t PREÇO \t\t QUANTIDADE \n")
    			linha(70)
			para (inteiro i = 0 ; i < 6 ; i++) {
				escreva ("\n   "+ cEsp(vProdutoCodigo[i],13) + cEsp(vProdutoNome[i],25) + "R$" + 
							   cEsp(tp.real_para_cadeia(vProdutoPreco[i]),18) + vProdutoEstoque[i])
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
		menuInicial(verdadeiro)
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
		menuInicial(verdadeiro)
	}

	funcao cadeia cEsp(cadeia texto,inteiro espaco){
		// texto se refere ao valor anterior, espaco sera o espacamento entre os valores
		inteiro x = espaco - txt.numero_caracteres(texto)
		para(inteiro j = 1; j <= x; j++){texto+= " "}
		retorne texto
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

	funcao zerarOrcamento () {

		para (inteiro i = 0; i < 6; i++) {
			vProdutoQuantidadeUnitaria[i] = 0
			vProdutoModificadoUnitario[i] = 0.0
			vProdutoPrecoUnitarioLiquido[i] = 0.0
		}	
		
		valorLiquido = 0.0 
		valorBruto = 0.0 
		descontoFinal = 0.0
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
		escreva("\tDouglas Maia \n\tGabriel Teixeira \n\tLucas Caldas \n\tNatally Almeida \n\tRaynan Titoneli \n\tTaynara Aguiar\n\n")
	}

	funcao logico validarEntrada (cadeia entrada) {

		inteiro tamanho = Texto.numero_caracteres(entrada)
		inteiro contador = 0
		caracter letra
		
		para (inteiro i = 0; i < tamanho; i++) {
			
			letra = Texto.obter_caracter(entrada, i)
			se (letra == '1' ou letra == '2' ou letra == '3' ou letra == '4' ou letra == '5' ou letra == '6'
				ou letra == '7' ou letra == '8' ou letra == '9' ou letra == '0') {
				contador++
			}				
		}
	
		retorne tamanho == contador
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

	// =========================================== arquivos =========================================== 
	
	const inteiro vModoArquivo[3] = {0,1,2} // 0 = Leitura; 1 = Escrita; 2 = Acrescentar
	funcao inteiro abrirArquivo(cadeia path, inteiro modo){
		cadeia caminho_do_arquivo = path
		inteiro arquivo = a.abrir_arquivo(caminho_do_arquivo, modo)
		retorne arquivo
	}

	funcao lerArquivo(cadeia path){
		inteiro arquivo = abrirArquivo(path,0)
		inteiro numero_da_linha = 0
		cadeia linhaAtual = ""
		enquanto (nao a.fim_arquivo(arquivo)){
			numero_da_linha = numero_da_linha + 1
			linhaAtual = a.ler_linha(arquivo)		
			escreva("Linha ", numero_da_linha, ": ", linhaAtual, "\n")	
		}
		a.fechar_arquivo(arquivo)
	}

	funcao exportarRelatorio(cadeia nomeCliente){
		inteiro arquivoRelatorio = abrirArquivo("./relatorio.txt",2), i
		cadeia linha1 = "Cliente: " + nomeCliente + 
		" | Emissão: " + cal.dia_mes_atual() + "/" + cal.mes_atual() + "/" + 	cal.ano_atual() + 
		" " + cal.hora_atual(falso) + ":" + cal.minuto_atual() + "\t|\t Validade: " + validadeEmissao()
		cadeia linha2 = "| Valor Bruto: R$" + mat.arredondar(valorBruto, 2) + 
		              "\t| Desc/Add: R$" + mat.arredondar(descontoFinal, 2) + 
		              "\t|\t VALOR TOTAL: R$"+mat.arredondar(valorLiquido, 2) + "\t\t"
		a.escrever_linha("", arquivoRelatorio)
		a.escrever_linha("Relatorio", arquivoRelatorio)		
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivoRelatorio)
		a.escrever_linha(linha1, arquivoRelatorio)
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivoRelatorio)
		a.escrever_linha("|      COD\t|"+"     PROD\t\t\t|" + "     QTDE\t|"+"    R$(un.)\t|"+"    Valor líquido"+"\n",arquivoRelatorio)
		para(i=0; i<6; i++){
			cadeia linha3 =  "|      "+vProdutoCodigo[i]+
					     "\t|      "+cEsp(+ vProdutoNome[i],21)+
					     "\t|      "+vProdutoQuantidadeUnitaria[i]+
					     "\t|      "+vProdutoPreco[i]+
					     "\t|      "+vProdutoPrecoUnitarioLiquido[i]
			a.escrever_linha(linha3, arquivoRelatorio)
		}
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivoRelatorio)
		a.escrever_linha(linha2, arquivoRelatorio)
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivoRelatorio)
		a.fechar_arquivo(arquivoRelatorio)
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1896; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */