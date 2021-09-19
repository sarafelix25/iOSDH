import UIKit

class Vendedor {
    var nome: String
    
    
    var delegate: LocadoraProtocol?
    var filmes: [Filmes]
    
    init(nome: String) {
        self.filmes = []
        self.nome = nome
    }
    
    private func encontrarFilmeCom(nome: String) -> Filmes? {
        for filme in filmes {
            if filme.titulo == nome {
                return filme
            }
        }
        
        print("A Locadora não possui esse filme no seu estoque.")
        
        return nil
    }
    
    func alugar(nome: String) {
        print("O vendedor \(self.nome) informa:")
        
        if let filme = encontrarFilmeCom(nome: nome) {
            delegate?.alugar(exemplar: filme)
        }
    }
    
    func retornar(nome: String) {
        print("O vendedor \(self.nome) informa:")
        
        if let filme = encontrarFilmeCom(nome: nome) {
            delegate?.retornar(exemplar: filme)
        }
    }
    
    func alugado(nome: String) -> Bool {
        print("O vendedor \(self.nome) informa:")
        
        if let filme = encontrarFilmeCom(nome: nome) {
            
            if let alugado = delegate?.alugado(exemplar: filme) {
                if alugado {
                    print("O filme \(nome) está alugado!")
                } else {
                    print("O filme \(nome) não está alugado!")
                }
                print("\n")
                
                return alugado
            }
        }
        
        return false
    }
    
    func usar(nome: String) {
        print("O vendedor \(self.nome) informa:")
        
        if let filme = encontrarFilmeCom(nome: nome) {
            delegate?.usar(exemplar: filme)
        }
    }
    
    func usado(nome: String) -> Bool {
        print("O vendedor \(self.nome) informa:")
        
        if let filme = encontrarFilmeCom(nome: nome) {
            
            if let estaSendoUsado = delegate?.usado(exemplar: filme) {
                if estaSendoUsado {
                    print("O filme \(nome) está sendo utilizado.")
                } else {
                    print("O filme \(nome) não está sendo utilizado.")
                }
                
                print("\n")
                return estaSendoUsado
            }
        }
        
        print("\n")
        return false
    }
    
}

protocol LocadoraProtocol {
    func alugar(exemplar: Filmes)
    func retornar(exemplar: Filmes)
    func alugado(exemplar: Filmes) -> Bool?
    func usar(exemplar: Filmes)
    func usado(exemplar: Filmes) -> Bool?
}

class Locadora: LocadoraProtocol {
    var nome: String
    var endereco: String
    var horarioFuncionamento: String
    var estoqueFilmes: [Filmes]
    
    
    init(nome: String, endereco: String, horarioFuncionamento: String, estoqueFilmes: [Filmes]) {
        self.nome = nome
        self.endereco = endereco
        self.horarioFuncionamento = horarioFuncionamento
        self.estoqueFilmes = estoqueFilmes
    }
    
    func abrirLocadoraCom(_ vendedores: [Vendedor]) {
        print("--------------- A Locadora \(nome) acaba de abrir! --------------- ")
        print("Ela está localizada na \(endereco) e funciona das \(horarioFuncionamento)\n")
        exibeEstoqueFilmesDisponiveis()
        atribuiFilmesPara(vendedores)
        
    }
    
    func exibeEstoqueFilmesDisponiveis() {
        print("--------------- Os filmes disponíveis da Locadora \(nome) são: --------------- \n")
        
        for filme in estoqueFilmes {
            print("\(filme.titulo) - do ano \(filme.anoNascimento) e de idioma \(filme.idiomaLegendas)")
        }
        print("\n")
    }
    
    func atribuiFilmesPara(_ vendedores: [Vendedor]){
        for vendedor in vendedores {
            vendedor.delegate = self
            vendedor.filmes = estoqueFilmes
        }
    }
    
    func alugar(exemplar: Filmes) {
        
        if exemplar is DVD || exemplar is BlueRay {
            print(exemplar.titulo)
        } else {
            print("Este filme não pode ser alugado.")
        }
        
        if let dvd = exemplar as? DVD {
            if dvd.alugado {
                print("O filme \(dvd.titulo) já foi alugado e não pode ser alugado novamente.")
            } else {
                dvd.alugado = true
                print("O filme \(dvd.titulo) foi alugado com sucesso!")
            }
        }
        
        if let blueray = exemplar as? BlueRay {
            if blueray.alugado {
                print("O filme \(blueray.titulo) já foi alugado e não pode ser alugado novamente.")
            } else {
                blueray.alugado = true
                print("O filme \(blueray.titulo) foi alugado com sucesso!")
            }
            
        }
        
        print("\n")
    }
    
    func retornar(exemplar: Filmes) {
        
        if exemplar is DVD || exemplar is BlueRay {
            print(exemplar.titulo)
        } else {
            print("Este filme não pode ser retornado.")
        }
        
        if let dvd = exemplar as? DVD {
            
            if dvd.alugado {
                dvd.alugado = false
                print("O filme \(dvd.titulo) foi retornado com sucesso.")
            } else {
                print("O filme \(dvd.titulo) não está alugado e por isso não precisa ser retornado.")
            }
        }
        
        if let blueray = exemplar as? BlueRay {
            
            if blueray.alugado {
                blueray.alugado = false
                print("O filme \(blueray.titulo) foi retornado com sucesso.")
            } else {
                print("O filme \(blueray.titulo) não está alugado e por isso não precisa ser retornado.")
            }
            
        }
        
        print("\n")
    }
    
    
    func alugado(exemplar: Filmes) -> Bool? {
        
        if let dvd = exemplar as? DVD {
            return dvd.alugado
        }
        
        if let blueray = exemplar as? BlueRay {
            return blueray.alugado
        }
        
        return nil
    }
    
    func usar(exemplar: Filmes) {
        if exemplar is VHS == false {
            print("O filme \(exemplar.titulo) não pode ser utilizado pois não é um VHS.")
        }
        
        if let vhs = exemplar as? VHS {
            vhs.utilizado = true
            print("O filme \(exemplar.titulo) foi utilizado com sucesso!")
        }
        print("\n")
    }
    
    func usado(exemplar: Filmes) -> Bool? {
        
        if exemplar is VHS == false {
            print("O filme \(exemplar.titulo) não pode ser utilizado pois não é um VHS.")
            return nil
        }
        
        if let vhs = exemplar as? VHS {
            return vhs.utilizado
        }
        return nil
    }
}

class Filmes {
    public let codigoIMDB: Int
    public let titulo: String
    public let anoNascimento: String
    public var idiomaLegendas: String
    
    init(codigoIMDBParametro: Int, titulo: String, anoNascimentoParametro: String, idiomaLegendasParametro: String) {
        codigoIMDB = codigoIMDBParametro ///0000
        self.titulo = titulo
        anoNascimento = anoNascimentoParametro
        idiomaLegendas = idiomaLegendasParametro
    }
}

class DVD: Filmes {
    private let zona: Int
    var alugado: Bool = false
    
    init(zonaParametro: Int, codigoIMDBParametroFilmes: Int, tituloParametroFilmes: String, anoNascimentoParametroFilmes: String, idiomaLegendasParametroFilmes: String) {
        
        zona = zonaParametro
        super.init(codigoIMDBParametro: codigoIMDBParametroFilmes, titulo: tituloParametroFilmes, anoNascimentoParametro: anoNascimentoParametroFilmes, idiomaLegendasParametro: idiomaLegendasParametroFilmes)
    }
}

class VHS: Filmes {
    private let dataFabricacao: String
    var utilizado: Bool = false
    
    init(dataFabricacao: String, codigoIMDB: Int, titulo: String, anoNascimento: String, idiomaLegendas: String) {
        self.dataFabricacao = dataFabricacao
        super.init(codigoIMDBParametro: codigoIMDB, titulo: titulo, anoNascimentoParametro: anoNascimento, idiomaLegendasParametro: idiomaLegendas)
    }
}

class BlueRay: Filmes {
    var alugado: Bool = false
}


let filme = Filmes(codigoIMDBParametro: 0000, titulo: "Senhor dos Anéis", anoNascimentoParametro: "2001", idiomaLegendasParametro: "Inglês")
let dvd = DVD(zonaParametro: 1, codigoIMDBParametroFilmes: 1111, tituloParametroFilmes: "John Wick", anoNascimentoParametroFilmes: "2014", idiomaLegendasParametroFilmes: "Português")
let vhs = VHS(dataFabricacao: "2000", codigoIMDB: 2222, titulo: "Star Trek", anoNascimento: "2009", idiomaLegendas: "Espanhol")
let blueray = BlueRay(codigoIMDBParametro: 3333, titulo: "Matrix", anoNascimentoParametro: "1999", idiomaLegendasParametro: "Alemão")
let estoqueFilmes: [Filmes] = [filme, dvd, vhs, blueray]

let locadora1 = Locadora(nome: "Blockbuster", endereco: "Rua exemplo 1", horarioFuncionamento: "Das 10 às 18hrs", estoqueFilmes: estoqueFilmes)

let vendedor1 = Vendedor(nome: "Lucas")
let vendedor2 = Vendedor(nome: "Adriano")
let vendedor3 = Vendedor(nome: "Lilian")
let vendedor4 = Vendedor(nome: "Magno")
let vendedor5 = Vendedor(nome: "Sara")

let vendedores = [vendedor1, vendedor2, vendedor3, vendedor4, vendedor5]

locadora1.abrirLocadoraCom(vendedores)

print("--------------- Funcionamento da Locadora --------------- \n")

// Com o vendedor1, eu quero alugar um VHS.
vendedor1.alugar(nome: "Star Trek")

// Com o vendedor2, eu quero alugar um DVD.
vendedor2.alugar(nome: "John Wick")

// Com o vendedor3, eu quero retornar um DVD.
vendedor3.retornar(nome: "John Wick")

// Com o vendedor4, eu quero retornar um VHS.
vendedor4.retornar(nome: "Star Trek")

// Com o vendedor3, eu quero retornar um BlueRay que não foi alugado.
vendedor3.retornar(nome: "Matrix")
// Com o vendedor2, eu quero saber se o DVD está alugado ou não
vendedor2.alugado(nome: "John Wick")

// Com o vendedor4, eu quero saber se o DVD está alugado ou não
vendedor4.alugado(nome: "John Wick")

// Com o vendedor5, eu quero utilizar um DVD.
vendedor5.usar(nome: "John Wick")

// Com o vendedor5, eu quero utilizar um VHS.
vendedor5.usar(nome: "Star Trek")

// Com o vendedor1, eu quero saber se um VHS está sendo utilizado.
vendedor1.usado(nome: "Star Trek")

// Com o vendedor2, eu quero saber se um DVD está sendo utilizado.
vendedor2.usado(nome: "John Wick")
