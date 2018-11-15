import Foundation
import UIKit

class Model {

    // PROPERTIES
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
 
    // MARK: - DATA functions
   
    // ADD item
    
    func addItem(_ item: String) {
        
        
    }
    
    // REMOVE Item
    
    func removeItem(at index: Int) {
        
    }
    
    // MOVE item
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        
    }
    
    // Number of Rows
    
    func itemCount() -> Int {
        return items.count
    }
    
    // READ
    
    func item(at index: Int) -> String {
        return items[index]
    }
    
    // File locations for saving:
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    // SAVE and LOAD functions from storage locations
    
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
   
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
            self.items = items
        }
   
    }
}
