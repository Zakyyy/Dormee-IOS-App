//
//  RoundedButton.swift
//  Dormee
//
//  Created by Zaki on 2/26/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
}
