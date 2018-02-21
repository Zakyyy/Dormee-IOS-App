//
//  UICardTableViewCell.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/19/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class UICardTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var priceTextView: UITextView!
    @IBOutlet weak var roomSizeTextView: UITextView!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.54
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = 4
        let rectShape = CAShapeLayer()
        rectShape.bounds = self.adImageView.frame
        rectShape.position = self.adImageView.center
        rectShape.path = UIBezierPath(roundedRect: self.adImageView.bounds, byRoundingCorners: [.topRight , .topLeft], cornerRadii: CGSize(width: 4, height: 4)).cgPath

        adImageView.layer.mask = rectShape
        view.layer.shadowPath = UIBezierPath(rect: CGRect(x: -1,
                                                          y: 2,
                                                          width: self.view.frame.size.width + 2,
                                                          height: self.view.frame.size.height + 4)).cgPath
//        view.layer.shouldRasterize = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
