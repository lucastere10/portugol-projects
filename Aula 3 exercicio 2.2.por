/*Exercícios com laço enquanto:
2) Faça um programa que peça uma nota, entre zero e dez. Mostre uma mensagem caso o valor seja inválido
e continue pedindo até que o usuário informe um valor válido.*/
programa{
	funcao inicio() {
		real nota
	   	faca {
		     escreva("Digite uma nota entre 0 e 10: ") leia(nota)
		     se (nota < 0 ou nota > 10) escreva("Valor inválido. \n\n")
	     } enquanto (nota < 0 ou nota > 10) escreva("Nota válida: ", nota)
}}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 453; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */