import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        Model.shared.addItem(text)
        textField.text = nil
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)
    }
    
    let reuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

