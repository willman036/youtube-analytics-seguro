programa
{
	
	funcao inicio()
	{
		real num
		inteiro positivos = 0, cont = 1

		escreva("Digite 6 números:\n")
		enquanto(cont <= 6) {
			escreva("Digite o ",cont, "º número: ")
			leia(num)
			se(num >= 0){
				positivos = positivos + 1	
			} 
			cont = cont + 1
		}
		escreva("Foram lidos ",positivos, " valores positivos!")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 181; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */