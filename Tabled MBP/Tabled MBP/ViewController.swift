//
//  ViewController.swift
//  Tabled MBP
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    let reuseIdentifier = "cell"
    
    @IBAction func addButton(_ sender: Any) {
       // guard against an empty text field
        guard let newItem = textField.text, !newItem.isEmpty else { return }
        
        // update the model with the new Item
        Model.shared.addItem(newItem)
        
        // apply insert row animation
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)
        
        // remove entered text from the text field so that a new item can be entered
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the object that acts as the data source to the UIViewController class
        tableView.dataSource = self
        
        // set the object that acts as the delegate to the UIViewController class
        tableView.delegate = self
        
        // reload data
        tableView.reloadData()
        
    }
    
    // MARK: - Table View Data Source
    // Data Source provides the number of rows that is equal to the number of items in the model
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    // Data Srouce provides what data the cells should contain
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // get an item from the model
        let item = Model.shared.item(at: indexPath.row)
        
        // set up the cell with the model object that we have
        cell.textLabel?.text = item
        
        // return the cell back to the table view
        return cell
    }
    
    // Data Source commits insertion or deletion at a specified row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // delete items
        guard editingStyle == .delete else { return }
        
        // update model by removing item from the model
        Model.shared.removeItem(at: indexPath.row)
        
        // update table view by removing it from table view with a swipe
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    // Data Source commits row re-ordering
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // call the Model's move action and update the model
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
        // update the table view
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
    
}

