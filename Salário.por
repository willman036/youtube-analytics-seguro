programa {
  funcao inicio() {
    
    inteiro nf
    real ht, vh, sf

    escreva("Digite o número do funcionário: ")
    leia(nf)
    
    escreva("Digite o número de horas trabalhadas: ")
    leia(ht)

    escreva("Digite o valor da hora trabalhada: ")
    leia(vh)

    sf = ht*vh

    escreva("O salário do funcionário é: R$", sf)
  }
}
