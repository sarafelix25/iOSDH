import UIKit

class Formulario {
    
    var nome:String
    var cpf:String
    var telefone:Int
    var email:String
    
    init() {
        self.nome = ""
        self.cpf = ""
        self.telefone = 0
        self.email = ""
    }
}

let jessica = Formulario()

jessica.nome = "Jessica"
jessica.cpf = "0000000"
jessica.telefone = 93283982
jessica.email = "exemplo@gmail.com"

let adriano = Formulario()

adriano.nome = "Adriano"
adriano.cpf = "0000000"
adriano.telefone = 98349823948
adriano.email = "exemplo1@gmail.com"


class Animal {
    
    var patas:Int
    var isAlive:Bool
    var esqueleto: Bool
    
    init(patas: Int, isAlive:Bool, esqueleto: Bool) {
        self.patas = patas
        self.isAlive = isAlive
        self.esqueleto = esqueleto
    }
        
        func som() {
            print("som padrão animal")
        }
    }

    class Ave: Animal {
        
        var voa: Bool
        var asas: Bool
        var bico: Bool
        
        init(voa: Bool, asas:Bool, bico:Bool) {
            self.voa = voa
            self.bico = bico
            self.asas = asas
            super.init(patas: 4, isAlive: true, esqueleto: true)
        }
        
        override func som() {
            print("som do Bem-te-vi")
        }
    }

    let beijaflor = Ave(voa: true, asas: true, bico: true)

    print(beijaflor.patas)
    beijaflor.som()
