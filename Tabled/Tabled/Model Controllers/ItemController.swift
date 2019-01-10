//
//  ItemController.swift
//  Tabled
//
//  Created by Vijay Das on 1/10/19.
//  Copyright © 2019 Vijay Das. All rights reserved.
//

import Foundation

class ItemsController {
    static let shared = ItemsController()
    private init() {}
    private(set) var items = [Item]()
    
/*
     Need the following functions here:
     addItem - done
     itemCount
     removeItem -
     moveItem

     item
     
  
*/
    
    func addItem(withItem item: String) {
        let item = Item(item: item)
        items.append(item)
    }
    
     
 
}
