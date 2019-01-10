//
//  ViewController.swift
//  Tabled
//
//  Created by Luis Corvalan on 1/10/19.
//  Copyright © 2019 Luis Corvalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var reuseIdentifier = "cell"
    
    @IBAction func add(_ sender: Any) {
        
        guard let text = textField.text else {
            return
        }
        
        TabledController.shared.createLabel(withText: text)
        textField.text = nil
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TabledController.shared.tabled.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let tabled = TabledController.shared.tabled
        let table = tabled[indexPath.row]
        cell.textLabel!.text = table.text
        
        return cell
    }
    
}

