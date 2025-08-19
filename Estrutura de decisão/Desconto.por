programa {
  funcao inicio() {
    //Se o valor da compra for de 0 até 100 vc dará 0% de desconto
    //Se for comprado acima de 100 reais até 200 reais vc dará ao cliente 5%
    //Se o cliente comprar acima de 200 reais até 300 reais vc dará 8% de desconto
    //Valores acima de 300 reais vc dará 10% de desconto
    //Se o usuário digitar um valor negativo vc exibirá uma mensagem de erro

    real compra 

    escreva("Insira o valor da compra: ")
    leia(compra)

    se(compra >= 0 e compra <= 100)
    escreva("Sua compra não tem desconto! ")

    senao se(compra > 100 e compra <= 200)
    escreva("Sua compra tem 5% de desconto! ")

    senao se(compra > 200 e compra <=300)
    escreva("Sua compra tem 8% de desconto! ")

    senao se(compra > 300)
    escreva("Sua compra tem 10% de desconto!")

    senao
    escreva("VALOR NEGATIVO!!!")

  }
}
