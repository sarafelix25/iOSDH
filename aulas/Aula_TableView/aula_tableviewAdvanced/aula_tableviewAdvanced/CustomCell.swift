//
//  CustomCell.swift
//  aula_tableviewAdvanced
//
//  Created by sara.batista.d.felix on 24/09/21.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    
    func setup (nome: String) {
        myLabel.text = nome
    }
}
