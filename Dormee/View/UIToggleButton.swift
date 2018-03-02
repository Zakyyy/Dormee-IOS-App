//
//  UIToggleButton.swift
//  Dormee
//
//  Created by Mark Ragaee on 2/23/18.
//  Copyright © 2018 Zaki. All rights reserved.
//

import UIKit

@IBDesignable class UIToggleButton: UIButton {

    var backgroundColorI: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }


    func customizeView() {
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .selected)
        setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        backgroundColor = backgroundColorI
        layer.cornerRadius = 10;
        contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)

    }

    override open var isSelected: Bool {
        didSet {
            isSelected ? setShadow(selected: true) : setShadow(selected: false)
        }
    }
    
    func setShadow(selected: Bool) {
        layer.shadowColor = selected ? UIColor.black.cgColor : UIColor.clear.cgColor
        layer.shadowOpacity = 0.12
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 8
        layer.cornerRadius = 8
        layer.shadowPath = UIBezierPath(rect: CGRect(x: -2,
                                                     y: 4,
                                                     width: self.frame.size.width + 4,
                                                     height: self.frame.size.height + 8)).cgPath
    }
}

//import UIKit
//
//@IBDesignable class UIToggleButton: UIButton {
//    var isToggle: Bool = true
//    var backgroundColorNormal: UIColor? = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
//        didSet {
//            backgroundColor = backgroundColorNormal
//        }
//    }
//    var backgroundColorHighlighted: UIColor? = #colorLiteral(red: 0.4188087583, green: 0.9928831458, blue: 1, alpha: 1)
//    var _backgroundColorHighlighted: UIColor? {
//        return backgroundColorHighlighted != nil ? backgroundColorHighlighted : backgroundColorNormal
//    }
//    var backgroundColorSelected: UIColor?
//    var _backgroundColorSelected: UIColor? {
//        return backgroundColorSelected != nil ? backgroundColorSelected : _backgroundColorHighlighted
//    }
//    var backgroundColorHighlightedSelected: UIColor? = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
//    var _backgroundColorHighlightedSelected: UIColor? {
//        return backgroundColorHighlightedSelected != nil ? backgroundColorHighlightedSelected : _backgroundColorHighlighted
//    }
//
//    override var isHighlighted: Bool {
//        didSet {
//            switch (isHighlighted, isSelected) {
//            case (true, false):
//                backgroundColor = _backgroundColorHighlighted
//            case (true, true):
//                backgroundColor = _backgroundColorHighlightedSelected
//            case (false, true):
//                backgroundColor = _backgroundColorSelected
//            default:
//                backgroundColor = backgroundColorNormal
//            }
//        }
//    }
//
//}
//
////    func setBGColor(color: UIColor?, forState state: UIControlState) {
////        switch state {
////        case UIControlState.Highlighted:
////            println("normal")
////        case UIControlState.Selected:
////            println("normal")
////        case UIControlState.Normal:
////            println("normal")
////        case UIControlState.Highlighted | UIControlState.Selected:
////            println("normal")
////        default: break
////        }
////    }


