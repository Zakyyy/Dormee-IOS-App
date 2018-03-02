//
//  CreateAnApartment.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

class CreateAnApartment {
    var name: String?
    var ignoreThisVar: Int?
    
    init() {}
    
    func descriptionInJSON() -> String {
        return Serialize.toJSON(obj: self)
    }
}
extension CreateAnApartment: Serializable {
    var jsonProperties:Array<String> {
        get {
            return ["name"]
        }
    }
    func valueForKey(key: String!) -> Any! {
        switch key {
        case "name":
            return self.name
        default:
            return nil
        }
    }
}

