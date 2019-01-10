//
//  Model.swift
//  TabledApp
//
//  Created by Nelson Gonzalez on 1/10/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//


import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private(set) var items: [String] = []
    private(set) var list = [List]()
    
    func addItem(_ item: String) {
        // fill this in
       let listItem = List(title: item)
        items.append(listItem.title)
        
   
    }
    
    func removeItem(at index: Int) {
        // fill this in
        items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int, stringValue: String) {
       
   items.remove(at: index)
     items.insert(stringValue, at: destinationIndex)
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
    
//    func loadData() {
//        if let items = NSArray(contentsOf: fileURL) as? [String] {
//            items = items
//        }
//    }
}
