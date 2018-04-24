//
//  RoundedImage.swift
//  Dormee
//
//  Created by Zaki on 2/26/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
