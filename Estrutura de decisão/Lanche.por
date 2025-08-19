programa {
  funcao inicio() {
    
  inteiro codigo, qtd
  real preco

  escreva("Insira o código do produto: ")
  leia(codigo)

  escreva("Insira a quantidade: ")
  leia(qtd)

  se(codigo == 1)
  preco = qtd*4

  se(codigo == 2)
  preco = qtd*4.50

  se(codigo == 3)
  preco = qtd*5

  se(codigo == 4)
  preco = qtd*2

  se(codigo == 5)
  preco = qtd*1.50

  escreva("Preço final: ", preco)


  }
}
