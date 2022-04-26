//
//  RegisterPersonalDataCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

class RegisterPersonalDataCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterPersonalDataViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
