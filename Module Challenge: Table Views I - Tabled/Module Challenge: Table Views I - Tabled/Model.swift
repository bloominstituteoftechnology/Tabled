import Foundation

class Model {
    static let shareed = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        items.append(item)
    }

    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinatonIndex: Int) {
        let item = items.remove(at: index)
        items.insert(item, at: destinatonIndex)
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> String {
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

