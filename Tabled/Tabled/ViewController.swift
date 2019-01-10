//
//  ViewController.swift
//  Tabled
//
//  Created by Cameron Dunn on 1/10/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    @IBOutlet weak var textField : UITextField!
    let itemDict : [String : Int] = [:]
    let reuseIdentifier : String = "cell"
    
    
    @IBAction func add(_ sender: Any) {
        if(textField.text != nil && !textField.text!.isEmpty && textField.text != " " && !textField.text!.contains("  ")){
            Model.shared.addItem(textField.text!)
            tableView.reloadData()
        }else{
            let alert = UIAlertController(title: "Error", message: "Item cannot be blank and/or contain more than two spaces in a row.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        return cell!
    }
    override func viewWillAppear(_ animated: Bool) {
        //input what will happen when view will appear
    }
    override func viewDidLoad() {
        //input what will happen when view is loaded
    }


}

