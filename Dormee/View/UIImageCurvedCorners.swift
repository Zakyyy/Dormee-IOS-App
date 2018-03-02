//
//  UIImageCurvedCorners.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/24/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

@IBDesignable class UIImageCurvedCorners: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        layer.masksToBounds = true
        layer.cornerRadius = 10;
        
    }

}
