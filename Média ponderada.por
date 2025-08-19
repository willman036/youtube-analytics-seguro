programa {
  funcao inicio() {
    
    real A, B, media

    escreva("Informe a primeira nota: ")
    leia(A)

    escreva("Informe a segunda nota: ")
    leia(B)

    //A média ponderada é igual a soma dos valores vezes os pesos dividido pela soma dos pesos 
    media = (A*3.5+B*7.5)/11

    escreva("A média é igual a:", media)

  }
}
