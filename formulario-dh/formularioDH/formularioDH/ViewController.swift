//
//  ViewController.swift
//  formularioDH
//
//  Created by Magno Miranda Dantas on 04/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func check(_ sender: Any) {
        if telefoneTextField.text?.isEmpty {
            
        }
    }
    
}

