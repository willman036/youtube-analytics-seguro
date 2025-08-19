programa {
  funcao inicio() {
    
    inteiro num1, num2

    escreva("Digite o primeiro número: ")
    leia(num1)

    escreva("Digite o segundo número: ")
    leia(num2)

    se (num1 % num2 == 0 ou num2 % num1 == 0)
    {escreva("Sao multiplos! ")
    
    }

    senao
    {
      escreva("Nao sao multiplos!")
    }

  }
}
