//
//  Model.swift
//  Tabled
//
//  Created by Jocelyn Stuart on 1/10/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation

class Model {
    static let shared = Model()
    //private init() {}
    
    private(set) var items: [Item] = []
    
    func addItem(textItem: String) {
        let item = Item(text: textItem)
        items.append(item)
    }
    
    func removeItem(item: Item) {
        // fill this in
        guard let index = items.index(of: item) else {return}
        items.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        // fill this in
        //guard let index = items.index(of: IndexPath.row) else {return}
        //items.move(at: index)
    }
    
    func itemCount() -> Int {
        return items.count
    }
    
    func item(at index: Int) -> Item {
        return items[index]
    }
    
   
}
