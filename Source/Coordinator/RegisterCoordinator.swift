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
        
        viewController.onNextTap = {userVidewModel in
            self.nextView()
//            userVidewModel.send { result in
//                switch result {
//                case .success(_):
//                    print("Sucesso ao enviar o usuário")
//                    self.nextView()
//                case .failure(_):
//                    print("Erro ao enviar o usuário, apresentar eero na tela e pedir pra mandar de novo")
//                }
//            }
        }
        
        self.navigationController.pushViewController(viewController, animated: true)            
    }
    
    private func nextView() {
        let coordinator = RegisterPersonalDataCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}

