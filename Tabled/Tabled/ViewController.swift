import Foundation
import UIKit

class ViewController: UIViewController, UIActivityItemSource, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func add(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {return}
        
        Model.shared.addItem(text) // add to the model
        textField.text = nil // remove the entry from the text field
        tableView.insertRows(at: [IndexPath(row: Model.shared.itemCount() - 1, section: 0)], with: .top)
    }
    
    // Share data
    @IBAction func share(_ sender: Any) {
        
        var items: String = ""
        for item in 0..<(Model.shared.itemCount()-1){
            items += "\(Model.shared.item(at:item)) ,"
        }
        items += " \(Model.shared.item(at: Model.shared.itemCount()-1))"
        let list = [items]
        
        let ac = UIActivityViewController(activityItems: list, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    let reuseIdentifier = "cell"
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        // Delegation pattern - allows you to establish another class that
        // handles responsiblity that you cannot determine at the time you
        // design your source class
        // In this case, our source class is UITableView
        // And our delegate class is ViewController
        
        // Table views use two kinds of delegation to pass on responsibility:
        // -- Data Source -- tells the table view what kind of things to put
        // in its cells and how many cells it has
        // -- Delegate -- responds to user interactions; table passes
        // responsibility for user touches
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath)
        cell.textLabel?.text = Model.shared.item(at: indexPath.row)
        return cell
    }
    
    // this may not look like delete but it is!!!!
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Enable "magic" swipe-to-delete
        guard editingStyle == .delete else { return }
        
        Model.shared.removeItem(at: indexPath.row)
        //tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Model.shared.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
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
    
    
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return "The pig is in the poke"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        return "The pig is in the pot"
    }
    
}

