//
//  TimelineHorizontal.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/22/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

@IBDesignable class TimelineHorizontal: UIStackView {
    //MARK: Initialization
    
    private var timelineImages = [UIImageView]()
    private var lineImages = [UIImageView]()
    
    @IBInspectable var imageSize: CGSize = CGSize(width: 32.0, height: 32.0) { didSet { setupButtons() } }
    @IBInspectable var imageCount: Int = 5 { didSet { setupButtons() } }
    @IBInspectable var pageNumber: Int = 1 { didSet { setupButtons() } }
    @IBInspectable var progress: Int = 0 { didSet { setupButtons() } }
    @IBInspectable var color: UIColor = #colorLiteral(red: 0, green: 0.4641795158, blue: 1, alpha: 1) { didSet { setupButtons() } }
    var progressSoFar: Int = 0
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
         setupButtons()
    }

    private func setupButtons() {
        
        for button in timelineImages {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        for button in lineImages {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        timelineImages.removeAll()
        lineImages.removeAll()
        
        let bundle = Bundle(for: type(of: self))
        let circleOutlineDot = UIImage(named: "circle-outline-dot", in: bundle, compatibleWith: self.traitCollection)
        let circleOutline = UIImage(named:"circle-outline", in: bundle, compatibleWith: self.traitCollection)
        let circleOutlineSmall = UIImage(named:"circle-outline-small", in: bundle, compatibleWith: self.traitCollection)
        let lineI = UIImage(named:"substract", in: bundle, compatibleWith: self.traitCollection)
        
        progressSoFar = progress
        for i in 0..<imageCount - 1 {
            // Create the button
            var image = UIImageView()
            let line = UIImageView()
            
            // set the images
            if(progressSoFar > 0) {
                image = createImage(imageI: circleOutlineDot!)
                progressSoFar -= 1
            } else {
                if (pageNumber >= i+1) {
                    image = createImage(imageI: circleOutline!)
                } else {
                    image = createImage(imageI: circleOutlineSmall!)
                }
            }
            line.image = lineI
            
            // Add constraints
            
            
            line.addConstraint(NSLayoutConstraint(item: line, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: imageSize.height))
            line.addConstraint(NSLayoutConstraint(item: line, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: imageSize.width * 2))
            line.tintColor = color
            
            // Add the button to the stack
            addArrangedSubview(image)
            addArrangedSubview(line)
            
            // Add the new button to the rating button array
            timelineImages.append(image)
            lineImages.append(line)
        }
        if(progressSoFar > 0) {
            let image = createImage(imageI: circleOutlineDot!)
            addArrangedSubview(image)
            timelineImages.append(image)
            progressSoFar -= 1
        } else {
            var image: UIImageView
            if (pageNumber == 5) {
                image = createImage(imageI: circleOutline!)
            } else {
                image = createImage(imageI: circleOutlineSmall!)
            }
            addArrangedSubview(image)
            timelineImages.append(image)
        }
        
    }
    
    func createImage(imageI: UIImage) -> UIImageView {
        let image = UIImageView()
        image.image = imageI
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.addConstraint(NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: imageSize.height))
        image.addConstraint(NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: imageSize.width))
        image.addConstraint(NSLayoutConstraint(item: image,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: image,
                                               attribute: .width,
                                               multiplier: 1 / 1,
                                               constant: 0))
        
        image.tintColor = color
        
        return image
    }

}
