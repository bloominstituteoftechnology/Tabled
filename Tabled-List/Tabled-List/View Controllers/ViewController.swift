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
    
}

