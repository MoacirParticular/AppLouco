//
//  RegisterPersonalDataCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

class RegisterPersonalDataCoordinator: Coordinator {
    let navigationController: UINavigationController
    let userVidewModel: UserViewModel
    
    init(navigationController: UINavigationController, userVidewModel: UserViewModel) {
        self.navigationController = navigationController
        self.userVidewModel = userVidewModel
    }
    
    func start() {
        let viewController = RegisterPersonalDataViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
