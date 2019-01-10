//
//  Model.swift
//  Tabled
//
//  Created by Dustin Koch on 1/10/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        Model.shared.items.append(item)
    }
    
    func removeItem(at index: Int) {
        Model.shared.items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        let element = Model.shared.items.remove(at: index)
        Model.shared.items.insert(element, at: destinationIndex)
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
        if let itemz = NSArray(contentsOf: fileURL) as? [String] {
            items = itemz
        }
    }
}
