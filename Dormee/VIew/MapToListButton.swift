//
//  MapToListButton.swift
//  Dormee
//
//  Created by Zaki on 3/16/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class MapToListButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        layer.cornerRadius = 10
    }
}
