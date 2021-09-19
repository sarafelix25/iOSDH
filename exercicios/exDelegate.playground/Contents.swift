import UIKit

protocol Contrato {
    func oUsuarioFezUmaCompra(quantidadeDePecas:Int, tipoDePeca: String)
}

class Vendedor {
    
    private var nome: String
    var delegate: Contrato?
    
    init(nome: String) {
        self.nome = nome
    }
    
    func venderPecaDeRoupas(quantidadeDePecas: Int, tipoDePeca: String) {
        
        print("------------ Venda na Loja ------------\n")
        
        
        print("O Vendedor de nome \(nome)")
        print("Realizou uma venda de \(quantidadeDePecas) peças do tipo \(tipoDePeca)\n")
        
        delegate?.oUsuarioFezUmaCompra(quantidadeDePecas: quantidadeDePecas, tipoDePeca: tipoDePeca)
    }
}

class LojaDeRoupas: Contrato {
    
    var estoque: [String: Int]
    let vendedor: Vendedor
    
    init(estoque:[String: Int], vendedor: Vendedor) {
        self.estoque = estoque
        self.vendedor = vendedor
    }
    func abrirLoja() {
        print("------------ Loja Aberta ------------\n")
        imprimeEstoqueAtual()
        vendedor.delegate = self
    }
    
    
    func oUsuarioFezUmaCompra(quantidadeDePecas: Int, tipoDePeca: String) {
        
        print("------------ Delegate ------------\n")
        
        
        print("O delegate me avisou que o usuário fez uma compra de \(quantidadeDePecas) \(tipoDePeca).\n")
        
        atualizaEstoque(quantidadeDePecas, tipoDePeca)
        imprimeEstoqueAtual()
    }
    
    private func atualizaEstoque(_ quantidadeDePecas: Int, _ tipoDePeca: String) {
        
        print("------------ Atualização de Estoque ------------\n")
        
        if let quantidadeDePecasEmEstoque = estoque[tipoDePeca] {
            let novaQuantidadeDePecasEmEstoque = quantidadeDePecasEmEstoque - quantidadeDePecas
            estoque[tipoDePeca] = novaQuantidadeDePecasEmEstoque
        }
    }
    
    private func imprimeEstoqueAtual() {
        print("------------ Estoque ------------\n")
        for item in estoque {
            print("Tipo de peça: \(item.key) | Quantidade em Estoque: \(item.value)")
        }
        print("\n")
    }
    
    
    
}

var estoque = ["Blusas": 100,
               "Calças": 200,
               "Bermudas": 100,
               "Regatas": 50]

let vendedorA = Vendedor(nome: "Fernando")
let renner = LojaDeRoupas(estoque: estoque, vendedor: vendedorA)

renner.abrirLoja()

vendedorA.venderPecaDeRoupas(quantidadeDePecas: 3, tipoDePeca: "Blusas")
