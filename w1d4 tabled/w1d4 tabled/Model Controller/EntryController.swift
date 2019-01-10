//
//  EntryController.swift
//  w1d4 tabled
//
//  Created by Michael Flowers on 1/10/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class EntryController {
    
    //create a shared instance to access its properties
    static let shared = EntryController()
    
    //create data source of truth, meaning that this is where we hold our model objects
    var entries = [Entry]()
    
    //create a private init to ensure that no other file can create another instance of this class
    private init (){}
    
    //MARK: - CRUD Functions
    
    //add new entry
    func addEntry(withText text: String){
        let entry = Entry(text: text)
        entries.append(entry)
    }
    
    //delete entry
    func delete(entry: Entry){
        //get the index -- make model equatable
        guard let index = entries.index(of: entry) else { return }
        //remove entry from array
        entries.remove(at: index)
    }
    
    //move item
    func moveEntry(from index: Int, to desitination: Int){
   
        //TODO
    }
    
    //count entries
    func entryCount() -> Int {
        return entries.count
    }
    
    //return entry
    func entry(at index: Int) -> Entry {
        return entries[index]
    }
    
    //MARK: - Persistence
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("ToDo")
        .appendingPathExtension("plist")
    
    func saveData() {
        try! (entries as NSArray).write(to: fileURL)
    }
    
    func loadData() { //check back on this
        if let entries1 = NSArray(contentsOf: fileURL) as? [Entry] {
            entries = entries1
        }
    }
}
