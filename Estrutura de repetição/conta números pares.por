programa
{
	
	funcao inicio()
	{
		inteiro num, cont = 1, num_pares = 0

		enquanto(cont <= 5) {
			
		escreva("Digite o primeiro valor: ")
		leia(num)

		se (num %2 == 0) {

			num_pares += 1
		}
		cont +=1

		
		
		}

		escreva("Foram lidos ", num_pares, " valores pares")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 264; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */