//
//  HomeScreenCellList.swift
//  Dormee
//
//  Created by Zaki on 2/19/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class HomeScreenCellList: UITableViewCell {
        @IBOutlet weak var apartmentImage: UIImageView!
        @IBOutlet weak var apartmentPrice: UILabel!
        @IBOutlet weak var apartmentRooms: UILabel!
        @IBOutlet weak var locationDescription: UILabel!
        @IBOutlet weak var bgView: UIView!
        @IBOutlet weak var heartButton: UIButton!
        var imageName: String!
        //@IBOutlet weak var location: UILabel!

    @IBAction func heartButtonTabbed(_ sender: CircularButton) {
        DataService.instance.addToFavourites(item: HomeScreenListDetail(imageName: self.imageName, price: self.apartmentPrice.text!, locationDescription: self.locationDescription.text!, roomsAndMeters: self.apartmentRooms.text!))
        DataService.instance.printFav()
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    func customizeView() {
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOpacity = 0.54
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 4
        bgView.layer.cornerRadius = 4
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = self.apartmentImage.frame
//        rectShape.position = self.apartmentImage.center
//        rectShape.path = UIBezierPath(roundedRect: self.apartmentImage.bounds, byRoundingCorners: [.topRight , .topLeft], cornerRadii: CGSize(width: 4, height: 4)).cgPath
//
//        apartmentImage.layer.mask = rectShape
//        bgView.layer.shadowPath = UIBezierPath(rect: CGRect(x: -1,
//                                                          y: 2,
//                                                          width: self.bgView.frame.size.width + 2,
//                                                          height: self.bgView.frame.size.height + 4)).cgPath
//
    }
        func updateViews(apartment: HomeScreenListDetail) {
            imageName = apartment.imageName
            apartmentImage.image = UIImage(named: apartment.imageName)
            apartmentPrice.text = apartment.price
            apartmentRooms.text = apartment.roomsAndMeters
            locationDescription.text = apartment.locationDescription
            updateHeartButtons()
           // location.text = apartment.location
        }
    
    
    func updateHeartButtons() {
        let originalIm = UIImage(named: "icons8-heart-filled-50")
        let tintedIm = originalIm?.withRenderingMode(.alwaysTemplate)
        heartButton.setImage(tintedIm, for: .normal)
        heartButton.tintColor = .white
    }
    
    
        
    }

