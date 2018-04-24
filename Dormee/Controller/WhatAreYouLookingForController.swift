//
//  WhatAreYouLookingForController.swift
//  Dormee
//
//  Created by Zaki on 2/21/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class WhatAreYouLookingForController: UIViewController {
    @IBOutlet weak var lookingBut: UIButton!
    @IBOutlet weak var offeringBut: UIButton!
    @IBOutlet weak var proceedBut: CircularButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedBut.isEnabled = false
    }
    
    @IBAction func lookingButTabbed(_ sender: UIButton) {
        offeringBut.isSelected = false
        lookingBut.isSelected = true
        proceedBut.isEnabled = true
    }
    
    
    @IBAction func offeringButTabbed(_ sender: UIButton) {
        lookingBut.isSelected = false
        offeringBut.isSelected = true
        proceedBut.isEnabled = true
        
    }
    
}
