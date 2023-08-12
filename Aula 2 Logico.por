programa
{
	logico teste = verdadeiro
	funcao inicio()
	{
		//teste = nao teste
		//escreva("Condicao = ", teste)

		/*logico Av = verdadeiro, Bv = verdadeiro, Result = falso
		logico Af = falso, Bf = falso

		inteiro num1 = 20, num2 = 10

		Result = Av e Bv
		Result = Av e Af
		Result = Bf e Af
		Result = Af e Av
		
		Result = Av e Bv
		Result = Af e Bv
		Result = Af e Bf
		Result = Av e Af
		
		escreva("Condicao = ", Result)*/

		/*inteiro numero1, numero2, numero3
		numero1 = 99
		numero2 = 5
		numero3 = 10
		
		//menor
		se(numero1 < numero2 e numero1 < numero3) {
			escreva("Numero 1 é menor")
		} 
		senao{
			se(numero2 < numero3) { 
				escreva("Numero 2 é menor")
			} senao
			escreva ("Numero 3 é menor")
		}

		escreva("\n")
		
		//maior
		se(numero1 > numero2 e numero1 > numero3) {
			escreva("Numero 1 é maior")
		} 
		senao{
			se(numero2 > numero3) { 
				escreva("Numero 2 é maior")
			} senao
			escreva ("Numero 3 é maior")
		}*/

		// 4 notas, aprovado, rec ou aprovado

		cadeia aluno
		real nota1, nota2, nota3, nota4, media, notaCorte, notaReprovacao

		//inputs
		escreva("Nome do aluno: ")			leia(aluno)
		escreva("Digite a primeira nota: ")	leia(nota1)
		escreva("Digite a segunda nota: ")		leia(nota2)
		escreva("Digite a terceira nota: ")	leia(nota3)
		escreva("Digite a quarta nota: ")		leia(nota4)

		// calculo media 
		media = (nota1 + nota2 + nota3 + nota4) / 4

		//notas de corte
		escreva("\n\nQual é a nota de aprovação: ")	leia(notaCorte)
		escreva("Qual é a nota de recuperação: ")	leia(notaReprovacao)

		//logica
		se (media >= notaCorte){
		 	escreva("Parabéns ", aluno, "!\nVocê foi aprovado com a média ", media)
		}
		se (media >= notaReprovacao){
			escreva("Voce está de recuperação, ", aluno, ".\nMédia: ", media)		
		}
		senao{
			escreva(aluno, ", você foi reprovado com média: ", media)
		}
		
		escreva("\n")
		
	 }		
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1673; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */