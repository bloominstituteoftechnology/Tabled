import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    //Setting items to an empty array
    private var items: [String] = []
    
    // Function to allow us to add items/ i.e why we use 'append', we need to use saveData so that it saves the items we add.
    func addItem(_ item: String) {
        items.append(item)
        saveData()
    }
    //We're removing at the index in the cell.
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    //This function allows us to remove an item at the index in the cell. 
    func moveItem(from index: Int, to destinationIndex: Int) {
        let item = items.remove(at: index)
        items.insert(item, at: destinationIndex)
        saveData()
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
