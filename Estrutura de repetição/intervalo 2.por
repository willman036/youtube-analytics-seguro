programa
{
	
	funcao inicio()
	{
		inteiro N, X, in = 0, out = 0

		 escreva("Digite quantos casos de teste voce vai querer executar: ")
		 leia(N)

		 enquanto(N > 0) {
		 escreva("Digite o valor de X: ")
		 leia(X)

		 	se(X >= 10 e X <= 20) {

		 		in += 1
		 	} senao{
		 	   out += 1
		 	}
		 	N -= 1
		 }

		 escreva(in, " valores dentro do intervalo\n")
		 escreva(out, " valores fora do intervalo\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 413; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */