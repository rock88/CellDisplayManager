//
//  CellDisplayManager.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

public class Manager {
    private var innerSections = NSMutableOrderedSet()
    private var adapter: AdapterOutput?
    
    var test = MutableOrderedSet<SectionProtocol>()
    
    public init() {
        
    }
}

extension Manager {
    func add(section: SectionProtocol) {
        add(sections: [section])
    }
    
    func insert(section: SectionProtocol, at index:Int) {
        insert(sections: [section], at: index)
    }
    
    func delete(section: SectionProtocol) {
        delete(sections: [section])
    }
    
    func add(sections: [SectionProtocol]) {
        /*let set = NSOrderedSet(orderedSet: innerSections)
        innerSections.addObjects(from: sections.toAraryOfObjects())
        
        if let adapter = adapter {
            let changes = innerSections.changes(other: set)
            changes.apply(adapter: adapter)
        }*/
    }
    
    func insert(sections: [SectionProtocol], at index:Int) {
        /*let set = NSOrderedSet(orderedSet: innerSections)
        innerSections.insert(sections.toAraryOfObjects(), at: index)
        
        if let adapter = adapter {
            let changes = innerSections.changes(other: set)
            changes.apply(adapter: adapter)
        }*/
    }
    
    func delete(sections: [SectionProtocol]) {
        /*let set = NSOrderedSet(orderedSet: innerSections)
        innerSections.removeObjects(in: sections.toAraryOfObjects())
        
        if let adapter = adapter {
            let changes = innerSections.changes(other: set)
            changes.apply(adapter: adapter)
        }*/
    }
}

extension Manager : AdapterInput {
    /*public func numberOfSections() -> Int {
        return innerSections.count
    }
    
    public func numberOfItems(inSection section: Int) -> Int {
        let section = innerSections[section] as! SectionProtocol
        return section.numberOfItem()
    }
    
    public func section(at index: Int) -> SectionProtocol {
        return innerSections[index] as! SectionProtocol
    }
    
    public func item(at indexPath: IndexPath) -> ItemProtocol {
        let section = innerSections[indexPath.section] as! SectionProtocol
        return section.item(at: indexPath.row)
    }*/
}
