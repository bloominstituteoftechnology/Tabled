//
//  ToDoListTableViewController.swift
//  w1d4 tabled
//
//  Created by Michael Flowers on 1/10/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func edit(_ sender: UIBarButtonItem) {
        tableView.setEditing(true, animated: true)
        //when you press this button change the button text to done
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable))
    }
    
    @objc func stopEditingTable(_ sender: Any){
        tableView.setEditing(false, animated: true)
        //when you press this button change the text to edit
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(edit(_:)))
    }
    
    @IBAction func add(_ sender: UIButton) {
        //call create function
        guard let text = textField.text, !text.isEmpty else { return }
        EntryController.shared.addEntry(withText: text)
        textField.text = nil
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //get data
        let entry = EntryController.shared.entries[indexPath.row]
        //display data
        cell.textLabel?.text = entry.text

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Delete the row from the data source
            let entryToDelete = EntryController.shared.entries[indexPath.row] //grab this one at row "number" which coincides with the element number in the entries array
            EntryController.shared.delete(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

   override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //get the data model you want to move
        let fromEntry = EntryController.shared.entries[sourceIndexPath.row]
    
    //remove the data model from its place
        EntryController.shared.entries.remove(at: sourceIndexPath.row)
    
    //insert the data model at new destination
        EntryController.shared.entries.insert(fromEntry, at: destinationIndexPath.row)
    }
    
}
