//
//  LoginCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import UIKit

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController
    let viewController = RegisterViewController()
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        
        viewController.onLoginTap = { viewModel in
            
            // Buscar
            let data = KeychainHelper.standard.read(service: "br.com.mobilesapp.MeusGastos", account: viewModel.email)
            
            guard let data = data else {
                self.navigationController.presentAlert(withTitle: "Erro ao logar", message: "email ou senha não encontrado, verifique!")
                
                return
            }
            
            let accessToken = String(data: data, encoding: .utf8)!
            
            if viewModel.password != accessToken {
                self.navigationController.presentAlert(withTitle: "Erro ao logar", message: "email ou senha não encontrado, verifique!")
                
                return
            }
            
            self.startResume()
        }
        
        viewController.onRegisterTap = {
            self.startRegister()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func startResume() {
        let coordinator = TabBarCoordinator(navigationController: self.navigationController, coordinatorViewModel: CoordinatorViewModel())
        coordinator.start()
    }
    
    private func startRegister() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()       
    }
}
