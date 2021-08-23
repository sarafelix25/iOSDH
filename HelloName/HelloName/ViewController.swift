//
//  ViewController.swift
//  HelloName
//
//  Created by sara.batista.d.felix on 29/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
        
        label.text = "Hello, World!"
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "Hello, " + textField.text!
    }
}

