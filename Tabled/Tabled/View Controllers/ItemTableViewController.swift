//
//  ItemTableViewController.swift
//  Tabled
//
//  Created by Vijay Das on 1/10/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    let reuseIdentifier = "ItemCell"
    
    @IBAction func add(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        ItemsController.shared.addItem(withItem: text)
        textField.text = nil
        tableView.reloadData()
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ItemsController.shared.itemCount()
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell...
        
        let items = ItemsController.shared.items
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.item
        

        return cell
    }
   
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        // Implement here
        
        let item = ItemsController.shared.items[indexPath.row]
        print(item)
        print(ItemsController.shared.items)
        ItemsController.shared.removeItem(item: item)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // Implement here
        
        ItemsController.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
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
    
    


}
