import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    @IBAction func add(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        
        Model.shared.addItem(text)
        textField.text = nil
        
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)
        
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        
        guard editingStyle == .delete else { return }
        
        Model.shared.removeItem(at: indexPath.row)

        tableView.deleteRows(at: [indexPath], with: .fade)
    
    }
}
