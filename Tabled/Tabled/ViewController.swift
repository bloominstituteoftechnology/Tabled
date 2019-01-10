//
//  ViewController.swift
//  Tabled
//
//  Created by Stuart on 1/10/19.
//  Copyright © 2019 Stuart. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBAction func add(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "cell"

}
