//
//  Adapter.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 13/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

protocol AdapterInput : class {
    //weak var input: AdapterInput? { set get }
    
    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func section(at index: Int) -> SectionProtocol
    func item(at indexPath: IndexPath) -> ItemProtocol
}

protocol AdapterOutput : class {
    func reloadData()
    
    func insert(sections: IndexSet)
    func delete(sections: IndexSet)
    func reload(sections: IndexSet)
    func move(section from: Int, to: Int)
    
    func insert(items: [IndexPath])
    func delete(items: [IndexPath])
    func reload(items: [IndexPath])
    func move(item from: IndexPath, to: IndexPath)
    
    func performBatchUpdates(_ updates: (() -> Void))
}
