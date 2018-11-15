////
////  Model.swift
////  Tabled
////
////  Created by Sameera Leola on 11/15/18.
////  Copyright © 2018 Sameera Leola. All rights reserved.
////
//
//import Foundation
//
//class Model {
//    static let shared = Model()
//    private init() {}
//
//    private var items: [String] = []
//
//    func addItem(_ item: String) {
//        // fill this in
//    }
//
//    func removeItem(at index: Int) {
//        // fill this in
//    }
//
//    func moveItem(from index: Int, to destinationIndex: Int) {
//        // fill this in
//    }
//
//    func itemCount() -> Int {
//        return items.count
//    }
//
//    func item(at index: Int) -> String {
//        return items[index]
//    }
//
//    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
//        .appendingPathComponent("Library")
//        .appendingPathComponent("ToDo")
//        .appendingPathExtension("plist")
//
//    func saveData() {
//        try! (items as NSArray).write(to: fileURL)
//    }
//
//    func loadData() {
//        if let items = NSArray(contentsOf: fileURL) as? [String] {
//            items = items
//        }
//    }
//}

//
//  Model.swift
//  Tabled
//
//  Created by Sameera Leola on 11/15/18.
//  Copyright © 2018 Sameera Leola. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        items.append(item)
        saveData()
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        //First remove the item we want to move from its current position.  The removed item is returned
        let todoItem = items.remove(at: index)
        items.insert(todoItem, at: destinationIndex)
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
