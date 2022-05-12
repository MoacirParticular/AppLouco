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
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = ProfileViewController()
        
        viewController.onSaveProfile = { profileViewModel in
            self.coordinatorViewModel.profileViewModel = profileViewModel
            self.startAddressCoordinator()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startAddressCoordinator() {
        let coordinator = AddressCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        coordinator.start()
    }
}
