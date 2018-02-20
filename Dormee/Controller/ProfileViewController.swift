//
//  ProfileViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/15/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var profileImage: UICircularImage!
    @IBOutlet weak var userName: UITextView!
    @IBOutlet weak var email: UITextView!
    @IBOutlet weak var gender: UITextView!
    @IBOutlet weak var birthdate: UITextView!
    @IBOutlet weak var phone: UITextView!
    @IBOutlet weak var verified: UITextView!
    
    var initialDict: Dictionary<String, Any> = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageOnClick(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        db.collection("users").document("rqc2kvL5Kbl8qBWfNEbw").getDocument{ (document, error) in
            if let document = document {
                print("Document data: \(String(describing: document.data()))")
                if let first = document["first_name"] as? String, let last = document["last_name"] as? String {
                    self.userName.text = first + " " + last
                    self.initialDict["first"] = first
                    self.initialDict["last"] = last
                }
                if let email = document["email"] as? String {
                    self.email.text = email
                    self.initialDict["email"] = email
                }
                if let gender = document["gender"] as? String {
                    if gender.contains("male") {
                        self.gender.text = "Male"
                        self.initialDict["gender"] = "Male"
                    } else {
                        self.gender.text = "Female"
                        self.initialDict["gender"] = "Female"
                    }
                    
                }
                if let phone = document["phone"] as? String {
                    self.phone.text = phone
                    self.initialDict["phone"] = phone
                }
                if let verified = document["verification_status"] as? String {
                    self.verified.text = verified
                    self.initialDict["verified"] = verified
                }
                if let birthdate = document["birth_date"] as? Date {
                    print("birthdate")
                    let formatter = DateFormatter()
                    formatter.dateStyle = .medium
                    self.birthdate.text = formatter.string(from: birthdate as Date)
                    self.initialDict["birthdate"] = self.birthdate.text
                }
                if let image = document["profile_uri"] as? String {
                    let imageUrl:URL = URL(string: image)!
                    
                    // Start background thread so that image loading does not make app unresponsive
                    DispatchQueue.global(qos: .userInitiated).async {
                        
                        let imageData:NSData = NSData(contentsOf: imageUrl)!
                        
                        // When from background thread, UI needs to be updated on main_queue
                        DispatchQueue.main.async {
                            let image = UIImage(data: imageData as Data)
                            self.profileImage.image = image
                            self.initialDict["image"] = image
                        }
                    }
                }
            
                
                
            } else {
                print("Document does not exist")
            }
        }
    }
    
    @IBAction func editProfileOnPress(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        myVC.initialDict = self.initialDict
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    @objc func profileImageOnClick(tapGestureRecognizer: UITapGestureRecognizer) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "ProfilePhotoViewController") as! ProfilePhotoViewController
        myVC.image = self.profileImage.image
        navigationController?.pushViewController(myVC, animated: true)
        
    }


}
