//
//  Apartment.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/19/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

class Apartment {
    var title:String?
    var rooms:Int?
    var size:Int?
    var location:String?
    var price:Int?
    
    init(title:String, rooms:Int, size:Int, price:Int, location:String) {
        self.title = title
        self.rooms = rooms
        self.size = size
        self.price = price
        self.location = location
    }
}
