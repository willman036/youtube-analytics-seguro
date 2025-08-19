programa {
  funcao inicio() {
    
  cadeia categoria1, categoria2, categoria3

  escreva("Escreva se o animal é vertebrado ou invertebrado: ")
  leia(categoria1)

  se (categoria1 == "vertebrado")
  {
    escreva("Ele é ave ou mamífero? ")
    leia(categoria2)
    
    se (categoria2 == "ave")
    {
      escreva("Ela é carnívora ou onívora? ")
      leia(categoria3)

      se (categoria3 == "carnívora")
      {
        escreva("Ela é águia! ")
      }
      senao
      {
        escreva("Ela é uma pomba! ")
      }      
    }
    senao
    {
      escreva("Ele é onívoro ou herbívoro? ")
      leia(categoria3)

      se (categoria3 == "onívoro")
      {
        escreva("Ele é um humano! ")
      }

      senao
      {
        escreva("Ele é uma vaca! ")
      }


    }  
  }
  senao
  {
    escreva("Ele é inseto ou anelídeo? ")
    leia(categoria2)
    
    se (categoria2 == "inseto")
    {
      escreva("Ele é hematófago ou herbívoro? ")
      leia(categoria3)

      se (categoria3 == "hematófago")
      {
        escreva("Ela é pulga! ")
      }
      senao
      {
        escreva("Ela é uma lagarta! ")
      }      
    }
    senao
    {
      escreva("Ele é hematófago ou onívoro? ")
      leia(categoria3)

      se (categoria3 == "onívoro")
      {
        escreva("Ele é uma sanguessuga! ")
      }

      senao
      {
        escreva("Ele é uma minhoca! ")
      }


    }  
  }
  }
}
