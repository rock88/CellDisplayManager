//
//  Changes.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 13/08/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

class Changes {
    private var inserted = [Int]()
    private var deleted = [Int]()
    private var reloaded = [Int]()
    private var moved = [(Int, Int)]()
    private var hasChanges: Bool {
        return inserted.count > 0 || deleted.count > 0 || reloaded.count > 0 || moved.count > 0
    }
    
    var section: Int?
    
    func insert(at index: Int) {
        inserted.append(index)
    }
    
    func delete(at index: Int) {
        deleted.append(index)
    }
    
    func reload(at index: Int) {
        reloaded.append(index)
    }
    
    func move(from: Int, to: Int) {
        moved.append((from, to))
    }
    
    func apply(adapter: AdapterOutput, batch: Bool = true) {
        if hasChanges {
            if batch {
                adapter.performBatchUpdates {
                    self._apply(adapter: adapter)
                }
            } else {
                _apply(adapter: adapter)
            }
        }
    }
    
    private func _apply(adapter: AdapterOutput) {
        if let section = section {
            if reloaded.count > 0 {
                adapter.reload(items: IndexPath.indexPaths(section: section, indices: reloaded))
            }
            
            if inserted.count > 0 {
                adapter.insert(items: IndexPath.indexPaths(section: section, indices: inserted))
            }
            
            for moves in moved {
                let (from, to) = IndexPath.movedIndexPaths(section: section, moves: moves)
                adapter.move(item: from, to: to)
            }
            
            if deleted.count > 0 {
                adapter.delete(items: IndexPath.indexPaths(section: section, indices: deleted))
            }
        } else {
            if reloaded.count > 0 {
                adapter.reload(sections: IndexSet.indexSet(array: reloaded))
            }
            
            if inserted.count > 0 {
                adapter.insert(sections: IndexSet.indexSet(array: inserted))
            }
            
            for (from, to) in moved {
                adapter.move(section: from, to: to)
            }
            
            if deleted.count > 0 {
                adapter.delete(sections: IndexSet.indexSet(array: deleted))
            }
        }
    }
    
    func printChanges() {
        print("Insert: \(inserted)")
        print("Delete: \(deleted)")
        print("Reload: \(reloaded)")
        print("Moved: \(moved)")
    }
    
}
