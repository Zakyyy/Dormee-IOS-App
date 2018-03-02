//
//  AdSpaceDetailsViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class AdSpaceDetailsViewController: UIViewController {

    @IBOutlet weak var placeSizeTestField: UITextField!
    
    @IBOutlet weak var bedrooms: UILabel!
    @IBOutlet weak var bathrooms: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBAction func plusMinusBTsOnClick(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 0: let bedroom: Int = Int(bedrooms.text!)!
            if bedroom > 0 {
             bedrooms.text = String(bedroom - 1)
        }
            break
        case 1: let bathroom: Int = Int(bathrooms.text!)!
        if bathroom > 0 {
            bathrooms.text = String(bathroom - 1)
        }
            break
        case 2: let levels: Int = Int(level.text!)!
        if levels > 0 {
            level.text = String(levels - 1)
        }
            break
 
        case 3: let bedroom: Int = Int(bedrooms.text!)!
        if bedroom < 15 {
            bedrooms.text = String(bedroom + 1)
        }
            break
     
        case 4: let bathroom: Int = Int(bathrooms.text!)!
        if bathroom < 15 {
            bathrooms.text = String(bathroom + 1)
        }
            break
        
        case 5: let levels: Int = Int(level.text!)!
        if levels < 15 {
            level.text = String(levels + 1)
        }
            break
        default:
            return
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
