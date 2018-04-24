//
//  FirstViewController.swift
//  Dormee
//
//  Created by Zaki on 2/10/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit
import GoogleMaps
class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var apartmentsTableView: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var MapToListButton: UIButton!
    @IBOutlet weak var listToMapButton: MapToListButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apartmentsTableView.delegate = self
        apartmentsTableView.dataSource = self
        mapView.isHidden = true
        
        
//        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
//        guard let url = URL(string: jsonUrlString) else {
//            return
//        }
//        URLSession.shared.dataTask(with: url) {
//            (data, response, err) in
//
//            guard let data = data else { return }
//
//            do{
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                print(json)
//            } catch let jsonErr{
//                print("Error ", jsonErr)
//            }
//
//        }.resume()
        

    }
    
    @IBAction func listToMapButtonTabbed(_ sender: Any) {
        apartmentsTableView.isHidden = true
        //self.MapToListButton.isHidden = false
        //listToMapButton.setTitle("List", for: .normal)
        self.mapView.isHidden = false
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let map = GMSMapView.map(withFrame: self.mapView.bounds, camera: camera)
        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = map
        self.mapView.addSubview(map)
        self.mapView.addSubview(MapToListButton)
        
    }
    
    @IBAction func MapToListButtonTabbed(_ sender: Any) {
        self.mapView.isHidden = true
        //self.MapToListButton.isHidden = true
        self.apartmentsTableView.isHidden = false
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getNumberOfApartmentsOrFlats(checker: segControl.selectedSegmentIndex)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenCellList") as? HomeScreenCellList{
                let appartmentDetail = DataService.instance.getApartmentListDetails()[indexPath.row]
                cell.updateViews(apartment: appartmentDetail)
                return cell
            } else {
                return HomeScreenCellList()
            }
        }
    
    @IBAction func valueChanged(_ sender: Any) {
        apartmentsTableView.reloadData()
    }
    
    

}

