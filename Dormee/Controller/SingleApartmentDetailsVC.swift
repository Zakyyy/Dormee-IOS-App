//
//  SingleApartmentDetailsVC.swift
//  Dormee
//
//  Created by Zaki on 2/26/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class SingleApartmentDetailsVC: UIViewController {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLayoutSubviews() {
        self.scrollView.contentSize = CGSize.init(width: 375, height: 1560)
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
