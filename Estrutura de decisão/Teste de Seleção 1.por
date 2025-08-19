programa {
  funcao inicio() {
    //Leia 4 valores inteiros A, B, C e D.
    //A seguir, se B for maior do que C 
    //e se D for maior do que A, 
    //e a soma de C com D for maior que a soma de A e B 
    //e se C e D, ambos, forem positivos 
    //e se a variável A for par escrever
    //a mensagem "Valores aceitos", senão escrever "Valores nao aceitos".

    inteiro A, B, C, D 

    escreva("O valor A é: ")
    leia(A)

    escreva("O valor B é: ")
    leia(B)

    escreva("O valor C é: ")
    leia(C)

    escreva("O valor D é: ")
    leia(D)

    se(B>C e D>A e (C+D>A+B) e C>0 e D>0 e A%2 == 0)
    escreva("Valores aceitos! ")
    senao 
    escreva("Valores não aceitos! ") 

  }
}
