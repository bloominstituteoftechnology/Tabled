
import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    // adds another string to the items array
    func addItem(_ item: String) {
        items.append(item)
    }
    
    // ability to remove items according to their index
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveData()
    }
    
    // ability to move items into a different order
    func moveItem(from index: Int, to destinationIndex: Int) {
        // assign the index of the removed item to 'item'
        let item = items.remove(at: index)
        
        // insert the item according destinationIndex
        items.insert(item, at: destinationIndex)
        
        saveData()
    }
    
    // returns number of items entered into the array
    func itemCount() -> Int {
        return items.count
    }
    
    // returns the string located at the index given
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
