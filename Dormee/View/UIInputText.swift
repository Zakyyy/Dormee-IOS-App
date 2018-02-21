//
//  UIInputText.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/13/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import UIKit

@IBDesignable
class UIInputText: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16);
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.541202911)
        

        if let p = placeholder {
            let place = NSAttributedString(string: p,
                                           attributes: [.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5379387842)])
            attributedPlaceholder = place
            textColor = UIColor.black
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
