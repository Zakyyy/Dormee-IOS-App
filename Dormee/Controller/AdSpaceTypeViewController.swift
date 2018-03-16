//
//  AdSpaceTypeViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class AdSpaceTypeViewController: UIViewController {

    @IBOutlet weak var apartmentButton: UIToggleButton!
    
    @IBOutlet weak var continueButton: UIButtonMid!
    @IBOutlet weak var flatshareButton: UIToggleButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.isEnabled = false
        // Do any additional setup after loading the view.
        
        var createAn = CreateAnApartment()
        print(createAn.descriptionInJSON())
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
    
    @IBAction func apartmentOnClick(_ sender: UIToggleButton) {
        flatshareButton.isSelected = false
        sender.isSelected = sender.isSelected ? false : true
        toggleContinueButton()
    }
    @IBAction func FlatshareOnClick(_ sender: UIToggleButton) {
        apartmentButton.isSelected = false
        sender.isSelected = sender.isSelected ? false : true
        toggleContinueButton()
    }
    @IBAction func continueOnClick(_ sender: Any) {
        if(apartmentButton.isSelected){
            print("apartment")
        }else {
            print("flatshare")
        }
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "AdMainViewController") as! AdMainViewController
//        myVC.image = self.profileImage.image
        navigationController?.pushViewController(myVC, animated: true)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func toggleContinueButton() {
        if(apartmentButton.isSelected || flatshareButton.isSelected){
            continueButton.isEnabled = true
        } else {
            continueButton.isEnabled = false
        }
    }
    
}
