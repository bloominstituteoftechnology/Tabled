import UIKit

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    
    
    
    func item(at index: Int) -> String {
        return items[index]
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func addItem(_ item: String) {
        items.append(item)
        saveData()
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    func moveItem(from index: Int, to newIndex: Int) {
        let item = items.remove(at: index)
        items.insert(item, at: index)
        saveData()
    }
    
    
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
 
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
    
    func loadData() {
        if let values = NSArray(contentsOf: fileURL) as? [String] {
            items = values
        }
    }
    
}
