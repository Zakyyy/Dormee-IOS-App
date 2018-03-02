//
//  FacilitiesCellTableViewCell.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class FacilitiesCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var isSelectedImage: UIImageView!
    
    var isSelectedVar: Bool = false {
        didSet {
            isSelectedImageOnPress()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isSelectedImage.tintColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func isSelectedImageOnPress() {
        let bundle = Bundle(for: type(of: self))
        isSelectedImage.image = isSelectedVar ? UIImage(named: "circle-outline-dot", in: bundle, compatibleWith: self.traitCollection) : UIImage(named: "circle-outline", in: bundle, compatibleWith: self.traitCollection)
    }

}
