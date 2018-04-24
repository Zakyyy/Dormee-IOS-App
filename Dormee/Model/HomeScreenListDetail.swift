//
//  AppartmentListDetail.swift
//  Dormee
//
//  Created by Zaki on 2/10/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

struct HomeScreenListDetail {
    private(set) public var imageName: String
    private(set) public var price: String
    private(set) public var locationDescription: String
    private(set) public var roomsAndMeters: String
    
    
    init(imageName: String, price: String, locationDescription: String, roomsAndMeters: String) {
        self.imageName = imageName
        self.price = price
        self.locationDescription = locationDescription
        self.roomsAndMeters = roomsAndMeters
        
    }
}
