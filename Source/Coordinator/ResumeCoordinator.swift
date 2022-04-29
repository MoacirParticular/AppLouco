//
//  ResumeCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 29/04/22.
//

import UIKit

class ResumeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ResumeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
