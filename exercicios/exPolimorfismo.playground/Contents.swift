import UIKit

class Gato {
    var nome: String // Escopo Global
    var cor: String
    var soltaPelo: Bool
    
    init(nome: String, cor: String, soltaPelo: Bool) { // Escopo Local
        self.nome = nome
        self.cor = cor
        self.soltaPelo = soltaPelo
    } // Escopo da função
    
    func miar() -> String {
        return "Miaaaaau"
    }
    
    func comerPeixe() {
        print("Devorando um peixe")
    }
}

var adamastor: Gato = Gato(nome: "Adamastor", cor: "Preto", soltaPelo: true)

//adamastor.miar()
//adamastor.comerPeixe()

class Vaca {
    var nome: String
    var cor: String
    var litrosDeLeitePorDia: Int
    
    init(nome: String, cor: String, litrosDeLeitePorDia: Int) {
        self.nome = nome
        self.cor = cor
        self.litrosDeLeitePorDia = litrosDeLeitePorDia
    }
    
    func mugir() -> String {
        return "Muu"
    }
    
    func comerCapim() {
        print("Hmmm que capim gostoso! ")
    }
}

var mimosa: Vaca = Vaca(nome: "Mimosa", cor: "Marrom", litrosDeLeitePorDia: 3)

//mimosa.mugir()
//mimosa.comerCapim()

// ----------------------------------------------------------------------------------


class Animal {
    var nome: String
    var cor: String
    var temAsas: Bool
    
    init(nome: String, cor: String, temAsas: Bool) {
        self.nome = nome
        self.cor = cor
        self.temAsas = temAsas
    }
    
    func emitirSom() -> String {
        return "O animal está emitindo um som"
    }
    
    func comer() {
        print("O animal está comendo")
    }
    
}

class GatoComHeranca: Animal {
    var soltaPelo: Bool
    
    init(nome: String, cor: String, soltaPelo: Bool) {
        self.soltaPelo = soltaPelo
        super.init(nome: nome, cor: cor, temAsas: false)
    }
    
    func imprimeSeTemAsas(){
        if temAsas {
            print("sim")
        } else {
            print("não")
        }
    }
    
    override func emitirSom() -> String {
        return "Miaaaaau"
    }
    
    override func comer() {
        print("Devorando um peixe")
    }
}

var adamastorComHeranca: GatoComHeranca = GatoComHeranca(nome: "Adamastor", cor: "Preto", soltaPelo: true)

//adamastorComHeranca.comer()
//adamastorComHeranca.emitirSom()

class VacaComHeranca: Animal {
    var litrosDeLeitePorDia: Int
    
    init(nome: String, cor: String, litrosDeLeitePorDia: Int) {
        self.litrosDeLeitePorDia = litrosDeLeitePorDia
        super.init(nome: nome, cor: cor, temAsas: false)
    }
    
    override func emitirSom() -> String {
        return "Muu"
    }
    
    override func comer() {
        print("Hmmm que capim gostoso!")
    }
}

var mimosaComHeranca: VacaComHeranca = VacaComHeranca(nome: "Mimosa", cor: "Marrom", litrosDeLeitePorDia: 3)

//mimosaComHeranca.emitirSom()
//mimosaComHeranca.comer()


var gatoAnimal: Animal = VacaComHeranca(nome: "vaquinha", cor: "marrom", litrosDeLeitePorDia: 3)

//gatoAnimal.comer()
//gatoAnimal.soltaPelo


// -----------------------------------------------------------------------------------------------



class Funcionario {
    var nome: String
    var salario: Double
    let cpf: String
    let bonus: Double
    init(nome: String, salario: Double, cpf: String, bonus: Double) {
        self.nome = nome
        self.salario = salario
        self.cpf = cpf
        self.bonus = bonus
    }
    
    func bonusAnual() -> Double {
        let valorBonus = salario * bonus
        return valorBonus * 12
    }
}

let adriano = Funcionario(nome: "Adriano", salario: 2000, cpf: "000000000", bonus: 0.0)

class Programador: Funcionario {
    var plataformaDeTrabalho: String
    
    init(plataformaDeTrabalhoParametro: String, nomeParametro: String, salarioParametro: Double, cpfParametro: String) {
        plataformaDeTrabalho = plataformaDeTrabalhoParametro
        super.init(nome: nomeParametro, salario: salarioParametro, cpf: cpfParametro, bonus: 0.2)
    }
    
    override func bonusAnual() -> Double {
        return salario * 0.2 * 12
    }
    
}
let programador = Programador(plataformaDeTrabalhoParametro: "iOS", nomeParametro: "Jessica", salarioParametro: 20000, cpfParametro: "11111111111")
programador.nome

class Designer: Funcionario {
    var ferramentaPreferida: String
    
    init(ferramentaPreferidaParametro: String, nomeParametro: String, salarioParametro: Double, cpfParametro: String) {
        ferramentaPreferida = ferramentaPreferidaParametro
        super.init(nome: nomeParametro, salario: salarioParametro, cpf: cpfParametro, bonus: 0.15)
    }
    
    override func bonusAnual() -> Double {
        return salario * 0.15 * 12
    }
}
