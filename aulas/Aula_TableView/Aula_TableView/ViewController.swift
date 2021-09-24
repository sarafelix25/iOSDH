//
//  ViewController.swift
//  Aula_TableView
//
//  Created by sara.batista.d.felix on 27/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var exemploTableView: UITableView!
    var arrayNomes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exemploTableView.delegate = self
        exemploTableView.dataSource = self
        arrayNomes = ["Jessica", "Guilherme", "Maycon", "Adriano", "Lucas", "Eduardo", "Rafaela"]
    }
          
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        return 3
    //    }
    //
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if section == 0 {
    //            return "A"
    //        }
    //
    //        if section == 1 {
    //            return "B"
    //        }
    //
    //        if section == 2 {
    //            return "C"
    //        }
    //
    //        return ""
    //    }
    //
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayNomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayNomes[indexPath.row]
        //        cell.imageView?.image
        return cell
    }
    
}

