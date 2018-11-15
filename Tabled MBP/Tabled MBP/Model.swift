//
//  Model.swift
//  Tabled MBP
//

import Foundation

class Model {
    
    // create instance of the class Model
    static let shared = Model()
    
    // make it a private instance of the Model so others can't make it
    private init() {}
    
    // private array that will hold the items entered by user
    private var items: [String] = []
    
    
    // MARK: - CRUD Methods
    // add item to items array
    func addItem(_ item: String) {
        items.append(item)
    }
    
    // remove item from array
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    // move items around in the array
    func moveItem(from index: Int, to destinationIndex: Int) {
        // remove and return item
        let item = items.remove(at: index)
        
        // insert item to new index
        items.insert(item, at: destinationIndex)
    }
    
    // count and return the number of items
    func itemCount() -> Int {
        return items.count
    }
    
    // return the name of the item that belongs to the index entered
    func item(at index: Int) -> String {
        return items[index]
    }
    
    // saving location - creates the URL
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    // save and load functions from storage location
    func saveData() {
        try! (items as NSArray).write(to: fileURL)
    }
    
    func loadData() {
        if let items = NSArray(contentsOf: fileURL) as? [String] {
            self.items = items
        }
    }
    
}
