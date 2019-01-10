//
//  ViewController.swift
//  TabledApp
//
//  Created by Nelson Gonzalez on 1/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "cell"

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.dataSource = self
        tableView.delegate = self
    }


    @IBAction func add(_ sender: UIButton) {
        
        guard let text = textField.text, !text.isEmpty else {return}
        
        Model.shared.addItem(text)
        textField.text = nil
        tableView.reloadData()
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return Model.shared.items.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        let list = Model.shared.items[indexPath.row]
        
        cell.textLabel?.text = list
        
        return cell
    }
    
    
}
