//

//  RegisterPersonalDataViewExtensions.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

extension RegisterPersonalDataView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == cpfTextField {
            
            //MARK:- If Delete button click
           
            
            if textField.text?.count == 3 || textField.text?.count == 7 {
                textField.text = textField.text! + "."
            } else if textField.text?.count == 11 {
                textField.text = textField.text! + "-"
            }
            
            if (textField.text?.count ?? 0) < 14 {
                textField.layer.borderColor = UIColor.red.cgColor
            } else if textField.text?.isValidCPF ?? false {
              textField.layer.borderColor = UIColor.textFieldBorderColor
            }
            
            textField.text = String(textField.text!.prefix(14))
        }
    }
    
}

extension RegisterPersonalDataView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePickerView {
            return Age.asArray.count
        } else if pickerView == genderPickerView {
            return Gender.asArray.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == agePickerView {
            return Age.allCases[row].rawValue
        } else if pickerView == genderPickerView {
            return Gender.allCases[row].rawValue
        }
        
        return String.empty
    }
}
