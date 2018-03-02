//
//  UIBorderTextView.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

@IBDesignable class UIBorderTextView: UITextView {

    @IBInspectable var placeholder: String = " "
    
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
        
        text = placeholder
        textColor = UIColor.lightGray
    }
    
    
//    func didBeginEditing(_ textView: UITextView) {
//        if textView.textColor == UIColor.lightGray {
//            textView.text = nil
//            textView.textColor = UIColor.black
//        }
//    }
//    
//    func didEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = placeholder
//            textView.textColor = UIColor.lightGray
//        }
//    }
    
}
