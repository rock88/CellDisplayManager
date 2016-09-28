//
//  Appearance.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 28/07/16.
//  Copyright © 2016 rock88. All rights reserved.
//

import UIKit

protocol AppearanceAppled {
    
}

protocol Appearance {
    var backgroundColor: UIColor? { get }
    var borderColor: UIColor? { get }
    func apply(any: AppearanceAppled)
}

extension Appearance {
    var borderColor: UIColor? {
        return UIColor.clear
    }
}

struct LabelAppearance : Appearance {
    var title: NSString?
    var attributedTitle: NSString?
    var font: UIFont?
    var textColor: UIColor?
    var backgroundColor: UIColor?
    
    func apply(any: AppearanceAppled) {
        
    }
}
