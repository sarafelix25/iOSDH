import UIKit

//var closure: (String) -> Bool

func fazerTorta(comprouFarinha: String) -> Bool {
    if comprouFarinha == "comprei a farinha!" {
        return true
    } else {
        return false
    }
}

func comprarFarinha(fazerTorta: (String) -> Bool) {
    print("Realizando ações")
    
    if fazerTorta("comprei a ovo!") == true {
        print("Posso comer!")
    } else {
        print("não posso comer!")
    }
}

//comprarFarinha { comprouFarinha in
//    if comprouFarinha == "comprei a farinha!" {
//        return true
//    } else {
//        return false
//    }
//}

func requisicaoInstagram(exibirHome: (Bool) -> String) {
    
    print("Carregando..")
    print("Faz requisição..")
    print("Carregou.")
    print(exibirHome(false))
}

print("abri instagram")

//requisicaoInstagram { requisicaoDeuCerto in
//
//
//    if requisicaoDeuCerto == true {
//        return "MOSTRA HOME"
//    } else {
//        return "MOSTRA TELA DE ERRO"
//    }
//}

//func doSomething(using closure: () -> Void) {
//  closure()
//}

func closure()  {
    
}

func doSomething(using closure: @escaping () -> Void) {
    let deadline = DispatchTime.now() + .seconds(1)

    print("Comecei a fazer a requisição")
    
    DispatchQueue.main.asyncAfter(deadline: deadline) {
        print("Terminei a requisição")
        closure()
    }
    
    for i in 1...10 {
        print(i)
    }
}

doSomething {
    print("EXIBI A TELA")
}
