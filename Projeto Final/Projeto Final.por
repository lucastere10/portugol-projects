programa{	


	//BY LUCAS CALDAS
	//DIFICULDADE: TRANSFORMAR VALORES CADEIA EM REAL OU INTEIRO
	//RESPOSTA: USAR MATRIZ DE RELACIONAMENTO OU PROCURAR UMA BIBLIOTECA PARA FAZER ESSA MERDA
	
	//DIFICULDADE: EXPORTAR ARQUIVOS EM FORMATO DIFERENTE DE .TXT
	//RESPOSTA: NAO FAZER ISSO
	
	//DIFICULDADE: IMPORTAR VALORES COM MULTIPLAS COLUNAS
	//RESPOSTA: COMBINAR FUNCOES extrair_subtexto(cad, posicao_inicial, posicao_final) E numero_caracteres(*cadeia* cadeia)

	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Arquivos --> a
	inclua biblioteca Objetos --> obj
	inclua biblioteca Tipos --> tp
	
	const cadeia vProdutos[6][3] 	= {
		{"PROD01231","Parafusos", "2.27"}		, 	{"PROD024234","Arruelas", "7.89"}, 
		{"PROD212","Porcas"   ,"4.32"}		, 	{"PROD041233114","Chaves de fenda", "29.90"}, 
		{"PROD2305","Brocas"   ,"8.98"}		, 	{"PROD0644123","Buchas", "2.89"}}
	const cadeia mFormasPagamento[3][3] = {{"1","A Vista","Desconto de 5%"}, {"2","No Credito","Preço Normal"}, {"3","A Prazo","Acrescimo de 5%"}}
	// func inicio
	funcao inicio()
	{	//vars
		
		//cadeia vCliente[3] // Empresa, Endereço, Teste

		//relatorio
		real vRelatorioOrcamento[3]
		real vRelatorioGeral[2]
		real vRelatorioProduto[6][5]
		//opções
		menu()
		//()		
	}

	// =========================================== RELATORIOS ===========================================
	
	funcao gerarRelatorio(){
		limpa()
		real formaPagamento = 1.00, v_total, vTotalOrcamento = 0.00
		inteiro vQuantidade[6], codigo
		inteiro n = 1, x = 1, i , j, quantidade, opcao
		caracter exportar
		cadeia empresa_selecionada = selecionarClientesParaRelatorio()
		limpa()
		//quantidade de produtos para comprar
		para(i = 0; i<6; i++){
			
			GerarTitulo("LISTA DE PRODUTOS")
			escreva("    ID                 NOME     	      PREÇO")
			criarLinha()
			para(j = 0; j < 6; j++){
				escreva(	vProdutos[j][0], cEsp(vProdutos[j][0],23), 
						vProdutos[j][1], cEsp(vProdutos[j][1],23), 
				    "R$", vProdutos[j][2], "\n")
			}
			escreva("Informe o codigo do produto: " ) leia(codigo)
			escreva("\nQuantos(as) ", vProdutos[i][1], " deseja comprar? --> ") leia(quantidade) 
			vQuantidade[i] = quantidade
		}
		limpa()
		loading("Registrando Preços \n", 250)
		limpa()
		para(i = 0; i<3; i++){escreva(mFormasPagamento[i][0],". ", mFormasPagamento[i][1], ": ", mFormasPagamento[i][2], "\n")}
		escreva("\nInforme o método de pagamento: ") leia(opcao)
		escolha(opcao){
			caso 1: formaPagamento = 0.95 pare
			caso 2: formaPagamento = 1.00 pare
			caso 3: formaPagamento = 1.05 pare
		}
		limpa()
		loading("Método de Pagamento escolhido: " + mFormasPagamento[opcao-1][1] + "\n", 250)
		limpa()
		loading("Calculando descontos..." + mFormasPagamento[opcao-1][2] + "\n", 250)
		limpa()
		loading("Gerando Relatório, Aguarde...\n", 500)
		limpa()
		//titulo
		criarLinha()
		escreva("Nome do cliente:   ", empresa_selecionada,"               Data: ")
		retornarDataAtual()
		//subtitulo
		criarLinha()
		escreva("Cód do produto |     Nome Produto     | Quantidade |   Valor Unit   |  Desc/Acrésc  |   Valor Total")
		criarLinha()
		para(i = 0; i < 6;i++){
			v_total = transformarReal(vProdutos[i][2]) * vQuantidade[i] * formaPagamento
			escreva(  "   ",
					vProdutos[i][0], 				cEsp(vProdutos[i][0],18),
					vProdutos[i][1], 				cEsp(vProdutos[i][1],23), 
					vQuantidade[i] , 				cEsp(tp.inteiro_para_cadeia(vQuantidade[i],10),11),
			    		"R$", vProdutos[i][2],			cEsp(vProdutos[i][2],17),	
			    		//apresentar descontos.
     				"R$", mat.arredondar(tp.cadeia_para_real(vProdutos[i][2])*(1-formaPagamento)*-1, 2), cEsp(tp.real_para_cadeia(formaPagamento),12),
					//calcular valor total
			    		"R$",	mat.arredondar(v_total,2), "\n")
					vTotalOrcamento = vTotalOrcamento + v_total
		}	
		criarLinha()
		escreva("VALOR TOTAL: R$", vTotalOrcamento)
		criarLinha()
		//exportar
		escreva("\n\tDeseja Exportar o Relatório Criado? --> ") leia(exportar) 
		se(exportar == 's' ou exportar == 'S') {
			exportarRelatorio(empresa_selecionada,vQuantidade, formaPagamento)
			loading("Exportando Relatório :) \n",500)
			limpa()
			escreva("Relatório exportado com sucesso! o/ \n\n Voltando ao menu...")
			u.aguarde(3000)
			menu()
		}
	}

	
	// =========================================== MENUS ===========================================
	funcao menu(){
		limpa()
		inteiro opcao, i
		GerarTitulo("GERADOR DE RELATÓRIOS")
		escreva(" 1. Produtos\n 2. Clientes \n 3. Relatórios \n 4. Listar Relatórios\n 5. Finalizar Programa" )
		criarLinha()
		escreva("OPÇÂO: ") leia(opcao)
		escolha(opcao){
			caso 1: menuProdutos() 		pare
			caso 2: menuClientes() 		pare //menuClientes()		pare
			caso 3: gerarRelatorio()		pare //menuRelatorios()		pare
			caso 4: listarRelatorios()	pare
			caso 5: creditos()  		pare
			caso contrario: opcaoInvalida()
		}
	}

	funcao menuProdutos(){
		limpa()
		inteiro opcao, i
		GerarTitulo("PRODUTOS")
		escreva(" 1. Listar \n 4. Voltar \n 5. Finalizar Programa")
		criarLinha()
		escreva("OPÇÂO: ") leia(opcao)
		escolha(opcao){
				caso 1: listarProdutos()	pare
				caso 4: menu()			pare
				caso 5: pare
				caso contrario: opcaoInvalida()			
		}	
	}

	funcao menuClientes(){
		limpa()
		inteiro opcao, i
		GerarTitulo("CLIENTES")
		escreva(" 1. Listar \n 2. Adicionar \n 3. Excluir \n 4. Voltar \n 5. Finalizar Programa")
		criarLinha()
		escreva("OPÇÂO: ") leia(opcao)
		escolha(opcao){
			caso 1: listarClientes()		pare
			caso 2: registrarClientes() 	pare
			caso 3: 					pare
			caso 4: menu()				pare
			caso contrario: opcaoInvalida()
		}
	}

	funcao voltarMenu(){
		caracter opcao
		escreva("\nVoltar ao Menu? (S/N): ") leia(opcao)	
		se(opcao == 's' ou opcao == 'S' ) menu()
		}

	// =========================================== LISTAR ===========================================
	funcao listarProdutos(){
		inteiro i, j, opcao
		limpa()
		GerarTitulo("LISTA DE PRODUTOS")
		escreva("    ID                 NOME     	      PREÇO")
		criarLinha()
		para(i = 0; i < 6; i++){
			escreva(	vProdutos[i][0], cEsp(vProdutos[i][0],23), 
					vProdutos[i][1], cEsp(vProdutos[i][1],23), 
			    "R$", vProdutos[i][2], "\n")
		}
		voltarMenu()
	}

	funcao listarClientes(){
		limpa()
		cadeia caminho_do_arquivo = "./clientes.txt"
		inteiro arquivo_cliente = a.abrir_arquivo(caminho_do_arquivo, a.MODO_LEITURA)
		cadeia linha = ""
		limpa()
		GerarTitulo("LISTA DE CLIENTES")
		inteiro numero_da_linha = 0
		enquanto (nao a.fim_arquivo(arquivo_cliente)){
			numero_da_linha = numero_da_linha + 1
			linha = a.ler_linha(arquivo_cliente)		
			escreva("Linha ", numero_da_linha, ": ", linha, "\n")	
		}
		a.fechar_arquivo(arquivo_cliente)
		voltarMenu()
	}

	funcao listarRelatorios(){
		limpa()
		cadeia caminho_do_arquivo = "./relatorio.txt"
		inteiro arquivo_relatorio = a.abrir_arquivo(caminho_do_arquivo, a.MODO_LEITURA)
		cadeia linha = ""
		limpa()
		GerarTitulo("LISTA DE RELATORIOS")
		inteiro numero_da_linha = 0
		enquanto (nao a.fim_arquivo(arquivo_relatorio)){
			numero_da_linha = numero_da_linha + 1
			linha = a.ler_linha(arquivo_relatorio)		
			escreva("Linha ", numero_da_linha, ": ", linha, "\n")	
		}
		a.fechar_arquivo(arquivo_relatorio)
		voltarMenu()
	}


	// =========================================== ADICIONAR ===========================================
	funcao registrarProdutos(){}
			
	funcao registrarClientes(){
		//arquivo
		cadeia caminho_do_arquivo = "./clientes.txt"
		inteiro arquivo_usuario = a.abrir_arquivo(caminho_do_arquivo, a.MODO_ACRESCENTAR)

		//dados
		cadeia empresa_nome
		limpa()
		GerarTitulo("NOVO CLIENTE")
		escreva("\nEmpresa: ") 		leia(empresa_nome)
		escreva("\n\n", empresa_nome)
		a.escrever_linha(empresa_nome, arquivo_usuario)
		limpa()			
		a.fechar_arquivo(arquivo_usuario)
		loading("\nCliente cadastrado com sucesso!\n-> Retornando ao menu\n",500)
		menu()
	}

	funcao registrarRelatorios(){}
	// =========================================== EXCLUIR ===========================================

	

	// =========================================== SELECIONAR ===========================================

	funcao cadeia selecionarClientesParaRelatorio(){
		caracter opcao_clientes = 'n'
		cadeia empresa_selecionada = ""
		limpa()
		faca{
			//ler e escrever aquivo
			cadeia caminho_do_arquivo = "./clientes.txt"
			inteiro arquivo_cliente = a.abrir_arquivo(caminho_do_arquivo, a.MODO_LEITURA)
			cadeia linha = ""
			limpa()
			GerarTitulo("LISTA DE CLIENTES")
			inteiro n_linha
			inteiro numero_da_linha = 0
			enquanto (nao a.fim_arquivo(arquivo_cliente)){
				numero_da_linha = numero_da_linha + 1
				linha = a.ler_linha(arquivo_cliente)		
				escreva("Linha ", numero_da_linha, ": ", linha, "\n")		
			}
			
			inteiro i //interar entre as linhas para selecionar a escolhida
			a.fechar_arquivo(arquivo_cliente)
			arquivo_cliente = a.abrir_arquivo(caminho_do_arquivo, a.MODO_LEITURA)
			escreva("\nEscolha um cliente para gerar o relatório (indice da linha): ") leia(n_linha)
			para (i = 1; i<=n_linha; i++){
				empresa_selecionada = a.ler_linha(arquivo_cliente)
			}
			escreva("Deseja Selecionar o cliente: ",empresa_selecionada, " (s/n): ") leia(opcao_clientes)
			a.fechar_arquivo(arquivo_cliente)
		} enquanto(opcao_clientes != 's')
		retorne empresa_selecionada
	}
	
	// =========================================== FUNÇÕES ===========================================
	//Cria uma linha

	funcao criarLinha(){
		escreva("\n----------------------------------------------------------------------------------------------------\n")
	}

	//calcula o espaçamento necessário para alinha o output entre duas linhas
	funcao inteiro criarEspacamento(inteiro texto, inteiro espaco){
		inteiro j, x //espaco necessario
		x = espaco - texto
		para(j = 1; j <= x; j++){escreva(" ")}
		retorne x
	}

	funcao opcaoInvalida(){
		escreva("\nOpção Inválida, retornando ao menu...")
		u.aguarde(2000)
		menu()
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

	
	funcao cadeia cEsp(cadeia texto,inteiro espaco){
		// texto se refere ao valor anterior, espaco sera o espacamento entre os valores
		inteiro j, x
		cadeia espacamento = ""//
		x = espaco - txt.numero_caracteres(texto)
		para(j = 1; j <= x; j++){espacamento = espacamento + " "}
		retorne espacamento
	}

	funcao GerarTitulo(cadeia titulo){
		criarLinha()
		escreva("     ", titulo)
		criarLinha() 
	}

	funcao real transformarReal(cadeia item){
		retorne tp.cadeia_para_real(item)
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
		GerarTitulo("Agradecemos pela Preferencia!")	
		escreva("Créditos: \n\n")
		escreva("\tDouglas Maia \n\tGabriel Teixeira \n\tLucas  Caldas \n\tNatally Almeida \n\tRaynan Avila \n\tTaynara Aguiar\n\n")
		
	}
	//============================== firula ========================================
	funcao exportarRelatorio(cadeia nome_empresa, inteiro v[], real fPagamento){
		//arquivo
		cadeia caminho_do_arquivo = "./relatorio.txt"
		inteiro arquivo_relatorio = a.abrir_arquivo(caminho_do_arquivo, a.MODO_ACRESCENTAR) , i ,j
		cadeia linha2 = "Nome do cliente:   " + nome_empresa + "               Data: "
		
		//printar dados
		limpa()
		a.escrever_linha("Relatorio", arquivo_relatorio)		
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivo_relatorio)
		a.escrever_linha(linha2, arquivo_relatorio)
		a.escrever_linha("----------------------------------------------------------------------------------------------------", arquivo_relatorio)
		a.escrever_linha("Cód do produto |    Nome Produto    | Quantidade |   Valor Unit   |  Desc/Acrésc  |   Valor Total",  arquivo_relatorio)
		para(i=0; i<6; i++){
			cadeia linha3 = "   " + 
				vProdutos[i][0] 		+ cEsp(vProdutos[i][0],16) + 
				vProdutos[i][1] 		+ cEsp(vProdutos[i][1],24) + 
				v[i] 				+ cEsp(tp.inteiro_para_cadeia(v[i],10),11) + 
		   		"R$" + vProdutos[i][2]	+ cEsp(vProdutos[i][2],17) +
		   			  fPagamento		+ cEsp(vProdutos[i][2],19) +
		   			  (v[i]*tp.cadeia_para_real(vProdutos[i][2])*fPagamento)
			a.escrever_linha(linha3, arquivo_relatorio)
			
		}
		a.escrever_linha("\n\n", arquivo_relatorio)
		a.fechar_arquivo(arquivo_relatorio)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10196; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */