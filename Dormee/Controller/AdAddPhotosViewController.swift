//
//  AdAddPhotosViewController.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit
import AVFoundation

class AdAddPhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
     @IBOutlet weak var addFirstPhotoBt: UIFAB!
    var photos = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addFirstPhotoBt.iconFrac = 0.4
        
        // Do any additional setup after loading the view, typically from a nib.
        let spacing = collectionView.layer.frame.width * 0.043
        let viewWidth = collectionView.layer.frame.width - (spacing * 2)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        layout.itemSize = CGSize(width: viewWidth/3, height: viewWidth/3)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        collectionView!.collectionViewLayout = layout
        
        updateCollectionView()
    }
    
    func updateCollectionView() {
        if(photos.count == 0){
            collectionView.isHidden = true
            addFirstPhotoBt.isHidden = false
        } else {
            collectionView.isHidden = false
            addFirstPhotoBt.isHidden = true
        }
        collectionView.reloadData()
    }

    @IBAction func addPhotoOnPress(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let takeAction = UIAlertAction(title: "Take Photo", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            } else {
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                    if response {
                        //access granted
                        print("granted")
                    } else {
                        print("not granted")
                    }
                }
            }
        }
        alertController.addAction(takeAction)
        
        let chooseAction = UIAlertAction(title: "Choose Photo", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        alertController.addAction(chooseAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        photos += [image]
        updateCollectionView()
        dismiss(animated:true, completion: nil)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PhotosCollectionViewCell"
        
        if(indexPath.row == photos.count) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPhotosCollectionViewCell", for: indexPath) as? AddPhotosCollectionViewCell else {
                fatalError("The dequeued cell is not an instance of PhotoCollectionViewCell.")
            }
            cell.addPhotosButton.iconFrac = 0.4
            return cell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? PhotosCollectionViewCell else {
            fatalError("The dequeued cell is not an instance of PhotoCollectionViewCell.")
        }
        
        cell.photoImageView.image = photos[indexPath.row]
        return cell
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
