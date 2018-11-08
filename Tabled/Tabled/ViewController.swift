
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        return cell
    }
    


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {return}
        Model.shared.addItem(text)
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .fade)
        
    }
    
    let reuseIdentifier = "cell"
    
}

