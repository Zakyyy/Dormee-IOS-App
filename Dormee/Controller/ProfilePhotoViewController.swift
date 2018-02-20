//
//  ProfilePhotoViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/20/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class ProfilePhotoViewController: UIViewController {

    var image:UIImage? = nil
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profileImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func editButtonOnClick(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let takeAction = UIAlertAction(title: "Take Photo", style: .default) { action in
            // ...
        }
        alertController.addAction(takeAction)
        
        let chooseAction = UIAlertAction(title: "Choose Photo", style: .default) { action in
            print(action)
        }
        alertController.addAction(chooseAction)
        
        self.present(alertController, animated: true, completion: nil)
        
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
