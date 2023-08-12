/*1) Uma clínica tem necessidade de informar o IMC (Índice de Massa Corporal) dos seus pacientes.
Sabendo que o IMC se calcula da seguinte forma: divide-se o peso (em kg) pelo quadrado da altura 
(em metros), crie um programa que faça o cálculo do IMC de um dado paciente.*/
programa { 
	funcao inicio () 
	{
	//variáveis
	real peso, altura, imc
	cadeia status

	//input
	escreva("Peso (em kg): ")leia(peso)
	escreva("Altura (em metros): ")leia(altura)

	//lógica
	imc = peso / (altura * altura)
	
	escreva("IMC: ", imc, "\nStatus: ")
	se(imc < 18.5){escreva("Abaixo do peso")}
	se(imc >=18.5 e imc <= 24.9){escreva("Peso ideal")}
	se(imc >=25 e imc <=29.9){escreva("Sobrepeso")}
	se(imc > 30){escreva("Obeso")}		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */