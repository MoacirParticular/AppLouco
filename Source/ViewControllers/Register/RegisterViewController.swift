//
//  RegisterViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class RegisterViewController : ViewControllerDefault {
    var onRegisterTap: ((_ userVideModel: UserViewModel) -> Void)?
    var onLoginTap: (() -> Void)?

    lazy var registerView: RegisterView = {
        let view = RegisterView()

        view.onLoginTap = {
            self.onLoginTap?()            
        }

        view.onRegisterTap = {userViewModel in
            self.onRegisterTap?(userViewModel)
        }

        view.onPasswordWrong = {
            self.presentAlert(withTitle: "Senha fora do padrão", message: "A senha deve conter um caracter especial, uma letra maiuscula uma minuscula e um numero com no mínimo 6 digitos")
        }

        return view
    }()

    override func loadView() {
        self.view = self.registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
