import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func add(_ sender: Any) {
        guard let toDoItem = textField.text, !toDoItem.isEmpty else { return }
    
        
        Model.shared.addValue(text)
        textField.text = nil
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)]
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    let reuseIdentifier = "cell"

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            cell.textLabel?.text = Model.shared.item(at: indexPath.row)
            return cell
    
        }

    }
}
