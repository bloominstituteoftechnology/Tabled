//
//  ViewController.swift
//  Tabled
//
//  Created by Dustin Koch on 1/10/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    let reuseIdentifier = "cell"
    

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBAction func add(_ sender: UIButton) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        Model.shared.addItem(text)
        
        textField.text = nil
        
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
}

