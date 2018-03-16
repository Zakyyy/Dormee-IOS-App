//
//  AdMainViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

class AdMainViewController: UIViewController {

    @IBOutlet weak var theScrollView: UIScrollView!
    @IBOutlet weak var theView: UIView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    var completed = [Bool]()

    
    @IBOutlet weak var addPhotosButton: UIButton!
    @IBOutlet weak var defineFacilitiesSV: UIStackView!
    @IBOutlet weak var describePlaceSV: UIStackView!
    @IBOutlet weak var spaceDetailsSV: UIStackView!
    @IBOutlet weak var setAddressSV: UIStackView!
    @IBOutlet weak var setPriceSV: UIStackView!
    
    
    @IBOutlet weak var describePlaceCM: UIImageView!
    @IBOutlet weak var defineFacilitiesCM: UIImageView!
    @IBOutlet weak var spaceDetailsCM: UIImageView!
    @IBOutlet weak var setAddressCM: UIImageView!
    @IBOutlet weak var setPriceCM: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        var contentRect = CGRect.zero
        for view in theView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        theScrollView.contentSize = contentRect.size
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        contentInset.bottom = (contentRect.height - theScrollView.frame.height) + buttonsStackView.frame.height + 24
        theScrollView.contentInset = contentInset
        
        
        //set onPress func to stackviews
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(defineFacilitiesOnPress(tapGestureRecognizer:)))
        defineFacilitiesSV.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(describePlaceOnPress(tapGestureRecognizer:)))
        describePlaceSV.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(spaceDetailsOnPress(tapGestureRecognizer:)))
        spaceDetailsSV.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(setAddressOnPress(tapGestureRecognizer:)))
        setAddressSV.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(setPriceOnPress(tapGestureRecognizer:)))
        setPriceSV.addGestureRecognizer(tapGestureRecognizer)
        
        completed = [false, false, false, false, false]
        
        describePlaceCM.alpha = 0.12
        setAddressCM.alpha = 0.12
        defineFacilitiesCM.alpha = 0.12
        setPriceCM.alpha = 0.12
        spaceDetailsCM.alpha = 0.12
        
    }
    
    
    
    @objc func describePlaceOnPress(tapGestureRecognizer: UITapGestureRecognizer){
        openNextDetails()
    }
    
    @objc func setAddressOnPress(tapGestureRecognizer: UITapGestureRecognizer){
        if(completed[0]){
            openNextDetails()
        }
    }
    
    @objc func spaceDetailsOnPress(tapGestureRecognizer: UITapGestureRecognizer){
        if(completed[1]){
            openNextDetails()
        }
    }
    
    @objc func defineFacilitiesOnPress(tapGestureRecognizer: UITapGestureRecognizer){
        if(completed[2]){
            openNextDetails()
        }
    }
    
    @objc func setPriceOnPress(tapGestureRecognizer: UITapGestureRecognizer){
        if(completed[3]){
            openNextDetails()
        }
    }

    @IBAction func addPhotosOnPress(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "AdAddPhotosViewController") as! AdAddPhotosViewController
        navigationController?.pushViewController(myVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func openNextDetails() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if(!completed[0]){
            let myVC = storyboard?.instantiateViewController(withIdentifier: "AdDescribePlaceViewController") as! AdDescribePlaceViewController
            navigationController?.pushViewController(myVC, animated: true)
            return
        }
        if(!completed[1]){
            let myVC = storyboard?.instantiateViewController(withIdentifier: "AdAddressViewController") as! AdAddressViewController
            navigationController?.pushViewController(myVC, animated: true)
            return
        }
        if(!completed[2]){
            let myVC = storyboard?.instantiateViewController(withIdentifier: "AdSpaceDetailsViewController") as! AdSpaceDetailsViewController
            navigationController?.pushViewController(myVC, animated: true)
            return
        }
        if(!completed[3]){
            let myVC = storyboard?.instantiateViewController(withIdentifier: "AdDefineFacilitiesViewController") as! AdDefineFacilitiesViewController
            navigationController?.pushViewController(myVC, animated: true)
            return
        }
        if(!completed[4]){
            let myVC = storyboard?.instantiateViewController(withIdentifier: "AdPriceViewController") as! AdPriceViewController
            navigationController?.pushViewController(myVC, animated: true)
            return
        }
        let myVC = storyboard?.instantiateViewController(withIdentifier: "AdDescribePlaceViewController") as! AdDescribePlaceViewController
        navigationController?.pushViewController(myVC, animated: true)
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
