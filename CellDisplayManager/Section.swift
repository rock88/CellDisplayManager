//
//  Section.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

public protocol SectionProtocol : AnyObject {
    func numberOfItem() -> Int
    func item(at index: Int) -> ItemProtocol
}

public class Section {
    private var innerItems = NSMutableOrderedSet()
    
}

extension Section : SectionProtocol {
    public func numberOfItem() -> Int {
        return innerItems.count
    }
    
    public func item(at index: Int) -> ItemProtocol {
        return innerItems[index] as! ItemProtocol
    }
}
