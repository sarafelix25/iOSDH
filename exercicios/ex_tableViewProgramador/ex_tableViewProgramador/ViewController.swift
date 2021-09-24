//
//  ViewController.swift
//  ex_tableViewProgramador
//
//  Created by sara.batista.d.felix on 24/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var exemploTableView: UITableView!
    
    var programadores: [String] = ["Sara", "Batista", "Santos", "Felix"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exemploTableView.delegate = self
        exemploTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let alert = UIAlertController(title: "Programador(a)", message: programadores[indexPath.row], preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            print(programadores[indexPath.row])
            
        }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        programadores.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell {
            let programador = programadores[indexPath.row]
            
            cell.imageView?.image = UIImage(named: "programador.jpeg")
            cell.labelCell.text = programador
            
            return cell
        }
        
        return UITableViewCell()
    }

}

