//
//  RegisterCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onLoginTap = {
            self.startLoginCoordinator()
        }
        
        viewController.onRegisterTap = { userVidewModel in
            self.saveKeyChain(viewModel: userVidewModel)
        }
        
        DispatchQueue.main.async {
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    private func startLoginCoordinator() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
    private func goProfile(userVidewModel: UserViewModel) {
        let viewModel = CoordinatorViewModel()
        viewModel.userViewModel = userVidewModel
        
        let coordinator = ProfileCoordinator(navigationController: self.navigationController, coordinatorViewModel: viewModel)
        coordinator.start()
    }
    
    private func erroRegister() {
        self.navigationController.presentAlert(withTitle: "Erro", message: "Não foi possível salvar o usuário!")
    }
    
    private func saveKeyChain(viewModel: UserViewModel) {
        let accessToken = viewModel.password
        let data = Data(accessToken.utf8)
        let result = KeychainHelper.standard.save(data, service: "br.com.mobilesapp.MeusGastos", account: viewModel.email)
        
        if result {
            self.goProfile(userVidewModel: viewModel)
        } else {
            self.navigationController.presentAlert(withTitle: "Error", message: "Erro ao gravar o usuário! Repita a operação.")
        }
    }
}

