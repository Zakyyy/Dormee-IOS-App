//
//  Facility.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

class Facility {
    
    var title: String?
    var subtitle: String?
    var selected: Bool?
    init(title:String, subtitle: String, selected: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.selected = selected
    }
}
