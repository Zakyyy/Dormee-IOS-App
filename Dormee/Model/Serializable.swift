//
//  Serializable.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

@objc protocol Serializable {
    var jsonProperties:Array<String> { get }
    func valueForKey(key: String!) -> Any!
}

struct Serialize {
    static func toDictionary(obj:Serializable) -> NSDictionary {
        // make dictionary
        var dict = Dictionary<String, Any>()
        
        // add values
        for prop in obj.jsonProperties {
            let val:Any! = obj.valueForKey(key: prop)
            
            if (val is String)
            {
                dict[prop] = val as! String
            }
            else if (val is Int)
            {
                dict[prop] = val as! Int
            }
            else if (val is Double)
            {
                dict[prop] = val as! Double
            }
            else if (val is Array<String>)
            {
                dict[prop] = val as! Array<String>
            }
            else if (val is Serializable)
            {
                dict[prop] = toJSON(obj: val as! Serializable)
            }
            else if (val is Array<Serializable>)
            {
                var arr = Array<NSDictionary>()
                
                for item in (val as! Array<Serializable>) {
                    arr.append(toDictionary(obj: item))
                }
                
                dict[prop] = arr
            }
            
        }
        
        // return dict
        return dict as NSDictionary
    }
    
    static func toJSON(obj:Serializable) -> String {
        // get dict
        let dict = toDictionary(obj: obj)
        
        // make JSON
        var data: Data?
        do {
            try data  = JSONSerialization.data(withJSONObject: dict, options:JSONSerialization.WritingOptions(rawValue: 0))
            print("yes")
        } catch{
            print("no")
        }
        
        
        // return result
        return NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
    }
}
