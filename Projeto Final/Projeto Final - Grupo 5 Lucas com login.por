programa
{
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
	const real vProdutoPreco[6] = {2.00,3.00,1.00,2.00,3.00,4.00}
	inteiro vProdutoQuantidadeUnitaria[] = {0, 0, 0, 0, 0, 0}
	real vProdutoPrecoUnitarioLiquido[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, vProdutoModificadoUnitario[] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}
	const inteiro vProdutoEstoque[6] = {0,0,0,0,0,0}

	//relatorio
	inteiro dataAtual = cal.dia_mes_atual()
	real valorLiquido = 0.0, valorBruto = 0.0, descontoFinal = 0.0

	//tipo de pagamento
	const real tipoPagamento[3] = {1.05, 1.00, 0.95}
	cadeia vMetodoPagamento[3] = {"Prazo","Credito","A Vista"}

	// =========================================== main ===========================================
	funcao inicio()
	{
		menuLogin()
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

     funcao menuLogin(){
    		gerarTitulo("	    LOGIN")
		caracter opcao
		inteiro intOpcao
		u.aguarde(100)		
		escreva("\t(1) Login\n\t(2) Cadastrar\n\t(3) Sair\n\n  Opção: ") leia(opcao)
		intOpcao = tp.caracter_para_inteiro(opcao)
		enquanto (intOpcao > 3) {
			escreva("\n\tOpção Inváldia!") 
			u.aguarde(1500)
			menuLogin()}
		escolha(opcao){
			caso '1': lerUsuario()			pare
			caso '2': cadastrarUsuarioESenha() pare
			caso '3': pare
		}
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
		enquanto(opcao > 3){
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
			escreva("(Digite 0 Para Finalizar o programa)\n")				  
			//linha(96)											  
			escreva("\n")											 
			imprimirOrcamentoPreview()
			//linha(96)											  
			
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
			}	
			
			se (contador >= 6) {
				limpa()
				imprimirOrcamentoPreview()
				escreva("\nDeseja imprimir este relatorio? (s/n): ")
				leia(opcaoLoop)
				se (txt.caixa_baixa(opcaoLoop) == "s") pare	
			}
			contador++
		} enquanto(verdadeiro)	


		imprimirRodaPe(metodoPagamento)
		pressioneEnterParaContinuar("\n\nPressione Enter para continuar...")
	}

	funcao realizarCalculoVenda (inteiro indice, real metodoPagamento) {
		inteiro quantidade
		
		escreva("Produto Selecionado: "+vProdutoNome[indice])
		escreva("\nQuantos: ")
	     leia(quantidade)

		vProdutoQuantidadeUnitaria[indice] = quantidade
		vProdutoPrecoUnitarioLiquido[indice] = (quantidade * vProdutoPreco[indice]) * metodoPagamento
		vProdutoModificadoUnitario[indice] = (vProdutoPreco[indice] * metodoPagamento)	
	}

	funcao imprimirRodaPe (real metodoPagamento) {
		
		para (inteiro i = 0; i < 6; i++) {
			valorBruto += (vProdutoPreco[i] * vProdutoQuantidadeUnitaria[i])
		}

		valorLiquido = valorBruto * metodoPagamento
		
		se (metodoPagamento > 1 ou metodoPagamento < 1)
			descontoFinal = (valorBruto - valorLiquido) * -1

		
		escreva("\nValor Bruto: R$"+mat.arredondar(valorBruto, 2)) 
		se (metodoPagamento > 1) {
			escreva("\nAcrescimo Total: +R$"	+ mat.arredondar(descontoFinal, 2)) 
		}senao se (metodoPagamento < 1) {
			escreva("\nDesconto Total: -R$"	+ mat.arredondar(descontoFinal*-1, 2)) 
		} senao {
			escreva("\nDesconto/Acrescimo atual: 0")
		}
		escreva("\nValor Liquido: R$"+mat.arredondar(valorLiquido, 2)) 
				
	}

	funcao imprimirOrcamentoPreview () {
     	
		escreva("|    COD     |", "     PROD\t\t\t|", "     QTDE\t|","    R$(Un.)\t|","    Valor líquido\t|", "\n")
		//linha(96)
		
		para (inteiro i=0;i<6; i++){
			escreva(	"|    ", vProdutoCodigo[i], 								cEsp(vProdutoCodigo[i],8),
					"|    ", vProdutoNome[i], 								cEsp(vProdutoNome[i],22),
					"|    ", vProdutoQuantidadeUnitaria[i], 					cEsp(tp.inteiro_para_cadeia(vProdutoQuantidadeUnitaria[i],10),11),
					"|    R$", mat.arredondar(vProdutoModificadoUnitario[i],2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoModificadoUnitario[i],   2)),9),
					"|    R$", mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2), 	cEsp(tp.real_para_cadeia(mat.arredondar(vProdutoPrecoUnitarioLiquido[i], 2)),17),
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
	
     // =========================================== exportar ===========================================

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
	
	funcao lerUsuario(){
		limpa()
		inteiro arquivo = abrirArquivo("./usuario.txt", 0)
		inteiro numero_da_linha = 0
		cadeia linhaAtual = "", usuario
		escreva("Digite seu usuário: ") leia(usuario)
		enquanto (nao a.fim_arquivo(arquivo)){
			//u.aguarde(3000)
			numero_da_linha = numero_da_linha + 1
			linhaAtual = a.ler_linha(arquivo)	
			//escreva("\nLinha: ", numero_da_linha, " NomeNaLinha: ", linhaAtual)	
			se(usuario == linhaAtual){
				a.fechar_arquivo(arquivo)
				lerSenha(numero_da_linha-1)
				pare
			}
		}
		a.fechar_arquivo(arquivo)
		lerSenha(numero_da_linha-1)
		/*limpa()
		escreva("Usuário não existente!")
		u.aguarde(1500)
		limpa()
		a.fechar_arquivo(arquivo)
		menuLogin()*/
	}
	
	funcao lerSenha(inteiro int){
		inteiro arquivo = abrirArquivo("./senha.txt",0)
		inteiro numero_da_linha = 0
		cadeia linhaAtual = "", senha
		escreva("Digite sua senha: ") leia(senha)
		para(numero_da_linha = 0; numero_da_linha <= int; numero_da_linha++){
			linhaAtual = a.ler_linha(arquivo)
		}
		escreva(linhaAtual)
		limpa()
		loading("",60)
		se(senha == linhaAtual){
			a.fechar_arquivo(arquivo) 
			retornarMenu("\n\n Login Realizado com sucesso!",1000)			
		}
		senao {
			escreva("\nUsuário ou senha incorretos!")
			a.fechar_arquivo(arquivo)
			u.aguarde(1500)
			limpa()
			menuLogin()
		}	
	}
	
	funcao cadastrarUsuarioESenha(){
		gerarTitulo("REGISTRAR NOVO USUARIO")
		cadeia usuario, senha
		escreva("\nNovo Usuário: ") 		leia(usuario)
		escreva("\nNova Senha: ") 		leia(senha)
		//cadastrar usuario
		inteiro arquivo_usuario = abrirArquivo("./usuario.txt",2)
		a.escrever_linha(usuario	, arquivo_usuario)
		a.fechar_arquivo(arquivo_usuario)
		//cadastrar senha
		inteiro arquivo_senha = abrirArquivo("./senha.txt",2)
		a.escrever_linha(senha	, arquivo_senha)
		a.fechar_arquivo(arquivo_senha)
		limpa()
		loading("",100)
		escreva("\n\nUsuário cadastrado com sucesso!")
		u.aguarde(2000)
		menuLogin()
	}
		
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11056; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */