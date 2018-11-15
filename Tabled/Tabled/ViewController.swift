//
//  ViewController.swift
//  Tabled
//
//  Created by Sameera Leola on 11/15/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "cell"
    
    //Setting the viewController as dataSource and delegate to conform to UITableViewDataSource and UITableViewDelegate
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    @IBAction func add(_ sender: Any) {
        guard let newToDo = textField.text, !newToDo.isEmpty else {return}
        Model.shared.addItem(newToDo)
        tableView.reloadData()
        textField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    //Get the item at the specified index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
      // let todoItem = Model.shared.item(at: indexPath.row)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
       // cell.textLabel?.text = todoItem
        return cell
    }
    
    //Enabled swipe to delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Make sure we are using the delete editing style
        guard editingStyle == .delete else {return}
        //first update the table model then do the tableView.  It will be an error if we don't
        Model.shared.removeItem(at: indexPath.row)
        //Now we need to update the tableview
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
    @IBAction func editTable(_ sender: Any) {
        setEditing(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable(_:)))
    }
    
    @objc
    func stopEditingTable(_ sender: Any) {
        tableView.setEditing(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTable(_:)))
    }
    

}

