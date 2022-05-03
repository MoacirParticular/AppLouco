//
//  ResumeCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 29/04/22.
//

import UIKit

class ResumeCoordinator: Coordinator {
    let navigationController: UINavigationController
    let profileViewModel: ProfileViewModel
    
    init(navigationController: UINavigationController, profileViewModel: ProfileViewModel) {
        self.navigationController = navigationController
        self.profileViewModel = profileViewModel
    }
    
    func start() {
        let viewController = ResumeViewController()
        viewController.setProfileViewModel(profileViewModel: self.profileViewModel)
        
        viewController.onGoHome = {
            let coo = HomeCoordinator(navigationController: self.navigationController)
            coo.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
