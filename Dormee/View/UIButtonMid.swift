//
//  UIButton.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/13/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import UIKit

@IBDesignable
class UIButtonMid: UIButton {
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        layer.cornerRadius = 10;
        setTitleColor(UIColor.white, for: .normal)
        contentEdgeInsets = UIEdgeInsetsMake(8, 32, 8, 32)
        
    }
}
