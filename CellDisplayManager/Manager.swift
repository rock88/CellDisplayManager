//
//  CellDisplayManager.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

protocol AdapterOutput {
    func numberOfSections() -> Int
    func numberOfItems(inSection section: Int) -> Int
    func section(at index: Int) -> SectionProtocol
    func item(at indexPath: IndexPath) -> ItemProtocol
}

public class Manager {
    
    private var innerSections = [SectionProtocol]()
    
    func add(section: SectionProtocol) {
        add(sections: [section])
    }
    
    func add(sections: [SectionProtocol]) {
        
    }
}

extension Manager : AdapterOutput {
    func numberOfSections() -> Int {
        return innerSections.count
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return innerSections[section].numberOfItem()
    }
    
    func section(at index: Int) -> SectionProtocol {
        return innerSections[index]
    }
    
    func item(at indexPath: IndexPath) -> ItemProtocol {
        return innerSections[indexPath.section].item(at: indexPath.row)
    }
}
