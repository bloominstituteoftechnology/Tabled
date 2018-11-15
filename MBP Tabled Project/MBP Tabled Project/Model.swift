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
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func moveItem(at index: Int, to newIndex: Int) {
        let item = items.remove(at: index)
        items.insert(item, at: index)
    }
    
    
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("Animals")
        .appendingPathExtension("plist")
 
    func saveData() {
        try! (values as NSArray).write(to: fileURL) // this is generally bad
    }
    
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
            values = items
        }
    }
    
}
