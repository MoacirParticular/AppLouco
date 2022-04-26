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
        
        viewController.onNextTap = {
            self.nextView()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)            
    }
    
    private func nextView() {
        let coordinator = RegisterPersonalDataCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}

