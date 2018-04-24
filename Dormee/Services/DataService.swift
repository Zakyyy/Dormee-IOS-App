//
//  DataService.swift
//  Dormee
//
//  Created by Zaki on 2/11/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    var listOfApartmentDetails = [HomeScreenListDetail]()
    var listOfFlatShares = [HomeScreenListDetail]()
    var currentView = 0
    
    let apartmentsData : [String: Any] = [
        "numberOfApartments": 4,
        "apartments": [
            [
                "id": 1,
                "imageName":"hoodies.png",
                "price": "10$",
                "locationDescription":"near guc1",
                "rooms":"3 Roomss"
            ],
            [
                "id": 2,
                "imageName":"hoodies.png",
                "price": "20$",
                "locationDescription":"near guc2",
                "rooms":"3 Roomss"
            ],
            [
                "id": 3,
                "imageName":"hoodies.png",
                "price": "30$",
                "locationDescription":"near guc3",
                "rooms":"3 Roomss"
            ],
            [
                "id": 4,
                "imageName":"hoodies.png",
                "price": "40$",
                "locationDescription":"near guc4",
                "rooms":"3 Roomss"
            ]
            
            
        ],
    ]
    
    
    let flatSharesData : [String: Any] = [
        "numberOfFlatShares": 2,
        "flatShares": [
            [
                "imageName":"hoodies.png",
                "price": "1000$",
                "locationDescription":"near guc1",
                "rooms":"3 Roomss"
            ],
            [
                "imageName":"hoodies.png",
                "price": "2000$",
                "locationDescription":"near guc2",
                "rooms":"3 Roomss"
            ]
            
            
        ]
    ]
    
    var favouritesList = [HomeScreenListDetail]()
    
    func getNumberOfApartmentsOrFlats(checker: Int) -> Int {
        currentView = checker
        switch checker {
        case 0:
            return apartmentsData["numberOfApartments"] as! Int
        case 1:
            return flatSharesData["numberOfFlatShares"] as! Int            
        default:
            return apartmentsData["numberOfApartments"] as! Int
        }
    }
    
    func getApartmentsOrFlats() -> [[String: Any]] {
        switch currentView {
        case 0:
            return apartmentsData["apartments"] as! [[String : Any]]
        case 1:
            return flatSharesData["flatShares"] as! [[String: Any]]
        default:
            return apartmentsData["apartments"] as! [[String : Any]]
        }
        
    }
    
    func createAppList(arrayOfJsonApp: [[String: Any]]) {
        switch currentView {
        case 0:
            for appartment in arrayOfJsonApp {
                listOfApartmentDetails.append(HomeScreenListDetail(imageName: appartment["imageName"] as! String, price: appartment["price"] as! String, locationDescription: appartment["locationDescription"] as! String, roomsAndMeters: appartment["rooms"] as! String))
            }
        case 1:
            for flatShare in arrayOfJsonApp {
                listOfFlatShares.append(HomeScreenListDetail(imageName: flatShare["imageName"] as! String, price: flatShare["price"] as! String, locationDescription: flatShare["locationDescription"] as! String, roomsAndMeters: flatShare["rooms"] as! String))
            }
        default:
            return ()
        }
        
    }
    
    func getApartmentListDetails() -> [HomeScreenListDetail] {
        createAppList(arrayOfJsonApp: getApartmentsOrFlats())
        switch currentView {
        case 0:
            return listOfApartmentDetails
        case 1:
            return listOfFlatShares
        default:
            return listOfApartmentDetails
        }
        
    }
    
    func getFavourites() -> [HomeScreenListDetail] {
        return favouritesList
    }
    
    func addToFavourites(item: HomeScreenListDetail) {
        favouritesList.append(item)
    }
    
    func getNumberOfFavList() -> Int {
        return favouritesList.count
    }
    func printFav() {
        print(favouritesList)
    }
    
}
