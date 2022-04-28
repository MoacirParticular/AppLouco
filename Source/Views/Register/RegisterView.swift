//
//  RegisterView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class RegisterView: ViewDefault {
    
    // MARK: Closures
    var onNextTap: ((_ userVideModel: UserVideModel) -> Void)?
    var onPasswordWrong: (()->Void)?

    // MARK: Visual Elements
    
    lazy var emailAddressTextField = TextFieldDefault(placeholder: "Email address")
    lazy var passwordTextField = TextFieldDefault(placeholder: "Create password", isSecureTextEntry: true)
    
    lazy var nextButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Próximo")
        bt.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)

        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
        self.setupTextFields()
    }
    
    private func setupTextFields() {
        self.passwordTextField.delegate = self
        self.passwordTextField.keyboardType = .default
        self.emailAddressTextField.keyboardType = .emailAddress
    }
    
    @objc
    private func nextButtonTap() {
//        if !RegExp.checkPasswordComplexity(password: self.passwordTextField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
//            onPasswordWrong?()
//        }
        
        let userVidewModel = UserVideModel(model: UserModel(id: 0, email: emailAddressTextField.text ?? String.empty, password: passwordTextField.text ?? String.empty))

        onNextTap?(userVidewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextField {
            let t = RegExp.checkPasswordComplexity(password: textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true)
            
            if t {
                textField.layer.borderColor = UIColor.textFieldBorderColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//    }
}
