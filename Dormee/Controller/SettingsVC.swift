//
//  SettingsVC.swift
//  Dormee
//
//  Created by Zaki on 3/7/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var ownerView: UIView!
    @IBOutlet weak var renterView: UIView!
    @IBOutlet weak var icon: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //ownerView.isHidden = true
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchToOwnerTabbed(_ sender: RoundedButton) {
//        let originalIm = UIImage(named:"icons8-bath-26")
//        let tintedIm = originalIm?.withRenderingMode(.alwaysTemplate)
//        icon.setImage(tintedIm, for: .normal)
//        icon.tintColor = .red
        renterView.removeFromSuperview()
        ownerView.isHidden = false
    }
}
