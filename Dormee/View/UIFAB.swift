//
//  UIFAB.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

@IBDesignable class UIFAB: UIButton {

    var backgroundColorI: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var iconFrac: CGFloat = 0.75 {
        didSet {
            customizeView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        backgroundColor = backgroundColorI
        layer.cornerRadius = frame.width / 2;
        setTitleColor(UIColor.white, for: .normal)
//        contentEdgeInsets = UIEdgeInsetsMake(8, 32, 8, 32)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.cornerRadius = frame.width / 2
//        layer.shadowPath = UIBezierPath(rect: CGRect(x: -2,
//                                                     y: 4,
//                                                     width: self.frame.size.width + 4,
//                                                     height: self.frame.size.height + 8)).cgPath
        
        imageEdgeInsets = UIEdgeInsets(top: frame.width * iconFrac, left: frame.width * iconFrac, bottom: frame.width * iconFrac, right: frame.width * iconFrac)
    }
    
    override open var isEnabled: Bool {
        didSet {
            if(isEnabled) {
                alpha = 1.0
            } else {
                alpha = 0.12
            }
        }
    }

}
