import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButton(_ sender: Any) {
        guard let item = addItemTextField.text,
            !item.isEmpty else { return }
        
        Model.shared.addItem(item)
        tableView.reloadData()
        addItemTextField.text = nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    let resuseIdentifier = "ListCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = Model.shared.item(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        Model.shared.removeItem(indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let edit = Model.shared.item(indexPath.row)
        addItemTextField.text = edit
        Model.shared.removeItem(indexPath.row)
        
        
        //Model.shared.editItem(indexPath.row)

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
    
}

