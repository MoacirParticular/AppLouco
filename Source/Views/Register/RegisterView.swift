//
//  RegisterView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class RegisterView: ViewDefault {
    
    // MARK: Closures
    var onRegisterTap: ((_ userVideModel: UserViewModel) -> Void)?
    var onLoginTap: (() -> Void)?
    var onPasswordWrong: (()->Void)?

    // MARK: Visual Elements
    lazy var titleLabel = LabelDefault(text: "Registrar", font: UIFont.systemFont(ofSize: 25, weight: .bold))

    lazy var emailAddressTextField = TextFieldDefault(placeholder: "Endereço de Email")
    lazy var passwordTextField = TextFieldDefault(placeholder: "Crie sua Senha", isSecureTextEntry: true)
    
    lazy var nextButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Registrar")
        bt.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        return bt
    }()
    
    lazy var loginButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Logar")
        bt.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
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
    private func loginButtonTap() {
        onLoginTap?()
    }
    
    @objc
    private func nextButtonTap() {
        if !RegExp.checkPasswordComplexity(password: self.passwordTextField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            onPasswordWrong?()
        } else {
            let userVidewModel = UserViewModel(model: UserModel(id: 0, email: emailAddressTextField.text ?? String.empty, password: passwordTextField.text ?? String.empty))

            onRegisterTap?(userVidewModel)
        }
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
}
