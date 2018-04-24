//
//  RoundButton.swift
//  Dormee
//
//  Created by Zaki on 2/22/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class CircularButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.masksToBounds = false
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.5
        layer.cornerRadius = frame.width / 2
    }

}
