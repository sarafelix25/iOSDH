//
//  ViewController.swift
//  ExercicioTableView
//
//  Created by sara.batista.d.felix on 27/08/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var nomesCarrosTableView: UITableView!
    var arrayNomes: [String] = []
    var images: [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        nomesCarrosTableView.delegate = self
        nomesCarrosTableView.dataSource = self
        
        arrayNomes = ["Tesla","Hyundai","Honda","Toyota","Fiat"]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayNomes[indexPath.row])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(arrayNomes[indexPath.row])"
        cell.imageView?.image = UIImage(named: "tesla.jpeg")
        return cell
    }
    
}

