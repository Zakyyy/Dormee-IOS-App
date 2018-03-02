//
//  AdAddressViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class AdAddressViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate,  GMSAutocompleteViewControllerDelegate {
    
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressTextField: UITextField!
//    let googleAutoCompeteApi = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&types=establishment|geocode&&radius=500&language=en&key=%@"
//    var arrPlaces = NSMutableArray(capacity: 100)
//    let operationQueue = OperationQueue()
//    let googleServerkey = "AIzaSyBCj49T21W_3NhFV5DoJb_o98FrsVZmzk8"
    
    
    @IBOutlet weak var nextButton: UIButtonMid!
    @IBOutlet weak var theScrollView: UIScrollView!
    var location = [String: Double]()
    var latlng = [String: Double]()
    var isLatlng: Bool = false {
        didSet{
            DispatchQueue.main.async {
                self.changeMapCamera(lat: self.latlng["lat"]!, lng: self.latlng["lng"]!)
            }
//
            print("latlng: \(latlng)")
        }
    }
    var isLocationGranted: Bool = false {
        didSet {
            loadMap()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }


        // Do any additional setup after loading the view.
        
        var contentRect = CGRect.zero
        for view in theScrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        theScrollView.contentSize = contentRect.size
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        contentInset.bottom = (contentRect.height - theScrollView.frame.height) + nextButton.frame.height + 24
        theScrollView.contentInset = contentInset
        
        mapView.delegate = self

    }
    
    @IBAction func mapLocationButton(_ sender: Any) {
        if location["latitude"] != nil {
            let camera = GMSCameraPosition.camera(withLatitude: location["latitude"]!, longitude: location["longitude"]!, zoom: 6.0)
            mapView.animate(to: camera)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        location["latitude"] = locValue.latitude
        location["longitude"] = locValue.longitude
        isLocationGranted = true
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        print("position \(position)")
        let url = URL(string:"https://maps.googleapis.com/maps/api/geocode/json?latlng=\(position.target.latitude),\(position.target.longitude)&key=AIzaSyBCj49T21W_3NhFV5DoJb_o98FrsVZmzk8")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }

            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            var dictionary = json as? [String: Any]
            
            let results = dictionary!["results"] as! NSArray
             print("responseString = \(String(describing: results))")
            for result in (results as NSArray) {
                let resultDic = result as? [String: Any]
                print("responseString = \(String(describing: resultDic?["formatted_address"]))")
            }
//            dictionary = results[0] as? [String: Any]
//            print("responseString = \(String(describing: dictionary!["formatted_address"] ?? " " ))")
        }
        task.resume()
    }
    

    
    func loadMap() {
        print("locations is loaded" )
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: location["latitude"]!, longitude: location["longitude"]!, zoom: 6.0)
        mapView.animate(to: camera)
    }
    
    
    @IBAction func addressTFOnPress(_ sender: Any) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    func addressDidEndEditing(_ input:String) {
        var urlString = "https://maps.googleapis.com/maps/api/geocode/json?address=\(input)&key=AIzaSyBCj49T21W_3NhFV5DoJb_o98FrsVZmzk8"
        let url = URL(string:urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            var dictionary = json as? [String: Any]
            
            let results = dictionary!["results"] as! NSArray
            //            for result in (results as NSArray) {
            //                let resultDic = result as? [String: Any]
            //                print("responseString = \(String(describing: resultDic?["formatted_address"]))")
            //            }
            dictionary = results[0] as? [String: Any]
            dictionary = dictionary!["geometry"] as? [String: Any]
            dictionary = dictionary!["location"] as? [String: Any]
//            print("responseString = \(String(describing: dictionary!["location"] ?? " " ))")
            self.latlng["lat"] = dictionary!["lat"] as? Double
            self.latlng["lng"] = dictionary!["lng"] as? Double
            self.isLatlng = true

        }
        task.resume()
    }
    
    func changeMapCamera(lat: Double, lng:Double){
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 16.0)
        mapView.animate(to: camera)
    }
    
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        addressTextField.text = place.name
        addressDidEndEditing(place.name)
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    
    
    /*func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.beginSearching(searchText: searchText)
    }
    
    func beginSearching(searchText:String) {
        if searchText.count == 0 {
            self.arrPlaces.removeAllObjects()
//            self.tblOfflineCity.reloadData()
            return
        }
        
        operationQueue.addOperation { () -> Void in
            self.forwardGeoCoding(searchText: searchText)
        }
    }
    
    //MARK: - Search place from Google -
    func forwardGeoCoding(searchText:String) {
        googlePlacesResult(input: searchText) { (result) -> Void in
            let searchResult:NSDictionary = ["keyword":searchText,"results":result]
            if result.count > 0
            {
                let features = searchResult.value(forKey: "results") as! [AnyObject]
                self.arrPlaces = NSMutableArray(capacity: 100)
                for dictAddress in features   {
                    self.arrPlaces.add(dictAddress["description"]! ?? "")
                }
//                DispatchQueue.async(DispatchQueue.main, execute: {
//                    self.tblOfflineCity.reloadData()
//                });
            }
        }
    }
    
    //MARK: - Google place API request -
    func googlePlacesResult(input: String, completion: @escaping (_ result: NSArray) -> Void) {
        let searchWordProtection = input.replacingOccurrences(of: " ", with: "")
        if searchWordProtection.count != 0 {
            let urlString = NSString(format: googleAutoCompeteApi as NSString,input,googleServerkey)
            let url = NSURL(string: urlString.addingPercentEscapes(using: String.Encoding.utf8.rawValue)!)
            let defaultConfigObject = URLSessionConfiguration.default
            let delegateFreeSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: OperationQueue.main)
            let request = NSURLRequest(url: url! as URL)
            let task =  delegateFreeSession.dataTask(with: request as URLRequest,
            completionHandler: {
                (data, response, error) -> Void in
                if let data = data {
                    
                    do {
                        let jSONresult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        let results:NSArray = jSONresult["predictions"] as! NSArray
                        let status = jSONresult["status"] as! String
                        
                        if status == "NOT_FOUND" || status == "REQUEST_DENIED" {
                            
                            let userInfo:NSDictionary = ["error": jSONresult["status"]!]
                            let newError = NSError(domain: "API Error", code: 666, userInfo: (userInfo as! [NSObject : AnyObject]) as! [NSObject : AnyObject] as! [String : Any])
                            let arr:NSArray = [newError]
                            completion(arr)
                            return
                        } else {
                            completion(results)
                        }
                    }
                    catch {
                        print("json error: \(error)")
                    }
                } else if let error = error {
                    print(error)
    }
            })
            task.resume()
        }
    }*/
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
