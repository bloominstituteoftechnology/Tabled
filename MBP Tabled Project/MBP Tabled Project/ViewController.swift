
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {return }
        Model.shared.addItem(text)
        tableView.reloadData()
        textField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        //update model
        Model.shared.removeItem(at: indexPath.row)
        
        //*Then* update table view
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editTableView(_ sender: Any) {
        tableView.setEditing(true, animated: true)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable(_:)))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    //gets us out of editing mode
    @objc func stopEditingTable(_ sender: Any) {
        tableView.setEditing(false, animated: true)
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTableView(_:)))
        navigationItem.rightBarButtonItem = editButton
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //Update model
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        //Update table view
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
}
