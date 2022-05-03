//
//  HomeCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
