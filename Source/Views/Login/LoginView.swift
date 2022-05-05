//
//  LoginView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import UIKit

class LoginView: ViewDefault {
    
    // MARK: Closures
    var onLoginTap: ((_ userVideModel: UserViewModel) -> Void)?
    var onRegisterTap: (() -> Void)?
    var onPasswordWrong: (()->Void)?

    // MARK: Visual Elements
    
    lazy var titleLabel = LabelDefault(text: "Entrar", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    
    lazy var emailAddressTextField = TextFieldDefault(placeholder: "Endereço de Email")
    lazy var passwordTextField = TextFieldDefault(placeholder: "Digite sua senha ", isSecureTextEntry: true)
    
    lazy var loginButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Entrar")
        bt.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return bt
    }()
    
    lazy var registerButton: ButtonDefault = {
        let bt = ButtonDefault(title: "Registrar")
        bt.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
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
    private func registerButtonTap() {
        onRegisterTap?()
    }
    
    @objc
    private func loginButtonTap() {
//        if !RegExp.checkPasswordComplexity(password: self.passwordTextField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
//            onPasswordWrong?()
//        }
        
        let userVidewModel = UserViewModel(model: UserModel(id: 0, email: emailAddressTextField.text ?? String.empty, password: passwordTextField.text ?? String.empty))

        onLoginTap?(userVidewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: UITextFieldDelegate {
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
