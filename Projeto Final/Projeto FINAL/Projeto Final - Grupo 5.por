programa
{
	/*v.8 MODIFICACOES (VERSÃO FINAL)
	 * adicionado: menu de Orçamento
	 * adicionado: ler orçamentos exportados. Aperte 3 no menu Orçamentos para ver os orçamentos
    	 * adicionado: ler ultimo orçamento. Aperte 3 no menu Orçamentos para ver o ultimo orçamento realizado
    	 * modificado: espaços adicionais também são removido ao adicionar Nome do cliente (ex: "    Glorioso      Botafogo       ltda." vira "Glorioso Botafogo ltda.") ps: Gabriel tu é um genio
    	 * fix: ultimo orçamento não mais apresenta valores de rodapé duplicados. 
    	 * fix: ler ultimo orçamento não mais exporta o mesmo para 'relatório.txt' (usa-se logico exportar == verdadeiro)
    	 * fix: tratamento de dados: só não tratamos Alt + F4, de resto nada passa.
	 */

	/* GRUPO 5 - PROJETO FINAL DE PORTUGOL 
		Douglas Maia 
		Gabriel Teixeira 
		Lucas Caldas 
		Natally Almeida 
		Raynan Titoneli 
		Taynara Aguiar
	*/
	
	//Bibliotecas
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Tipos --> tp
	inclua biblioteca Arquivos --> a
	
	//Vetores Produto 
	const cadeia V_PRODUTO_CODIGO[6] = {"1","2","3","4","5","6"}
	const cadeia V_PRODUTO_NOME[6] = {"Parafuso", "Arruela", "Porca", "Chave de fenda", "Broca", "Bucha"}
	const real V_PRODUTO_PRECO[6] = {2.00,0.49,0.80,5.55,3.70,0.07}

	//tipo de pagamento
	const real V_METODO_PAGAMENTO_VALOR[4] = {0.83, 1.00, 0.95, 0.0}
	const cadeia v_METODO_PAGAMENTO_NOME[4] = {"Prazo","Credito","A Vista", "Nenhum"}
	//real vMetodoPagamento = 0.00																								//MODIFICADO
	
	//vetores Para Compra
	real vProdutoPrecoUnitarioLiquido[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, vProdutoModificadoUnitario[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	inteiro vProdutoQuantidadeUnitaria[] = {0, 0, 0, 0, 0, 0}, vProdutoEstoque[6] = {10000,10000,10000,10000,10000,10000}
	
	//resultados para Orcamento
	cadeia usuarioAtual = ""
	inteiro dataAtual = cal.dia_mes_atual()
	real valorLiquido = 0.0, valorBruto = 0.0, descontoFinal = 0.0

	//arquivo
	logico relatorioArquivo = falso, orcamentoRegistrado = falso

	// =========================================== main ==================================================
	funcao inicio()
	{
		menuInicial(falso)
	}
	
	// =========================================== menus =================================================
	funcao menuInicial(logico nomeRegistrado){
		cadeia opcao

		se (nao nomeRegistrado) {
			
			faca {
				limpa()
				gerarTitulo("MUNDO DAS FERRAMENTAS")
				escreva("Informe seu nome(max:25 letras): ")
				leia(usuarioAtual)
				
				se (validarNome(usuarioAtual)) {	
					usuarioAtual = tirarEspaco(usuarioAtual)


						
					se (txt.numero_caracteres(usuarioAtual) <= 25) pare
					senao {
						limpa()
						escreva("\nNome invalido min(4 letras) e max(25 letras)!!")
						u.aguarde(1500)
					}
				} senao {		
					limpa()
					escreva("\nNome invalido min(4 letras) e max(25 letras)!!")
					u.aguarde(1500)
				}
				
			} enquanto (verdadeiro)
			relatorioArquivo = a.arquivo_existe("./relatorio.txt") limpa()
			
			
			loading("Iniciando Programa", 60)	limpa()
			loading("Bem-vindo, " + usuarioAtual + "!", 100) limpa() u.aguarde(500)	
		}
		limpa()
		gerarTitulo("MUNDO DAS FERRAMENTAS")
		escreva ("Bem-vindo, ", usuarioAtual, ".\n")
		escreva("\nEscolha uma Opção:\n1. Orçamento\t\t\n2. Produtos\t\t\n0. Sair\nOpção: ") leia(opcao)

		se (opcao == "") opcaoInvalida()
		
		escolha(txt.obter_caracter(opcao, 0)){
			caso '1': menuOrcamento() pare
			caso '2': listarProdutos() pare
			caso '0': creditos() pare
			caso contrario: opcaoInvalida()
		}
     }

     funcao menuOrcamento(){
		cadeia opcao
		logico loop = verdadeiro
		inteiro metodoPagamento


		se (nao orcamentoRegistrado) metodoPagamento = 3

		faca  {
			limpa()
			gerarTitulo("Menu Orçamento")
			escreva ("\n1. Gerar novo orçamento\n")
			escreva ("2. Imprimir orçamento\n")
			escreva ("3. Histórico de orçamento\n\n")
			escreva ("0. Retorna ao menu\n\n")
			escreva ("digite uma opção: ")
			leia (opcao)

		

			se (opcao != "") {
				escolha (txt.obter_caracter(opcao, 0)){
					caso '1': gerarNovoOrcamento(metodoPagamento) 
							orcamentoRegistrado = verdadeiro
						pare 
					caso '2': 
							limpa()
								
							se (metodoPagamento == 3) {
								escreva("\nORÇAMENTO VAZIO!! por favor crie um orçamento primeiro.\n")
							}
							imprimirOrcamento(metodoPagamento, falso, falso)
							pressioneEnterParaContinuar("\n\nPressione enter para voltar ao menu orçamento")
							
							
						pare
					caso '3': se(relatorioArquivo == verdadeiro){
								limpa()
								loading("Carregando Histórico de Orçamentos, Aguarde...\n", 210) limpa()
								lerArquivo("./relatorio.txt")
							} senao{
								limpa()
								escreva("arquivo relatorio.txt não encontrado, retornando ao menu")
								u.aguarde(1800)
							}
						pare
					caso '0': loop = falso pare
					caso contrario: 
							escreva ("\nOpção invalida!!!")
							u.aguarde(300)
				}
				
			}

			
		} enquanto (loop)


		retornarMenu("", 0)
     }

	// =========================================== Processos ===============================================

	funcao gerarNovoOrcamento(inteiro &metodoPagamento){
		cadeia opcao
		logico loop = verdadeiro

		inteiro opcaoCorreta = -10
		
		
		faca  {
			limpa()
			gerarTitulo("Tipo de Pagamento")
			escreva("\n1. Prazo: 5% de acrescimo\n")
			escreva("2. Crédito: sem alteração\n")
			escreva("3. Vista: 5% de desconto\n\n")
			escreva("0. Retornar Menu\n\n")
			escreva("Qual será o método de pagamento?: ") leia(opcao)

			se (opcao != "") {
			
				escolha (txt.obter_caracter(opcao, 0)) {
					caso '1':
						loop = falso
						opcaoCorreta = 0
						
						pare
					caso '2':
						loop = falso
						opcaoCorreta = 1
						
						pare
					caso '3':
						loop = falso
						opcaoCorreta = 2
							
						pare
					caso '0':
						loop = falso
						opcaoCorreta = -1
						
						pare
					caso contrario:
						escreva("\nOpção invalida")
						u.aguarde(750)
						limpa()	
				}
			}

			
		} enquanto (loop)
		
		//dessa forma consigo encerrar o loop antes de ir pra outra função, isso evita problemas de performance
		se (opcaoCorreta == -1) retorne
		senao {
			calcularOrcamento(opcaoCorreta)
			metodoPagamento = opcaoCorreta	
		}
	}

	funcao calcularOrcamento (inteiro metodoPagamento){
		
		limpa()
		zerarOrcamento()
		opcoesCompra(V_METODO_PAGAMENTO_VALOR[metodoPagamento])

		limpa()
		loading("Verificando Método de Pagamento escolhido...\n", 100) limpa()											//LOADGIN
		loading("Calculando descontos...\n", 100) limpa()
		loading("Gerando Relatório, Aguarde...\n", 210) limpa()
		imprimirOrcamento (metodoPagamento, verdadeiro, verdadeiro)

		pressioneEnterParaContinuar ("\n\nPressione enter para voltar ao menu orçamento")
		u.aguarde(300)
	}
	
	funcao opcoesCompra (real metodoPagamento){
		cadeia codigoInformado
		inteiro contador = 0, codigoInteiro
		cadeia opcaoLoop
		cadeia quantidade = ""
		
		faca {
			limpa()
			faca{
				limpa()
				gerarTitulo("NOVO ORÇAMENTO")							  			  											  
				escreva("\n")											 
				imprimirOrcamentoPreview()	
				escreva("\n(Digite 0 em Código do Produto para finalizar a lista de compras)")										  

				escreva("\n\nInforme o código do Produto: ") leia(codigoInformado)
				se (codigoInformado == "0") {
					contador = 100
					pare
				}
				escreva("Quantidade: ") leia(quantidade)
				
			} enquanto (nao validarEntrada(codigoInformado) ou nao validarEntrada(quantidade))
			

			codigoInteiro = tp.cadeia_para_inteiro(codigoInformado, 10)

			se (codigoInteiro > 0 e codigoInteiro <= 6) {
			
				realizarCalculoVenda((codigoInteiro - 1), tp.cadeia_para_inteiro(quantidade, 10), metodoPagamento)
				
				
			} senao {
				
				se (codigoInteiro == 0)
					contador = 99
				senao{
					escreva("PRODUTO NÂO ENCONTRADO")						  
					u.aguarde(900)		
				}							
			}

			
			se (contador >= 99) {
				limpa()
				linhaSimples(119) escreva("\n")
				escreva("\t\t\t\tNOVO ORÇAMENTO\n")
				linhaSimples(119) escreva("\n")
				imprimirOrcamentoPreview()
				escreva("\nDeseja gerar o orçamento? (s/n): ")
				leia(opcaoLoop)
				se (txt.caixa_baixa(opcaoLoop) == "s") pare	
				contador = 0
			}
			contador++
		} enquanto(verdadeiro)	
	
		para(inteiro i = 0; i < 6; i++) {
			vProdutoEstoque[i] = vProdutoEstoque[i] - vProdutoQuantidadeUnitaria[i]
		}
		
	}

	funcao realizarCalculoVenda (inteiro indice, inteiro quantidade, real metodoPagamento){
		real calculoBruto

		se(quantidade > vProdutoEstoque[indice]){
			escreva("estoque insuficiente")
			u.aguarde(2000)
		}
		senao{		
			calculoBruto = quantidade * V_PRODUTO_PRECO[indice]
			vProdutoQuantidadeUnitaria[indice] = quantidade 
			
			se (metodoPagamento == 0) {
				vProdutoPrecoUnitarioLiquido[indice] = mat.arredondar(calculoBruto, 2)
				vProdutoModificadoUnitario[indice] = mat.arredondar(V_PRODUTO_PRECO[indice], 2)
			} senao {
				vProdutoPrecoUnitarioLiquido[indice] = mat.arredondar(calculoBruto * metodoPagamento, 2)
				vProdutoModificadoUnitario[indice] = mat.arredondar((calculoBruto * metodoPagamento) / quantidade, 2)
			}	
		}
	}

	// =========================================== LISTAR ================================================
	
	funcao imprimirOrcamentoPreview(){
		escreva("|    COD     |    PROD\t\t\t|    QTDE\t|    R$(Un.)\t|    Valor líquido\t|    Estoque\t      |\n\n")
		para (inteiro i=0;i<6; i++){
			escreva(	"|    " +cEsp(V_PRODUTO_CODIGO[i],8)+
				"|    "+ cEsp(V_PRODUTO_NOME[i],22)+
				"|    "+ cEsp(""+vProdutoQuantidadeUnitaria[i],11)+
				"|    R$"+ cEsp(""+vProdutoModificadoUnitario[i],9),
				"|    R$"+ cEsp(""+vProdutoPrecoUnitarioLiquido[i],17),
				"|    "+cEsp(""+vProdutoEstoque[i],17),
				"|\n")
		}
	}
     	
	funcao imprimirOrcamento(inteiro metodoPagamento, logico calcular, logico exportar){
		
		linha(97)
		escreva("\n| Cliente: "+cEsp(txt.caixa_alta(usuarioAtual),25)+" | Emissão: "+cEsp(retornarDataAtual(),24)+" | Validade: "+cEsp(validadeEmissao(),11)+"|\n") 
		linha(97)
		escreva("\n| Metodo: "+cEsp(v_METODO_PAGAMENTO_NOME[metodoPagamento],7)+" \t\t    -= PRODUTOS SELECIONADOS =-    \t\t\t\t|\n") 
		linha(97) 
		escreva("\n|      COD\t|     PROD\t\t|     QTDE\t|    R$(un.)\t|    Valor líquido\t|\n")
		linha(97)	
		
		escreva ("\n")
		para (inteiro i=0;i<6; i++){se (vProdutoQuantidadeUnitaria[i] > 0){
			escreva(
				"|\t#", 	V_PRODUTO_CODIGO[i], 
				"\t|  ",	cEsp(+ V_PRODUTO_NOME[i],21),
				"|\t", 	vProdutoQuantidadeUnitaria[i],
				"\t|\t", 	vProdutoModificadoUnitario[i], 
				"\t|\t",	vProdutoPrecoUnitarioLiquido[i],
				"\t\t|\n")
			}
		} linha(97)
		imprimirRodaPe(V_METODO_PAGAMENTO_VALOR[metodoPagamento], calcular)
		
		//verificar relatorio
		se(relatorioArquivo == verdadeiro e exportar == verdadeiro){
			exportarRelatorio(usuarioAtual)
			escreva("\n\nRelatório exportado para ./relatorio.txt\n")	
			escreva("Para acessa-lo vá a opção Histórico de Orçamentos")
		}
		
	}

	funcao imprimirRodaPe (real metodoPagamento, logico calcular){

		cadeia texto
		se (calcular) {
			para (inteiro i = 0; i < 6; i++) {
				valorBruto += (V_PRODUTO_PRECO[i] * vProdutoQuantidadeUnitaria[i])
			}
			
			valorLiquido = valorBruto * metodoPagamento
			descontoFinal = (valorBruto - valorLiquido) * -1
		}
		texto = "\n| Valor Bruto: R$"+cEsp(""+mat.arredondar(valorBruto, 2), 12) 
		
		se (metodoPagamento > 1) {
			texto +="\t| Acréscimo Total: +R$"+ cEsp(""+mat.arredondar(descontoFinal, 2),10)
		} senao se (metodoPagamento < 1) {
			texto +="\t| Desconto Total: -R$"+ cEsp(""+mat.arredondar(descontoFinal*-1, 2),10)
		} senao {
			texto +="\t| Desconto/Acréscimo: "+cEsp("0",10)
		}

		//TEXTO FINAL
		texto +="| Valor Total: R$"+cEsp(""+mat.arredondar(valorLiquido, 2), 12)+"\t|"
		escreva(texto + "\n")
		linha(97)		
	}
	
	funcao listarProdutos(){
    			gerarTitulo("Lista de Produtos")
    			escreva("   ID \t\t NOME \t\t\t PREÇO \t\t   ESTOQUE  \n")
    			linha(70)
			para (inteiro i = 0 ; i < 6 ; i++) {
				escreva ("\n   "+ cEsp(V_PRODUTO_CODIGO[i],13) + cEsp(V_PRODUTO_NOME[i],25) + "R$" + 
							   cEsp(tp.real_para_cadeia(V_PRODUTO_PRECO[i]),18) + vProdutoEstoque[i])
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

	funcao pressioneEnterParaContinuar(cadeia texto){
		cadeia enter
		escreva(texto)	
		leia(enter)
	}

	funcao retornarMenu(cadeia texto, inteiro tempo){
		escreva(texto)
		u.aguarde(tempo)
		menuInicial(verdadeiro)
	}

	funcao gerarTitulo (cadeia titulo){
		limpa()
		
		inteiro tamanho = txt.numero_caracteres(titulo)
		
		linha(20+tamanho)
		escreva("\n          "+titulo+"\n")
		
		linha(20+tamanho)
		escreva("\n")
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

    	funcao cadeia retornarDataAtual(){
		cadeia texto = ""
		texto = cal.dia_semana_abreviado(cal.dia_semana_atual(), falso, falso)+ ", "+ 	// Dia da Semana Abreviado
		cal.dia_mes_atual()+ "/"+
		cal.mes_atual()+ "/"+
		cal.ano_atual()+ " "+
		cal.hora_atual(falso)+ ":"+
		cal.minuto_atual()+ ":"+
		cal.segundo_atual()


		retorne texto
	}

	funcao zerarOrcamento (){

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

	funcao logico validarNome (cadeia nome) {

		inteiro tamNome = txt.numero_caracteres(nome)
		inteiro quantidadeLetra = 0
		
	
		para (inteiro i = 1; i < tamNome; i++) {

			se (txt.obter_caracter(nome,i) != ' ') {
				quantidadeLetra++	
			}
		}
		
		se (quantidadeLetra <= 25 e quantidadeLetra >= 3) retorne verdadeiro
		retorne falso
	}
	
	funcao logico validarEntrada (cadeia entrada){

		inteiro tamanho = txt.numero_caracteres(entrada)
		inteiro contador = 0
		caracter letra
		
		para (inteiro i = 0; i < tamanho; i++) {
			
			letra = txt.obter_caracter(entrada, i)
			se (letra == '1' ou letra == '2' ou letra == '3' ou letra == '4' ou letra == '5' ou letra == '6'
				ou letra == '7' ou letra == '8' ou letra == '9' ou letra == '0') {
				contador++
			}				
		}

		
		se (tamanho < 1 ou tamanho >= 10) {
			
			se (tamanho == 10 e (txt.obter_caracter(entrada,0) == '2' ou txt.obter_caracter(entrada,0) == '1')) {

				se (txt.obter_caracter(entrada,0) == '1') retorne verdadeiro
					
				retorne entrada == "2000000000"		
			} 
			
			retorne falso
		}

		
		retorne tamanho == contador
	}

	funcao cadeia tirarEspaco (cadeia nome) {

		inteiro tamNome = txt.numero_caracteres(nome)
		
		se (tamNome < 3) retorne ""
		
		inteiro quantidadeLetra = 0, letraInicial = -1, letraFinal = -1
		caracter ultimaLetra = ']'
		cadeia texto = ""


		
		para (inteiro i = 1; i < tamNome - 1; i++) {

			se (txt.obter_caracter(nome,i-1) == ' ' e txt.obter_caracter(nome,i) == ' ' e  txt.obter_caracter(nome,i+1) != ' ') {
				letraInicial = i+1
			} senao
			se (txt.obter_caracter(nome,i-1) != ' ' e i-1 == 0) {
				letraInicial = i-1
				
			} senao
			se (txt.obter_caracter(nome,i-1) != ' ' e txt.obter_caracter(nome,i) == ' ' e txt.obter_caracter(nome,i+1) == ' ') {
				letraFinal = i-1
				texto+= txt.extrair_subtexto(nome, letraInicial, letraFinal+1) + " "
			} senao
			se (i+1 == tamNome-1 e txt.obter_caracter(nome,i+1) != ' ') {
				letraFinal = i+1
				texto+= txt.extrair_subtexto(nome, letraInicial, letraFinal+1)
			} senao
			se (i+1 == tamNome-1 e txt.obter_caracter(nome,i) != ' ') {
				letraFinal = i
				texto+= txt.extrair_subtexto(nome, letraInicial, letraFinal+1)
			}
			
		}																		// MODIFICADO
		se (txt.obter_caracter(texto, (txt.numero_caracteres(texto)-1)) == ' '){
			retorne txt.extrair_subtexto(texto, 0, txt.numero_caracteres(texto)-1)
			
		}
		
		retorne texto
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

	funcao creditos(){
		limpa()
		gerarTitulo("Agradecemos pela Preferencia!")	
		escreva("Créditos: \n\n")
		escreva("\tDouglas Maia \n\tGabriel Teixeira \n\tLucas Caldas \n\tNatally Almeida \n\tRaynan Titoneli \n\tTaynara Aguiar\n\n")
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
		pressioneEnterParaContinuar("Pressione Enter para retornar ao menu.")										//ADICIONADO PARA RETORNAR AO MENU.
		//retornarMenu("", 300)
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
			se(vProdutoQuantidadeUnitaria[i]>0){
				cadeia linha3 =  "|      "+V_PRODUTO_CODIGO[i]+
						     "\t|      "+cEsp(+ V_PRODUTO_NOME[i],21)+
						     "\t|      "+vProdutoQuantidadeUnitaria[i]+
						     "\t|      "+V_PRODUTO_PRECO[i]+
						     "\t|      "+vProdutoPrecoUnitarioLiquido[i]
				a.escrever_linha(linha3, arquivoRelatorio)
			}
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
 * @POSICAO-CURSOR = 79; 
 * @DOBRAMENTO-CODIGO = [417, 422, 427, 433, 439, 451, 457, 464, 478, 491, 503, 520, 552, 595, 622, 632, 638, 652];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */