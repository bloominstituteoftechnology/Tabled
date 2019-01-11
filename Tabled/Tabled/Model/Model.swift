//
//  Model.swift
//  Tabled
//
//  Created by Luis Corvalan on 1/10/19.
//  Copyright © 2019 Luis Corvalan. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    private init() {}
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        // fill this in
    }
    
    func removeItem(at index: Int) {
        // fill this in
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        // fill this in
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> String {
        return items[index]
    }
    
}


