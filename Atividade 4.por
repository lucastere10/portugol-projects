programa
{
	inclua biblioteca Matematica -->mat
	inclua biblioteca Util
	//LUCAS CALDAS
	//=================================== MENU ==================================================
	funcao func_menu(){
		inteiro opcao
		escreva("Exercicio: ") leia(opcao)
		escolha(opcao){
			//caso 1: exercicio_1() pare
			//caso 2: exercicio_2() pare
			//caso 3: exercicio_3() pare
			caso 4: exercicio_4() pare
			caso 5: exercicio_5() pare
			caso 6: exercicio_6() pare
			//caso 7: exercicio_7() pare
			caso 8: exercicio_8() pare
			//caso 9: exercicio_9() pare
			caso 10: exercicio_10() pare
			caso 11: exercicio_11() pare
			caso 12: exercicio_12() pare
			//caso 13: exercicio_13() pare
			caso 14: exercicio_14() pare
			caso 15: exercicio_15() pare
			caso 0: pare
			caso contrario: {
				escreva("\nOpção Inválida, favor escolher uma das opções validas. \n\nOPÇÂO: ")
				func_menu()
			}
		}
	}
	


	
	/* 4) Uma loja tem tem uma política de descontos de acordo com o valor da compra do cliente. 
	Os descontos começam acima dos R$500. A cada 100 reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%.
	Faça um programa que exiba essa tabela de descontos no seguinte formato: Valordacompra – porcentagem de desconto – valor final
	O total da compra deverá ser armazenado num vetor e a apresentação das compras realizadas
	e seus descontos, deve ser a partir desse vetor.*/
	funcao exercicio_4() {
		limpa()
		escreva("Uma loja tem tem uma política de descontos. A cada 100 reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%. \n")
		escreva("Faça um programa que exiba essa tabela de descontos no seguinte formato: Valordacompra – porcentagem de desconto – valor final")		
		real v_inicial, valor_compra, total
		real v_base[25], v_desconto[25], v_final[25] 
		inteiro i
		real desconto = 0.00
		escreva("			TABELA DE DESCONTOS\n")
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
			texto = "Desconto: " + v_desconto[i] + "%"
			escreva(texto)
			texto = "Valor Final: R$" + v_final[i] + "\n"
			escreva(texto)
			//escreva("Valor Gasto: R$", v_base[i]," Desconto: ", v_desconto[i], "% Valor Final: R$", v_final[i], "\n")	
		}
		faca{
			escreva("\nDigite o valor a ser gasto: R$") leia(valor_compra)
			se (valor_compra >= 500) {
				para(i = 0; i < 25;i++) {
					se (valor_compra >= v_base[i]) {desconto = v_desconto[i]}	
				}
				escreva("Valor da Total = R$", valor_compra, " - ", desconto, "% = R$", (valor_compra - valor_compra*(desconto/100)))
			}
			senao escreva("Valor da Total = R$", valor_compra, " - ", "0% = R$", (valor_compra - valor_compra*(0/100)))
		}enquanto(valor_compra != 0)
	}

	/* 5) Escreva um programa que lê o tamanho do lado de um quadrado e imprime um quadrado
	daquele tamanho com asteriscos. Seu programa deve usar laços de repetição e funcionar para
	quadrados com lados de todos os tamanhos entre 1 e 20.*/
	funcao exercicio_5(){
		limpa()
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
	}

	/*8) Faça um programa que peça um número inteiro e determine se ele é ou não um número
	primo. Um número primo é aquele que é divisível somente por ele mesmo e por 1.*/
	funcao exercicio_8(){
		limpa()
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
	}

	
	/* 10 )Crie um algoritmo que peça ao usuário que informe oito números inteiros e osarmazene-os em umvetor. 
	Apresente o maior elemento e a posição em que ele se encontra no vetor*/
	funcao exercicio_10(){
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
		limpa()
		para (i = 0; i <8; i++) {escreva(vNum[i], " ")}
		escreva("\nMaior Numero: ", maior_numero)
		retornar_menu()	
	}

	funcao exercicio_11(){
		limpa()
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
		inteiro vNum[10], i, j, divisor
		para (i = 0; i <10; i++) {vNum[i] = Util.sorteia(0,99)}
		para (i = 0; i <10; i++) {escreva(vNum[i], " ")}
		escreva("\n\nInforme um valor inteiro e positivo para dividir os vetores: ") leia(divisor)
		escreva("\nValores Divisíveis: ")
		para (i = 0; i <10; i++) {se(vNum[i] % divisor == 0) escreva(vNum[i], " ")}
		retornar_menu()
	}

	funcao exercicio_14(){
		limpa()

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
		inteiro vNum[5], i, j, somatorio = 0
		para (i = 0; i <5; i++) {vNum[i] = Util.sorteia(0,99)}
		para (i = 0; i <5; i++) {somatorio = somatorio + vNum[i]}
		para (i = 0; i <5; i++) {escreva(vNum[i], "\n")}
		escreva("Somatorio: ", somatorio)
		
		retornar_menu()
	} 

	//=============================================== outros exercicios =================================================================

	funcao retornar_menu(){
		escreva("\n\n Exercício finalizado. Retornando ao menu...") 
		Util.aguarde(3000)
		func_menu()
	}

	funcao criarLinha(){
		escreva("\n--------------------------------------------------------------------------------\n")
	}

	//=============================================== main =================================================================
	
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
 * @POSICAO-CURSOR = 76; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */