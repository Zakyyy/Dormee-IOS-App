//
//  UICircularImage.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/13/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import UIKit

@IBDesignable
class UICircularImage: UIImageView {
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        self.layer.cornerRadius = self.frame.size.width/2;
        self.clipsToBounds = true;
        

    }
}
