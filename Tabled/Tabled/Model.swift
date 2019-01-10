//
//  Model.swift
//  Tabled
//
//  Created by Cameron Dunn on 1/10/19.
//  Copyright © 2019 Cameron Dunn. All rights reserved.
//

import Foundation

var itemsArray : [String] = []

class Model {
    static let shared = Model()
    private init() {}
    
    
    func addItem(_ item: String) {
        itemsArray.append(item)
    }
    
    func removeItem(at index: Int) {
        itemsArray.remove(at: index)
    }
    
    func moveItem(from index: Int, to destinationIndex: Int) {
        let heldString : String = itemsArray[index]
        itemsArray[destinationIndex] = itemsArray[index]
        itemsArray[index] = heldString
    }
    
    func itemCount() -> Int {
        if(itemsArray.count != 0){
        return itemsArray.count
        }else{
            return 0
        }
    }
    
    func item(at index: Int) -> String {
        return itemsArray[index]
    }
    
    func saveData(array : [String]) {
        UserDefaults.standard.set(itemsArray, forKey: "ArraySave")
    }
    
    func loadData() {
        let nilCheck = UserDefaults.standard.stringArray(forKey: "ArraySave")
        if(nilCheck != nil){
            itemsArray = UserDefaults.standard.stringArray(forKey: "ArraySave")!
        }
    }
}
