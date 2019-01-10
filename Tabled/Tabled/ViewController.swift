//
//  ViewController.swift
//  Tabled
//
//  Created by Jocelyn Stuart on 1/10/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let items = Model.shared.items
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item.text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        // Implement here
        let item = Model.shared.items[indexPath.row]
        Model.shared.removeItem(item: item)
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // Implement here
        let movedObject = Model.shared.items[sourceIndexPath.row]
        Model.shared.removeItem(item: movedObject)
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var reuseIdentifier: String = "cell"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func add(_ sender: UIButton) {
        guard let text = textField.text else {return}
        
        Model.shared.addItem(textItem: text)
        textField.text = nil
        tableView.reloadData()
        
        //tableView.insertRows(at: Model.shared.items[index], with: UITableView.RowAnimation )
        
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

