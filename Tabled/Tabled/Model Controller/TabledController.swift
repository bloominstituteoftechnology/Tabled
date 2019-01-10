//
//  TabledController.swift
//  Tabled
//
//  Created by Luis Corvalan on 1/10/19.
//  Copyright © 2019 Luis Corvalan. All rights reserved.
//

import Foundation

class TabledController {
    
    static let shared = TabledController()
    private init() {}
    
    
    
    func createLabel(withText text: String) {
        let table = Table(text: text, timestamp: Date())
        tabled.append(table)
    }
    
    func delete(table: Table) {
        guard let index = tabled.index(of: table) else {
            return
        }
        
        tabled.remove(at: index)
    }
    
    private(set) var tabled = [Table]()
    
}
