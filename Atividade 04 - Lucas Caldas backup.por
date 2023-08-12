programa{
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> txt
	inclua biblioteca Calendario --> cal
	inclua biblioteca Arquivos --> a
	inclua biblioteca Objetos --> obj
	inclua biblioteca Tipos --> tp

	// ========================= MENU ================================= //
	funcao func_menu(){
		//escolher opção
		inteiro opcao, i
		limpa()
		gerarTitulo("LISTA DE EXERCICIOS")
		escreva("\n Exercícios de 1 a 15")
		criarLinha()
		escreva("\n\nEscolha um exercício ou digite '0' para finalizar o programa (1 a 15):  ") leia(opcao)
		//opcao = 4 // DEBUG TESTAR EXERCICIOS SEM PASSAR PELO MENU
		escolha(opcao){
			caso 1: exercicio_1() pare
			caso 2: exercicio_2() pare
			caso 3: exercicio_3() pare
			caso 4: exercicio_4() pare
			caso 5: exercicio_5() pare
			caso 6: exercicio_6() pare
			caso 7: exercicio_7() pare
			caso 8: exercicio_8() pare
			caso 9: exercicio_9() pare
			caso 10: exercicio_10() pare
			caso 11: exercicio_11() pare
			caso 12: exercicio_12() pare
			caso 13: exercicio_13() pare
			caso 14: exercicio_14() pare
			caso 15: exercicio_15() pare
			caso 0: pare
			caso contrario: {
				escreva("\nOpção Inválida, favor escolher uma das opções acima. \n\nOPÇÂO: ")
				func_menu()
			}
		}
	}

	funcao retornar_menu(){
		caracter retornar	
		escreva("\n\n Exercício finalizado. Deseja realizar outro exercício? (S/N) ") leia(retornar)
		se (retornar == 's' ou retornar == 'S')	func_menu()
	}


// ================================== EXERCÍCIOS =========================================== //


	/*1) Faça um programa que receba a idade de 15 pessoas e que calcule e mostre:
	a) A quantidade de pessoas em cada faixa etária;
	b) A percentagem de pessoas na primeira e na última faixa etária, com relação ao total de
	pessoas:
	Até 15 anos
	De 16 a 30 anos
	De 31 a 45 anos
	De 46 a 60 anos
	Acima de 61 anos*/
	funcao exercicio_1() {
		limpa()
		gerarTitulo("EXERCICIO 1")
		escreva("1) Faça um programa que receba a idade de 15 pessoas e que calcule e mostre: \n")
		escreva("a) A quantidade de pessoas em cada faixa etária;\n")
		escreva("b) A percentagem de pessoas na primeira e na última faixa etária, com relação ao total de pessoas:\n\n")
		//vars
		inteiro n_pessoas, contador = 1 
		real grupo1 = 0, grupo2 = 0, grupo3 = 0, grupo4 = 0, grupo5 = 0
		escreva("Numero de Pessoas: ") leia(n_pessoas)
		//logica
		faca{
			inteiro idade = Util.sorteia(0, 85)
			se(idade <= 15) grupo1++
			senao se(idade <= 30) grupo2++
			senao se(idade <= 45) grupo3++
			senao se(idade <= 60) grupo4++
			senao grupo5++
			contador++
		} enquanto (contador <= n_pessoas)
		escreva("\nAté 15 anos: ", grupo1, " (", mat.arredondar(100*grupo1/n_pessoas,2) ,"%)")
		escreva("\nDe 16 a 30 anos: ", grupo2, " (", mat.arredondar(100*grupo2/n_pessoas,2) ,"%)")
		escreva("\nDe 31 a 45 anos: ", grupo3, " (", mat.arredondar(100*grupo3/n_pessoas,2) ,"%)")
		escreva("\nDe 46 a 60 anos: ", grupo4, " (", mat.arredondar(100*grupo4/n_pessoas,2) ,"%)")
		escreva("\nAcima de 61 anos: ", grupo5, " (", mat.arredondar(100*grupo5/n_pessoas,2) ,"%)")
		retornar_menu()
	}


	/*2) Faça um programa que verifique e mostre os números entre 1.000 e 2.000 (inclusive) que,
	quando divididos por 11 produzam resto igual a 2.*/
	funcao exercicio_2(){
		limpa()
		gerarTitulo("EXERCICIO 2")
		escreva("Faça um programa que verifique e mostre os números entre 1.000 e 2.000 (inclusive) que",
			   "\nquando divididos por 11 produzam resto igual a 2.\n\n")
		inteiro n_inicial, n_final, i
		escreva("Valor Inicial: ") leia(n_inicial)
		escreva("Valor Final: ")   leia(n_final)
		para(i = n_inicial; i <= n_final; i++){
			se (i % 11 == 2) escreva(i, "\n")
		}
		retornar_menu()
	}

	/*3) Faça um programa que leia três valores (A, B, C) e mostre-os na ordem lida. Em seguida,
	mostre-os em ordem crescente e decrescente.*/
	funcao exercicio_3() {
		limpa()
		gerarTitulo("EXERCICIO 3")
		escreva(" Faça um programa que leia três valores (A, B, C) e mostre-os na ordem lida.",
			   "\nEm seguida, mostre-os em ordem crescente e decrescente.\n\n")
		inteiro i//, tamanho, copia
		//escreva("Qual é o tamanho do seu vetor? (máx: 999) ") leia(tamanho)
		inteiro vNum[10] 
		para (i = 0; i < 10; i++) vNum[i] = Util.sorteia(1,100)
		//ler valores
		escreva("Numeros Sorteados: ")
		para (i = 0; i < 10; i++) escreva(vNum[i], " ")
		// crescente
		ordena(vNum)
		escreva("\nCrescente: ")
		para (i = 0; i < 10; i++) escreva(vNum[i], " ")
		//decrescente
		ordena_dec(vNum)
		escreva("\nDecrescente: ")
		para (i = 0; i < 10; i++) escreva(vNum[i], " ")
		retornar_menu()
	}

	/* 4) Uma loja tem tem uma política de descontos de acordo com o valor da compra do cliente. 
	Os descontos começam acima dos R$500. A cada 100 reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%.
	Faça um programa que exiba essa tabela de descontos no seguinte formato: Valordacompra – porcentagem de desconto – valor final
	O total da compra deverá ser armazenado num vetor e a apresentação das compras realizadas
	e seus descontos, deve ser a partir desse vetor.*/
	funcao exercicio_4() {
		limpa()
		gerarTitulo("EXERCICIO 4")
		escreva("Uma loja tem tem uma política de descontos.",
		"\nA cada 100 reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%.",
		"\nFaça um programa que exiba essa tabela de descontos no seguinte formato:", 
		"\nValordacompra – porcentagem de desconto – valor final")		
		real v_inicial, valor_compra, total
		real v_base[25], v_desconto[25], v_final[25] 
		inteiro i
		real desconto = 0.00
		gerarTitulo("			TABELA DE DESCONTOS")
		escreva("  VALOR GASTO		  DESCONTO	  	  VALOR FINAL")
		criarLinha()
		para(i = 0; i < 25;i++){
			se (i == 0) {
				v_base[i] = 500
				v_desconto[i] = 1
				v_final[i] = (v_base[i] - v_base[i]*(v_desconto[i]/100))
			}
			senao {
				v_base[i] = v_base[i-1] + 100
				v_desconto[i] = v_desconto[i-1] + 1
				v_final[i] = (v_base[i] - v_base[i]*(v_desconto[i]/100)) 
			}
			cadeia texto
			texto = "Valor Gasto: R$" + v_base[i]
			escreva(texto)
			criarEspacamento(txt.numero_caracteres(texto),23)
			texto = "Desconto: " + v_desconto[i] + "%"
			escreva(texto)
			criarEspacamento(txt.numero_caracteres(texto),20)
			texto = "Valor Final: R$" + v_final[i] + "\n"
			escreva(texto)
			//escreva("Valor Gasto: R$", v_base[i]," Desconto: ", v_desconto[i], "% Valor Final: R$", v_final[i], "\n")
			
		}
		faca{
		escreva("\nDIGITE O VALOR A SER GASTO --> R$") leia(valor_compra)
		se (valor_compra >= 500) {
			para(i = 0; i < 25;i++) {
				se (valor_compra >= v_base[i]){
					desconto = v_desconto[i]
				}	
			}
			escreva("Valor da Total = R$", valor_compra, " - ", desconto, "% = R$", (valor_compra - valor_compra*(desconto/100)))
		}
		senao escreva("Valor da Total = R$", valor_compra, " - ", "0% = R$", (valor_compra - valor_compra*(0/100)))
		}enquanto(valor_compra != 0)
		retornar_menu()
	}

	/* 5) Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado
	daquele tamanho com asteriscos. Seu programa deve usar laços de repetição e funcionar para
	quadrados com lados de todos os tamanhos entre 1 e 20.*/
	funcao exercicio_5(){
		limpa()
		gerarTitulo("EXERCICIO 5")
		escreva("Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado com asteristicos.")
		inteiro eixo_y, eixo_x, tamanho//largura do quadrado
		escreva("\n\nTamanho do quadrado: ") leia(tamanho)
		escreva("\n")
		para (eixo_y = 1; eixo_y <= tamanho; eixo_y++) {
			para (eixo_x = 1; eixo_x <= tamanho; eixo_x++) {escreva("* ")}
			escreva("\n")
		}
		retornar_menu()
	}

	/* 6) Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado
	daquele tamanho com asteriscos e espaços em branco. Seu programa deve funcionar para
	quadrados com lados de todos os tamanhos entre 1 e 20.*/
	funcao exercicio_6(){
		limpa()
		gerarTitulo("EXERCICIO 6")
		escreva("Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado vazio com asteristicos.")
		inteiro eixo_y, eixo_x, tamanho//largura do quadrado
		escreva("\n\nTamanho do quadrado: ") leia(tamanho)
		escreva("\n")
		para (eixo_y = 1; eixo_y <= tamanho; eixo_y++) {
			//bordas inferiores e superiores do quadrado
			se (eixo_y == 1 ou eixo_y == tamanho){
				para (eixo_x = 1; eixo_x <= tamanho; eixo_x++) {escreva("* ")}	 
				escreva("\n")
			}
			//valores laterais
			senao {
				para (eixo_x = 1; eixo_x <= tamanho; eixo_x++) {
					se (eixo_x == 1 ou eixo_x == tamanho) {
						escreva("* ")
					}
					senao {escreva("  ")}
				}
				escreva("\n")				
			}
		}
		retornar_menu()
	}

	/* 7) Faça um programa que recebe a altura de um triangulo em um número inteiro e imprima-o
	utilizando asteriscos. */
	funcao exercicio_7(){
		limpa()
		gerarTitulo("EXERCICIO 7")
		escreva("Faça um programa que recebe a altura de um triangulo em um número inteiro e ",
		"\nimprima-o utilizando asteriscos.")
		criarLinha()
		inteiro eixo_x, eixo_y, n_espaco, n_base, n_folhas, input
		caracter caracter_input
		
		//input
		escreva("\nQual é o tamanho do seu triângulo?: ")				leia(input)
		escreva("Escolha o caracter do seu triangulo (ex: @): ")		leia(caracter_input)
		escreva("Triangulo com ", input, " linhas.\n\n")

		//valores iniciais
		n_espaco = input - 1   //espaço triangulo
		n_folhas = 1 				//somatório por andar da árvore

		//printar triangulo
		para (eixo_y = 1; eixo_y < (input + 1); eixo_y++){	
			//printar espaco em branco
			para (eixo_x = 1; eixo_x < n_espaco+1; eixo_x++) escreva(" ") // espaço até a arvore
			//printar as folhas
			para (eixo_x = 1; eixo_x < n_folhas+1; eixo_x++) escreva(caracter_input) // folhas
			//atualizar valores das variáveis
			n_folhas = n_folhas + 2
			n_espaco = n_espaco - 1
			escreva("\n")
		}
		retornar_menu()
	}

	/*8) Faça um programa que peça um número inteiro e determine se ele é ou não um número
	primo. Um número primo é aquele que é divisível somente por ele mesmo e por 1.*/
	funcao exercicio_8(){
		limpa()
		gerarTitulo("EXERCICIO 8")
		escreva("Faça um programa que peça um número inteiro e determine se ele é ou não um número primo.",
			   "\nUm número primo é aquele que é divisível somente por ele mesmo e por 1.")
		criarLinha()
		inteiro primo, i = 1, divisores = 0
		escreva("Digite um valor: ")	leia(primo)
		enquanto (primo <= 0) escreva("Numero Nulo ou Negativo!")
		se (primo > 0){
			escreva("Divisível por: ")
			enquanto (i <= primo){
				se(primo % i == 0){
					divisores++
					escreva(i, " ")
				}
				i++
			}
			escreva("\nNumero de divisores: ", divisores)
			se (divisores == 2) escreva("\n\nO Numero é Primo!")
			senao escreva("\n\nO numero não é primo")
		}
		retornar_menu()	
	}

	/*9) Faça um programa que peça o nome de 10 pessoas e a sua idade.
		Armazene os nomes num vetor e a idade em outro vetor.
		Crie um laço para fazer essas soliciações.
		Crie um menu que permita ao usuário deicidir se quer incluir, alterar ou excluir os dados dos vetores.
		A edição somente será permitida se o nome não estiver vazio. Nesse caso, deverá efetuar a inclusão.
		Crie um menu para organizar as funções.
	*/
	funcao exercicio_9(){
		limpa()
		gerarTitulo("EXERCICIO 9")
		//vetores
		cadeia vNome[10]
		inteiro vId[10], vIdade[10]
		menu_exercicio9(vId,vNome,vIdade)
		retornar_menu()
	}
	
	/* 10 )Crie um algoritmo que peça ao usuário que informe oito números inteiros e osarmazene-os em umvetor. 
	Apresente o maior elemento e a posição em que ele se encontra no vetor*/
	funcao exercicio_10(){
		limpa()
		gerarTitulo("EXERCICIO 10")
		escreva("Crie um algoritmo que peça ao usuário que informe 10 números inteiros,",
				"\nApresente o maior elemento e a posição em que ele se encontra no vetor")
		criarLinha()
		u.aguarde(1500)
		limpa()
		inteiro vNum[8], i, j, maior_numero = -100
		para (i = 0; i <8; i++) {vNum[i] = Util.sorteia(-99,99)}
		para (i = 0; i < 8; i++){
			para (j = 0; j <8; j++) {escreva(vNum[j], " ")}
			maior_numero = mat.maior_numero(maior_numero, vNum[i])
			escreva("\n", maior_numero, " vs ", vNum[i])
			escreva("\nMaior Numero: ", maior_numero)
			Util.aguarde(250)
			limpa()
		}
		para (i = 0; i <8; i++){escreva(vNum[i], " ")}
		para (i = 0; i <8; i++){ se(maior_numero == vNum[i]){escreva("\nPosição: ",i,"  Vetor:[",i-1,"]")}}
		escreva("\nMaior Numero: ", maior_numero)
		retornar_menu()	
	}

	funcao exercicio_11(){
		limpa()
		gerarTitulo("EXERCICIO 11")
		escreva("Crie um algoritmo que peça ao usuário que informe oito números inteiros,",
				"\n armazene-os em um vetor e apresente a soma de todos os valores\n")
		criarLinha()
		inteiro vNum[10], i, j, somatorio = 0
		para (i = 0; i <10; i++) {
			vNum[i] = Util.sorteia(0,99)
			somatorio = somatorio + vNum[i]
			escreva("Somatório: ", somatorio, " + ", vNum[i])
			Util.aguarde(250)
			limpa()
		}
		escreva("Vetores: ")
		para (i = 0; i <10; i++) {escreva(vNum[i], " ")}
		escreva("\nSomatório: ", somatorio)
		retornar_menu()	
	}

	funcao exercicio_12(){
		limpa()
		gerarTitulo("EXERCICIO 12")
		escreva("Faça um algoritmo que leia e mostre um vetor de 10 números inteiros.",
		"\nA seguir, peça ao usuário para informar um valor inteiro e positivo", 
		"\ne mostre todos os números do vetor que são divisíveis por esse número\n\n Vetores Sorteados: ")
		inteiro vNum[10], i, j, divisor
		para (i = 0; i <10; i++) {vNum[i] = Util.sorteia(0,99)}
		para (i = 0; i <10; i++) {escreva(vNum[i], " ")}
		escreva("\n\nInforme um valor inteiro e positivo para dividir os vetores: ") leia(divisor)
		escreva("\nValores Divisíveis: ")
		para (i = 0; i <10; i++) {se(vNum[i] % divisor == 0) escreva(vNum[i], " ")}
		retornar_menu()
	}

	funcao exercicio_13(){
		limpa()
		gerarTitulo("EXERCICIO 13")
		inteiro vNum[5], i, j, somatorio = 0
		para (i = 0; i < 5; i++) {vNum[i] = Util.sorteia(0,99)}
		para (i = 0; i <5; i++) {escreva(vNum[i], " ")}
		para (i = 0; i <5; i++) {troca(vNum, i, i+1)}
		retornar_menu()
	} 

	funcao exercicio_14(){
		limpa()
		gerarTitulo("EXERCICIO 14")
		escreva("Crie um algoritmo que peça ao usuário que informe 10 números inteiros e armazene-os em um vetor.\n",
		"A seguir, apresente a multiplicação de todos os elementos pares e a soma de todos os elementos ímpares")
		criarLinha()
		escreva("\nVetores Sorteados: ")
		inteiro vNum[10], i, j, somatorio = 0, multiplicacao = 1
		para (i = 0; i <10; i++) {vNum[i] = Util.sorteia(1,99)}
		para (i = 0; i <10; i++) {escreva(vNum[i], " ")}
		// multiplicar negativos
		para (i = 0; i <10; i++) {
			se (vNum[i] % 2 == 1){
				somatorio = somatorio + vNum[i]
			}
			senao{multiplicacao = multiplicacao * vNum[i]}
		}
		escreva("\nSomatorio: ", somatorio, "\nMultiplicacao: ", multiplicacao)
		retornar_menu()
	} 

	funcao exercicio_15(){
		limpa()
		gerarTitulo("EXERCICIO 15")
		escreva("Escreva um algoritmo que solicite ao usuário a entrada de 5 números, e que exiba o somatório desses números\n",
			  "Após exibir a soma, o programa deve mostrar também os números que o usuário digitou, um por linha")
		criarLinha()
		inteiro vNum[5], i, j, somatorio = 0
		para (i = 0; i <5; i++) {vNum[i] = Util.sorteia(0,99)}
		para (i = 0; i <5; i++) {somatorio = somatorio + vNum[i]}
		escreva("Somatorio: ", somatorio, "\n----\n")
		para (i = 0; i <5; i++) {escreva(vNum[i], "\n")}
		
		retornar_menu()
	} 

// ================================== OPERAÇÕES MATEMÁTICAS =========================================== //

	// Ordena o vetor em ordem crescente.
	funcao ordena (inteiro v[]){
		para (inteiro i = 0; i < 10; i++){
			para (inteiro j = 0; j < 10 - 1; j++){
				se (v [j] > v[j+1]){troca(v, j, j+1)}
			}
		}
	}
	// Ordena o vetor em ordem decrescente.
	funcao ordena_dec (inteiro v[]){
		para (inteiro i = 0; i < 10; i++){
			para (inteiro j = 0; j < 10 - 1; j++){
				se (v [j] < v[j+1]){troca(v, j, j+1)}
			}
		}
	}
	//troca vetores de posição
	funcao troca (inteiro v[], inteiro a, inteiro b){
		inteiro c = v[a]
		v[a] = v[b]
		v[b] = c
	}

	// ================================== FUNÇÕES EXERCÍCIO 9 =========================================== //	

	funcao menu_exercicio9(inteiro vId[], cadeia vNome[], inteiro vIdade[]){
		inteiro opcao, i
		para (i = 0; i < 10; i++){vId[i] = i+1}
		escreva("--------------------------\n") 
		escreva("O Cadastro de Pessoas\n")
		escreva("--------------------------\n")
		para (i = 0; i < 10; i++){escreva("ID: ", vId[i], "\t| Nome: ", vNome[i], "\t| Idade: ", vIdade[i],"\n")}
		escreva("--------------------------\n")
		escreva(" 1. Verificar Valores (EXCLUIR PERDEU A UTILIDADE) \n 2. Incluir\n 3. Alterar\n 4. Excluir\n 5. Finalizar Programa\n")
		escreva("--------------------------\n")
		escreva("OPÇÂO: ") leia(opcao)
		escolha(opcao){
			caso 1: verificar_registro	(vId,vNome,vIdade) 		pare
			caso 2: incluir_registro		(vId,vNome,vIdade) 		pare
			caso 3: alterar_registro		(vId,vNome,vIdade) 		pare
			caso 4: remover_registro		(vId,vNome,vIdade) 		pare
			caso 5: pare
			caso contrario:
			escreva("\nOpção Inválida, favor escolher uma das opções acima. \n\nOPÇÂO: ")
		}
	}
	
	funcao verificar_registro(inteiro vId[], cadeia vNome[], inteiro vIdade[]){
		inteiro i
		limpa()/*
		escreva("--------------------------\n") 
		escreva("Verificar Registros\n")
		escreva("--------------------------\n")
		para (i = 0; i < 10; i++){escreva("ID:\t", vId[i], " |\tNome: ", vNome[i], " |\tIdade: ", vIdade[i],"\n")}*/
		menu_exercicio9(vId,vNome,vIdade)
	}
	funcao incluir_registro(inteiro vId[], cadeia vNome[], inteiro vIdade[]){
		inteiro i, indice, nova_idade
		cadeia novo_nome
		limpa()
		escreva("--------------------------\n") 
		escreva("Novo Registro\n")
		escreva("--------------------------\n")
		para (i = 0; i < 10; i++){
			se (vIdade[i] == 0){
				escreva("ID Selecionado: ", vId[i])
				escreva("\nNovo Nome: ") leia(novo_nome)
				escreva("Nova Idade: ") leia(nova_idade)
				vNome[i] = novo_nome
				vIdade[i] = nova_idade
				limpa()
				escreva("Novo Valor Registrado com sucesso!\n")
				escreva("--------------------------\n")
				//para (i = 0; i < 10; i++){escreva("ID: ", vId[i], "\t| Nome: ", vNome[i], "\t| Idade: ", vIdade[i],"\n")}
				u.aguarde(1000)
				
				limpa()
				menu_exercicio9(vId,vNome,vIdade)
			}
		}
	}
		
	funcao alterar_registro(inteiro vId[], cadeia vNome[], inteiro vIdade[]){
		inteiro i, j, indice, nova_idade
		cadeia novo_nome
		limpa()
		escreva("--------------------------\n") 
		escreva("Alterar Registro\n")
		escreva("--------------------------\n")
		para (i = 0; i < 10; i++){escreva("ID: ", vId[i], "\t| Nome: ", vNome[i], "\t| Idade: ", vIdade[i],"\n")}
		escreva("\nQual Valor deseja alterar: ") leia(indice)
		para (j = 0; j < 10; j++){
			se (indice - 1 == j){
				escreva("ID: ", vId[i], "| Nome: ", vNome[i], "| Idade: ", vIdade[i])
				escreva("\nNovo Nome: ") leia(novo_nome)
				escreva("Nova Idade: ") leia(nova_idade)
				vNome[i] = novo_nome
				vIdade[i] = nova_idade
				limpa()
				escreva("Valores Registrados com sucesso!\n")
				menu_exercicio9(vId,vNome,vIdade)
			}
		}
	}
	
	funcao remover_registro(inteiro vId[], cadeia vNome[], inteiro vIdade[]){
		inteiro indice, i
		logico  apagar
		limpa()
		para (i = 0; i < 10; i++){escreva("ID: ", vId[i], "\t| Nome: ", vNome[i], "\t| Idade: ", vIdade[i],"\n")}
		escreva("Escreva o indice do registro que deseja apagar: ") leia(indice)
		para (i = 0; i < 10;i++){
			se (indice - 1 == i){
				escreva("ID: ", vId[i], "| Nome: ", vNome[i], "| Idade: ", vIdade[i])
				escreva("\nDigite 'verdadeiro' se realmente deseja apagar o registro: ") leia(apagar)
				se (apagar == verdadeiro){
					vNome[i] = ""
					vIdade[i] = 0
					limpa()
					escreva("Registro apagado com sucesso!\n")
				}
			}
			limpa()
			escreva("Nenhum registro apagado\n")
			menu_exercicio9(vId,vNome,vIdade)
		}
	}

	// ================================== Tratamento de dados =========================================== //	

	funcao gerarTitulo(cadeia titulo){
		criarLinha()
		escreva("     ", titulo)
		criarLinha() 
	}

	//calcula o espaçamento necessário para alinha o output entre duas linhas
	funcao inteiro criarEspacamento(inteiro texto, inteiro espaco){
		inteiro j, x //espaco necessario
		x = espaco - texto
		para(j = 1; j <= x; j++){escreva(" ")}
		retorne x
	}

	funcao criarLinha(){
		escreva("\n--------------------------------------------------------------------------------\n")
	}
	
	// ================================== MAIN =========================================== //
	//main
	funcao inicio()
	{
		func_menu()
	}
	
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 15232; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */