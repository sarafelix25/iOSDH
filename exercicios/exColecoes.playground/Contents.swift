import UIKit

// 1.

func arraysDiferentes(arrayUm: [Int], arrayDois: [Int]) -> Bool {
    if arrayUm == arrayDois {
        return false
    }
    return true
}

arraysDiferentes(arrayUm: [1,2,3], arrayDois: [4,5,6])
arraysDiferentes(arrayUm: [1,2,3,4,5,6], arrayDois: [1])
arraysDiferentes(arrayUm: [1,2,3], arrayDois: [1,2,3])


// 2.

func media(numeros: [Int]) -> Double {
    var sum:Double?
    
    for numero in numeros {
        sum! += Double(numero)
    }
    
    let resultado:Double = sum!/Double(numeros.count)
    
    return resultado
}

media(numeros: [2,4,8,16])

// 3.

func arrayPares(array: [Int]) -> [Int] {
    var arrayPares:[Int] = []
    for numero in array {
        if numero % 2 == 0 {
            arrayPares.append(numero)
        }
    }
    
    return arrayPares
}

arrayPares(array: [1,2,3,4,5,6,7,8,9,10])

// 4.

func sumArrayPares(array: [Int]) -> Int {
    let arrayPares:[Int] = arrayPares(array: array)
    var sum: Int = 0
    
    for numero in arrayPares {
        sum += numero
    }
    return sum
}

sumArrayPares(array: [1,2,3,4,5,6,7,8,9,10])

// 5. e 6.

func arrayNumerosNaturais(ate n: Int) -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    for numero in 0...n {
        arrayNumerosNaturais.append(numero)
    }
    return arrayNumerosNaturais
}

arrayNumerosNaturais(ate: 10)
arrayNumerosNaturais(ate: 50)


// 7.

func arrayNumerosNaturais(comecandoEm valor:Int) -> [Int] {
    var arrayNumerosNaturais: [Int] = []
    
    for numero in valor...valor+10 {
        arrayNumerosNaturais.append(numero)
    }
    return arrayNumerosNaturais
}

arrayNumerosNaturais(comecandoEm: 7)

// 8.

func arrayNumerosEntre(valor1: Int, valor2: Int) -> [Int]{
    var arrayNumerosNaturais: [Int] = []
    for numero in valor1+1...valor2-1 {
        arrayNumerosNaturais.append(numero)
    }
    
    return arrayNumerosNaturais
}

arrayNumerosEntre(valor1: 1, valor2: 3)

// 9.

func resultadosDaRoleta(quantidade: Int) -> [Int] {
    var resultadosDaRoleta:[Int] = []
    
    for _ in 1...quantidade {
        let resultadoRoleta = Int.random(in: 0...36)
        resultadosDaRoleta.append(resultadoRoleta)
    }
    
    return resultadosDaRoleta
}

resultadosDaRoleta(quantidade: 3)

// 10.

func inverso(numeros: [Int]) -> [Int] {
    var inverso:[Int] = []
    
    for index in 1...numeros.count {
        let value = numeros.count-index
        inverso.append(numeros[value])
    }
    
    return inverso
}

inverso(numeros: [1,2,3,4,5,6,7,8,9,10])
