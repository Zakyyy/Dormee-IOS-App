//
//  File.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/13/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import Foundation
import UIKit

class EditProfileViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    

    @IBOutlet weak var theScrollView: UIScrollView!
    var initialDict: Dictionary<String, Any> = [:]
    @IBOutlet weak var genderTextField: UIInputText!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var birthdateTextField: UIInputText!
    var gender = ["", "Male", "Female"]
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerToolbar: UIToolbar!
    @IBOutlet weak var firstNameTextField: UIInputText!
    @IBOutlet weak var lastNameTextField: UIInputText!
    @IBOutlet weak var emailTextField: UIInputText!
    @IBOutlet weak var phoneTextField: UIInputText!
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return gender[row]
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        genderTextField.text = (initialDict["gender"] as! String)
        birthdateTextField.text = (initialDict["birthdate"] as! String)
        firstNameTextField.text = (initialDict["first"] as! String)
        lastNameTextField.text = (initialDict["last"] as! String)
        emailTextField.text = (initialDict["email"] as! String)
        phoneTextField.text = (initialDict["phone"] as! String)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        view.addGestureRecognizer(tapRecognizer)
        
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        let strDate = dateFormatter.string(from: datePicker.date)
        birthdateTextField.text = strDate
    }
    
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderTextField.text = gender[row]
        self.genderPicker.isHidden = true
        self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        self.view.endEditing(true)
        self.genderPicker.isHidden = true
        self.datePicker.isHidden = true
        if (textField == self.genderTextField) {
            self.genderPicker.isHidden = false
            return false
        }
//        else
//            if (textField == self.birthdateTextField) {
////                if (self.birthdateTextField.text != "") {
////                    let dateFormater = DateFormatter()
////                    dateFormater.dateStyle = DateFormatter.Style.medium
////                    let date = dateFormater.date(from: self.birthdateTextField.text!)
////                    self.datePicker.setDate( date!, animated: false)
////                }
////                self.datePicker.isHidden = false;
////                self.datePickerToolbar.isHidden = false;
//
//                return false
//        }
        return true
    }
    let datePickerView:UIDatePicker = UIDatePicker()
    @IBAction func birthdayOnclick(_ sender: UIInputText) {
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        datePickerView.backgroundColor = UIColor.white
        
        sender.inputView = datePickerView
        
        datePickerToolbar.isHidden = false
        datePickerToolbar.barStyle = .default
        datePickerToolbar.isTranslucent = true
        datePickerToolbar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        datePickerToolbar.sizeToFit()
        self.datePickerToolbar.removeFromSuperview() // to enable inputAccessoryView
        sender.inputAccessoryView = self.datePickerToolbar

        birthdateTextField.tintColor = UIColor.clear
        
        
        if (!(self.birthdateTextField.text?.isEmpty)!) {
            let dateFormater = DateFormatter()
            dateFormater.dateStyle = DateFormatter.Style.medium
            let date = dateFormater.date(from: self.birthdateTextField.text!)
            datePickerView.setDate( date!, animated: false)
        }
        
    }
    
    
    @IBAction func dateDoneButtonClicked(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        dateFormatter.timeStyle = .none
        
        self.birthdateTextField.text = dateFormatter.string(from: datePickerView.date)
        self.birthdateTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.theScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        theScrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        theScrollView.contentInset = contentInset
        view.endEditing(true)
    }

    func hideKeyboard() {
        
    }
    
}
