//
//  ViewController.swift
//  TextField_Delegate
//
//  Created by Jessica Arruda Ferreira de Santana on 16/08/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var exemploTextField: UITextField!
    @IBOutlet weak var exemploTextField2: UITextField!
    
    var quantidadeDeLetrasZ: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exemploTextField.delegate = self
        exemploTextField.clearButtonMode = .always
        exemploTextField2.delegate = self
        exemploTextField2.clearButtonMode = .always
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.tag == 0 {
            exemploTextField2.isEnabled = true
        }
        
        if textField.tag == 1 {
            
            if quantidadeDeLetrasZ > 3 {
                devePintarABordaDoTextField2(true)
                exemploTextField2.isEnabled = false
            } else {
                devePintarABordaDoTextField2(false)
            }
            
            if quantidadeDeLetrasZ == 0 {
                textField.text = ""
            } else {
                textField.text = "Encontrei \(quantidadeDeLetrasZ) letras Z"
            }
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 0 {
            if let texto = textField.text {
//                quantidadeDeLetrasZ = texto.filter { $0 == "Z" }.count
                quantidadeDeLetrasZ = encontraQuantidadeDeLetras("Z", em: texto)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 0 {
            if string == "a" || string == "A" {
                if let text = textField.text {
                    textField.text = "\(text)Z"
                    return false
                }
            }
        }
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            if text.contains("b") {
                return true
            }
        }
        return false
    }
    
    func encontraQuantidadeDeLetras(_ letra: String, em texto: String) -> Int {
        var contador = 0
        
        for caractere in texto {
            if String(caractere) == letra {
                contador+=1
            }
        }
        
        return contador
    }
    
    func devePintarABordaDoTextField2(_ devePintar: Bool) {
        if devePintar {
            exemploTextField.layer.borderWidth = 1
            exemploTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            exemploTextField.layer.borderWidth = 0
            exemploTextField.layer.borderColor = UIColor.clear.cgColor
        }

    }
}

