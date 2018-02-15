//
//  File.swift
//  Dormee_playground
//
//  Created by Mark Ragaee on 2/13/18.
//  Copyright © 2018 Mark Ragaee. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    

    @IBOutlet weak var genderTextField: UIInputText!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var birthdateTextField: UIInputText!
    var gender = ["", "Male", "Female"]
    @IBOutlet weak var datePicker: UIDatePicker!
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
        else
            if (textField == self.birthdateTextField) {
                print("date: ", birthdateTextField.text)
                if (self.birthdateTextField.text != "") {
                    let dateFormater = DateFormatter()
                    dateFormater.dateStyle = DateFormatter.Style.medium
                    let date = dateFormater.date(from: self.birthdateTextField.text!)
                    self.datePicker.setDate( date!, animated: false)
                }
                self.datePicker.isHidden = false;
                return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
}
