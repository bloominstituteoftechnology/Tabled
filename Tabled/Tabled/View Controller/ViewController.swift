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
        
        tableView.reloadData()
        
    }
    
    @IBAction func editTable(_ sender: Any) {
        tableView.setEditing(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable(_:)))
    }
    
    @objc
    func stopEditingTable(_ sender: Any) {
        tableView.setEditing(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTable(_:)))
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        // Implement here
        let table = TabledController.shared.tabled[indexPath.row]
        TabledController.shared
        .delete(table: table)
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // Implement here
        
        //get the data model you want to move
        let fromEntry = TabledController.shared.tabled[sourceIndexPath.row]
        
        //remove the data model from its place
        TabledController.shared.delete(table: fromEntry)
        
        //insert the data model at new destination
        TabledController.shared.tabled.insert(fromEntry, at: destinationIndexPath.row)
    }
    
}



