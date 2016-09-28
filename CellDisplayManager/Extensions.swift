//
//  Categories.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 09/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

extension NSOrderedSet {
    func changes(other: NSOrderedSet) -> Changes {
        let inserted = NSMutableOrderedSet(orderedSet: other)
        inserted.minusSet(self.set)
        
        let deleted = NSMutableOrderedSet(orderedSet: self)
        deleted.minusSet(other.set)
        
        let moved = NSMutableOrderedSet(orderedSet: other)
        moved.intersectSet(self.set)
        
        let changes = Changes()
        for object in inserted {
            changes.insert(at: other.index(of: object))
        }
        for object in deleted {
            changes.delete(at: self.index(of: object))
        }
        for object in moved {
            let from = self.index(of: object)
            let to = other.index(of: object)
            if from != to {
                changes.move(from: from, to: to)
            }
        }
        return changes
    }
}

extension Array {
    func toAraryOfObjects() -> [AnyObject] {
        var array = [AnyObject]()
        for value in self {
            array.append(value as AnyObject)
        }
        return array
    }
}

extension IndexSet {
    static func indexSet(array: [Int]) -> IndexSet {
        var indexSet = IndexSet()
        for i in array {
            indexSet.insert(i)
        }
        return indexSet
    }
}

extension IndexPath {
    static func indexPaths(section: Int, indices: [Int]) -> [IndexPath] {
        var indexPaths = [IndexPath]()
        for i in indices {
            indexPaths.append(IndexPath(row: i, section: section))
        }
        return indexPaths
    }
    
    static func movedIndexPaths(section:Int, moves: (from: Int, to: Int)) -> (IndexPath, IndexPath) {
        return (IndexPath(row: moves.from, section: section), IndexPath(row: moves.to, section: section))
    }
}
