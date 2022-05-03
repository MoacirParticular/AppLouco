//
//  ProfileCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 02/05/22.
//

import Foundation
import UIKit


class ProfileCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ProfileViewController()
        
        viewController.onSaveProfile = { profileViewModel in
            self.startResumeCoordinator(profileViewModel: profileViewModel)
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startResumeCoordinator(profileViewModel: ProfileViewModel) {
        let coordinator = ResumeCoordinator(navigationController: self.navigationController, profileViewModel: profileViewModel)
        
        coordinator.start()
    }
}
