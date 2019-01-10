//
//  ViewController.swift
//  Tabled
//
//  Created by Ilgar Ilyasov on 1/10/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifier: String = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Model.shared.loadData()
        tableView.reloadData()
    }
    
    @IBAction func add(_ sender: Any) {
        if(textField.text != nil && !textField.text!.isEmpty && textField.text != " " && !textField.text!.contains("  ")){
            Model.shared.addItem(textField.text!)
            textField.text = ""
            tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Error", message: "Item cannot be blank and/or contain more than two spaces in a row.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        Model.shared.removeItem(at: indexPath.row)
        tableView.reloadData()
        
        // Implement here
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        cell?.textLabel?.text = itemsArray[indexPath.row]
        return cell!
    }
    
}
