import UIKit

class TableViewController: UITableViewController {
    
    let reuseIdentifier = "TabledCell"
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet var tableViewOutlet: UITableView!
    
    @IBAction func add(_ sender: Any) {
        guard let text = textFieldOutlet.text, !text.isEmpty else { return }
        Model.shared.addItem(text)
        textFieldOutlet.text = nil
        tableView.reloadData()
    }
    
    @IBAction func startEditing(_ sender: Any) {
        tableView.setEditing(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(stopEditingTable(_:)))
    }
    
    @objc
    func stopEditingTable(_ sender: Any) {
        tableView.setEditing(false, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(startEditing(_:)))
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item = Model.shared.item(at: indexPath.row)
//        let message = "You selected \(item)"
//        present(UIAlertController.message(message), animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.tableView.isEditing = true
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.itemCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        let texts = Model.shared.items
        let text = texts[indexPath.row]
        cell.textLabel!.text = text

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
            Model.shared.removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Model.shared.moveItem(from: fromIndexPath.row, to: destinationIndexPath.row)
        tableView.moveRow(at: fromIndexPath, to: destinationIndexPath)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
