//
//  MutableOrderedSet.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 20/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

class MutableOrderedSet<T: AnyObject> {
    private let innerOrderedSet = NSMutableOrderedSet()
    
    func add(objects array: [T]) {
        innerOrderedSet.addObjects(from: array)
    }
    
    func insert(objects array: [T], at index: Int) {
        innerOrderedSet.insert(array, at: index)
    }
    
    func remove(objects array: [T]) {
        innerOrderedSet.removeObjects(in: array)
    }
    
    func index(of object: T) -> Int {
        return innerOrderedSet.index(of: object)
    }
}
