//
//  Appearance.swift
//  CellDisplayManagerApp
//
//  Created by rock88 on 06/10/2016.
//  Copyright © 2016 rock88. All rights reserved.
//

import UIKit

class Appearance {
    let backgroundColor = Observed<UIColor>(value: nil)
    let cornerRadius = Observed<CGFloat>(value: 0.0)
    let borderWidth = Observed<CGFloat>(value: 0.0)
    let borderColor = Observed<UIColor>(value: nil)
    
    func bind(view: UIView) {
        backgroundColor.bind { value in
            view.backgroundColor = value
        }
        cornerRadius.bind { value in
            if let value = value {
                view.layer.cornerRadius = value
            }
        }
        borderWidth.bind { value in
            if let value = value {
                view.layer.borderWidth = value
            }
        }
        borderColor.bind { value in
            view.layer.borderColor = value?.cgColor
        }
    }
    
    func unbind() {
        backgroundColor.unbind()
        cornerRadius.unbind()
        borderWidth.unbind()
        borderColor.unbind()
    }
}
