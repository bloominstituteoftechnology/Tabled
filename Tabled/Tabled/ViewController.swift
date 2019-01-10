//
//  ViewController.swift
//  Tabled
//
//  Created by Stuart on 1/10/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        
        Model.shared.addItem(text)
        textField.text = nil
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        return cell
    }

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "cell"

}
