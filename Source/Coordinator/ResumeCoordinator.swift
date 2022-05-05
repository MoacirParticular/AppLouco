//
//  ResumeCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 29/04/22.
//

import UIKit

class ResumeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = ResumeViewController()
        viewController.setProfileViewModel(coordinatorViewModel: self.coordinatorViewModel)
        
        viewController.onGoHome = {
            let coo = HomeCoordinator(navigationController: self.navigationController)
            coo.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
