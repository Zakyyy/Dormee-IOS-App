//
//  UIDivider.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/11/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import UIKit

@IBDesignable
class UIDivider: UIView {
    
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        guard let backgroundColor = self.backgroundColor?.cgColor else { return }
        self.layer.borderColor = backgroundColor
        self.layer.borderWidth = (1.0 / UIScreen.main.scale) / 2;
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
}
