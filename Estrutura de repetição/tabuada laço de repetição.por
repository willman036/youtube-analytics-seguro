programa
{
	
	funcao inicio()
	{
		inteiro num, cont = 1 
		
		escreva("Digite um número: ")
		leia(num)
		
		enquanto(cont <= 100) {
			escreva(cont, " X ",num, " = ",cont * num,"\n")
			//Atualizando variável contadora
			cont = cont + 1
		}
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 239; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */