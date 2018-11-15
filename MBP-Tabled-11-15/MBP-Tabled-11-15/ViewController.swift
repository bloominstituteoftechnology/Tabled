import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
 
    @IBAction func add(_ sender: Any) {
        // grab data from the textField, guard let that it is not nil AND not empty, then:
        // assign that to a newItem variable
        // append the model with that newItem using add function
        // reload the table view using the reloadData method
        // clear the text field by assigning a ""
        
        guard let newItem = textField.text, !newItem.isEmpty else { return }
        
        Model.shared.addItem(newItem)
        tableView.reloadData()
        textField.text = ""
        
    }
    
    let reuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let item = Model.shared.item(at: indexPath.row)
        
        cell.textLabel?.text = item
        
        return cell
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        Model.shared.removeItem(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
        

}
    
    


