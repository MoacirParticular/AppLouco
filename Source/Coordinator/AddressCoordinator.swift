//
//  AddressCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 05/05/22.
//

import UIKit

class AddressCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController,
         coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = AddressViewController()
        viewController.onSave = { addressViewModel in
            self.coordinatorViewModel.addressViewModel = addressViewModel
            self.startResumeViewController()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func startResumeViewController() {
        let coordinator = ResumeCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        coordinator.start()
    }
}
