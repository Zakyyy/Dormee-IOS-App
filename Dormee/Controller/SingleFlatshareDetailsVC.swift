//
//  SingleFlatshareDetailsVC.swift
//  Dormee
//
//  Created by Zaki on 3/1/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class SingleFlatshareDetailsVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize = contentView.frame.size
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        
        let SwiftLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeImageRight))
        SwiftLeft.direction = UISwipeGestureRecognizerDirection.left
        imageView.addGestureRecognizer(SwiftLeft)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipeImageRight(sendr: UISwipeGestureRecognizer) {
        if let swipeGesture = sendr as? UISwipeGestureRecognizer{
            imageView.image = UIImage(named: "Dormee")
        }
    }

}
