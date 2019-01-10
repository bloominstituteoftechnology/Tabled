//
//  ViewController.swift
//  Tabled
//
//  Created by Angel Buenrostro on 1/10/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func add(_ sender: UIButton) {
    }
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

