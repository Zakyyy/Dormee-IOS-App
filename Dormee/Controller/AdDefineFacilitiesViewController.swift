//
//  AdDefineFacilitiesViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class AdDefineFacilitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
       @IBOutlet weak var tableView: UITableView!
    
    var facilities = [Facility]()
    
    private func loadSampleFacilities() {
        let apa1 = Facility(title: "Furnished", subtitle: " ", selected: false)
        
        let apa2 = Facility(title: "Essentials", subtitle: "Towels, cups, plates, etc.", selected: false)
        
        let apa3 = Facility(title: "TV", subtitle: " ", selected: true)
        
        facilities += [apa1, apa2, apa3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor.white
        loadSampleFacilities()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return facilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FacilitiesCellTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FacilitiesCellTableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
        
        // Fetches the appropriate apartment for the data source layout.
        let facility = facilities[indexPath.row]
        
        cell.titleLabel.text = facility.title
        cell.subtitleLabel.text = facility.subtitle
        cell.isSelectedVar = facility.selected!
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        facilities[indexPath.row].selected = !facilities[indexPath.row].selected!
        (tableView.cellForRow(at: indexPath) as! FacilitiesCellTableViewCell).isSelectedVar = facilities[indexPath.row].selected!
        
        return indexPath
    }
    
    
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
