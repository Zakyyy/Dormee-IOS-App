//
//  SavedVC.swift
//  Dormee
//
//  Created by Zaki on 3/9/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class SavedVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var favTableView: UITableView!
    @IBOutlet weak var noSavedItemsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noSavedItemsLabel.isHidden = true
        favTableView.dataSource = self
        favTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if DataService.instance.getNumberOfFavList() == 0 {
            favTableView.isHidden = true
            noSavedItemsLabel.isHidden = false
        }
        else{
            favTableView.isHidden = false
            noSavedItemsLabel.isHidden = true
        }
        return DataService.instance.getNumberOfFavList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell") as? FavouritesCellList{
            let appartmentDetail = DataService.instance.getFavourites()[indexPath.row]
            cell.updateView(item: appartmentDetail)
            return cell
        } else {
            return FavouritesCellList()
        }

    }
}
