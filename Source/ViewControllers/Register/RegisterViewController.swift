//
//  RegisterViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class RegisterViewController : ViewControllerDefault {
    var onNextTap: (() -> Void)?
    
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onNextTap = {
            self.onNextTap?()
        }
        
        view.onPasswordWrong = {
            let messageError = UIAlertController(title: "Senha fora do padrão", message: "A senha deve conter um caracter especial, uma letra maiuscula uma minuscula e um numero com no mínimo 6 digitos", preferredStyle: .alert)
            messageError.addAction(UIAlertAction(title: "OK", style: .default))
            self.navigationController?.present(messageError, animated: true) 
        }
        
//        self.afterHideKeyboard = {
//            view.afterHideKeyboard()
//        }
//        
//        self.afterShowKeyboard = {height in
//            view.afterShowKeyboard(height)
//        }
        
        
        
        return view
    }()

    override func loadView() {
        self.view = self.registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
    }
}
