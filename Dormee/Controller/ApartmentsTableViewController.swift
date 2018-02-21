//
//  ApartmentsTableViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/19/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class ApartmentsTableViewController: UITableViewController {
    
    var apartments = [Apartment]()
    
    private func loadSampleApartments() {
        let apa1 = Apartment(title: "Apartment near GUC", rooms: 3, size: 110, price: 1800, location: "New Cairo")
        
        let apa2 = Apartment(title: "Apartment near GUC", rooms: 3, size: 110, price: 1800, location: "New Cairo")
        
        let apa3 = Apartment(title: "Apartment near GUC", rooms: 3, size: 110, price: 1800, location: "New Cairo")
        
        apartments += [apa1, apa2, apa3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.separatorColor = UIColor.white
        loadSampleApartments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apartments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "UICardTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UICardTableViewCell else {
                        fatalError("The dequeued cell is not an instance of MealTableViewCell.")
                    }
        
        // Fetches the appropriate apartment for the data source layout.
        let apartment = apartments[indexPath.row]
        
        cell.titleTextView.text = apartment.title
        cell.locationTextField.text = apartment.location
        cell.priceTextView.text = "\(String(describing: apartment.price!)) EGP"
        cell.roomSizeTextView.text = "\(String(describing: apartment.rooms!)) ROOMS - \(String(describing: apartment.size!))M"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
