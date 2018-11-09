import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        Model.shared.addItem(text)
        textField.text = nil
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    let reuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        Model.shared.removeItem(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    @IBAction func editTable(_ sender: Any) {
        tableView.setEditing(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable(_:)))
    }
    
    @objc
    func stopEditingTable(_ sender: Any) {
        tableView.setEditing(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action:  #selector(editTable(_:)))
    }
   
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        
    }
    
    // Woo! A real Table View delegate delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = Model.shared.item(at: indexPath.row)
        let message = "You selected \(item)"
        present(UIAlertController.message(message), animated: true, completion: nil)
    }
    
    
}




    
    



