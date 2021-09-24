//
//  ViewController.swift
//  aula_tableviewAdvanced
//
//  Created by sara.batista.d.felix on 23/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var exemploTableView: UITableView!
    
    var  nomes = ["Sara", "Paula", "Maycon", "Henry", "Fernando"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exemploTableView.delegate = self
        exemploTableView.dataSource = self
    }
    
    // para todas as linhas da tabela serem editáveis
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // para deletar nome
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        nomes.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Seção 0"
//        }
//
//        if section == 1 {
//            return "Seção 1"
//        }
//
//        if section == 2 {
//            return "Seção 2"
//        }
//
//        // poderia retornar nil
//        return ""
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(nomes[indexPath.row])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.setup(nome: nomes[indexPath.row])
        
        print("Seção: \(indexPath.section) linha: \(indexPath.row)")
        
        return cell
    }
    
}

