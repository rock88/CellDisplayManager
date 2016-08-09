//
//  Item.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

public protocol ItemProtocol {
    var cellNibName:String? { get }
    var cellClassName:String? { get }
}

public class Item : ItemProtocol {
    public var cellNibName:String?
    public var cellClassName:String?
    
}
