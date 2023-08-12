programa
{	

	// PROVA 01 - EXERCICIO 10 - PORTUGOL - LUCAS MEDEIROS CALDAS - lucas.m.caldas@aluno.senai.br

	// O Erro está na condição do segundo laço, (i<=i), que faz com que o programa entre em loop.
	// Para consertar, apenas troque a condição (i<=i) para (j<=i). :)
	
	funcao inicio()
	{
		inteiro numero
		inteiro i=0, j=0
		escreva("\nInforme um numero: ")
		leia(numero)
		para(i = 1; i<=numero; i++){
			escreva("\n")
			para(j=1;j<=i;j++){   // TROCAR (i<=i) para (j<=i)
				escreva(j)
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 481; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */