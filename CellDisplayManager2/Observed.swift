//
//  Observed.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 06/10/2016.
//  Copyright © 2016 rock88. All rights reserved.
//

import Foundation

class Observed<T> {
    private var handler: ((T?) -> Void)?
    private var immediate: Bool
    
    var value: T? {
        didSet {
            if let handler = handler {
                handler(value)
            }
        }
    }
    
    init(value: T?, immediate: Bool = true) {
        self.value = value
        self.immediate = immediate
    }
    
    func bind(handler: @escaping ((T?) -> Void)) {
        self.handler = handler
        
        if (immediate) {
            handler(value)
        }
    }
    
    func unbind() {
        handler = nil
    }
    
    static func +=(left: Observed<T>, right: T?) -> Observed<T> {
        left.value = right
        return left
    }
}


