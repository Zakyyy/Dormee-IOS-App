//
//  FavouritesCellList.swift
//  Dormee
//
//  Created by Zaki on 3/7/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class FavouritesCellList: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var locationDescription: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var roomsAndMeters: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateView(item: HomeScreenListDetail) {
        itemImage.image = UIImage(named: item.imageName)
        locationDescription.text = item.locationDescription
        price.text = item.price
        roomsAndMeters.text = item.roomsAndMeters
        updateHeartButtons()
    }
    
    func updateHeartButtons() {
        let originalIm = UIImage(named: "icons8-heart-filled-50")
        let tintedIm = originalIm?.withRenderingMode(.alwaysTemplate)
        heartButton.setImage(tintedIm, for: .normal)
        heartButton.tintColor = .red
    }

}
