import UIKit

class Model {
    
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        items.append(item)
        saveData()
    }
        
    func removeItem(_ index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        let item = items.remove(at: index)
        items.insert(item, at: destinationIndex)
        saveData()
    }
    
    func itemCount() -> Int{
        return items.count
    }
    
    func item(_ index: Int) -> String {
        return items[index]
    }
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
    
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
            self.items = items
        }
    }
}

