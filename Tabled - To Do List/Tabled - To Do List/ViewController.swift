

import UIKit
                                        // Conform your ViewController to UITableViewDataSource and UITableViewDelegate
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    let reuseIdentifier = "cell"

    // ADDS the text in the field to our Model, displays the result in Table View
    @IBAction func add(_ sender: Any) {
        
        // test that the text exists and is not empty
        guard let text = textField.text, !text.isEmpty else { return }
        
        // add it to your model
        Model.shared.addItem(text)
        
        // remove the entry from the text field after it is added
        textField.text = nil
        
        // apply an insert row animation
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // -- Delegator: tableView, Delegate: dataSource (tableView needs information from . the dataSource)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    
    // return the number of items that have been entered into the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    // information the cells should display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        
        return cell
    }
    
    
    // swipe-to-delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        // implement here by updating my model and view
        Model.shared.removeItem(at: indexPath.row)
       
        // delete row animation
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    // row-reordering capability
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
}

