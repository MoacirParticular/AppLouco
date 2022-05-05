//
//  LoginViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import UIKit

class LoginViewController : ViewControllerDefault {
    var onRegisterTap: (() -> Void)?
    var onLoginTap: ((_ userVideModel: UserViewModel) -> Void)?
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onRegisterTap = { self.onRegisterTap?() }
        
        view.onLoginTap = {userViewModel in
            self.onLoginTap?(userViewModel)
        }
        
        view.onPasswordWrong = {
            self.presentAlert(withTitle: "Senha fora do padrão", message: "A senha deve conter um caracter especial, uma letra maiuscula uma minuscula e um numero com no mínimo 6 digitos")
        }
        
        return view
    }()

    override func loadView() {
        self.view = self.loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

