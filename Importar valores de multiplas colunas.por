programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Arquivos --> a
	inclua biblioteca Objetos --> obj
	inclua biblioteca Tipos --> tp

	const cadeia vProdutos[2][3] = {
		{"","",""} ,	{"","",""}
		}
		
	funcao inicio()
	{
		novo_registro()
	}

	funcao novo_registro(){
		//arquivo
		cadeia caminho_do_arquivo = "./produtos.txt"
		inteiro arquivo_usuario = a.abrir_arquivo(caminho_do_arquivo, a.MODO_ACRESCENTAR)

		//dados
		cadeia produto, produto_nome, produto_codigo
		cadeia produto_preco, espacamento
		limpa()
		escreva("-------- NOVO PRODUTO --------")
		escreva("\nNome do Produto: ") 		leia(produto_nome)
		escreva("Código do Produto: ") 	     leia(produto_codigo)
		escreva("Preco do Produto: ") 		leia(produto_preco)
		espacamento = criarEspacamento(txt.numero_caracteres(produto_nome),23)
		produto = produto_nome +
		escreva("\n\n", produto)
		a.escrever_linha(produto, arquivo_usuario)
		//limpa()			
		escreva("\nUsuário cadastrado com sucesso!\n\n")
		a.fechar_arquivo(arquivo_usuario)
	}

	
	
	//calcula o espaçamento necessário para alinha o output entre duas linhas
	funcao inteiro criarEspacamento(inteiro texto, inteiro espaco){
		inteiro j, x //espaco necessario
		cadeia espaco = ""
		x = espaco - texto
		para(j = 1; j <= x; j++){
			espaco = espaco + " "
			}
		retorne x
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 977; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */