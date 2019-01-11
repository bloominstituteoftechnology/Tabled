//
//  Model.swift
//  To Do List
//
//  Created by Nathanael Youngren on 1/10/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items = [String]()
    
    func addItem(_ item: String) {
        items.append(item)
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        let itemToMove = items[index]
        let placeItemHere = items.index(after: destinationIndex)
        items.insert(itemToMove, at: placeItemHere)
        items.remove(at: index)
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> String {
        return items[index]
    }
}
