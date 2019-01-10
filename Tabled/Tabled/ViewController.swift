//
//  ViewController.swift
//  Tabled
//
//  Created by Moses Robinson on 1/10/19.
//  Copyright © 2019 Moses Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        Model.shared.addItem(text)
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount(), section: 0)], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    let reuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        // Implement here
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // Implement here
        
    }
   


}

