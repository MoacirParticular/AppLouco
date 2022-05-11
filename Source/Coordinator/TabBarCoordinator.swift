//
//  TabBarCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 10/05/22.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController,
         coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let tabBarController = HomeTabBarViewController()
        
        let transactionCoordinator = TransactionCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        let categoryCoordinator = CategoryCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        
        tabBarController.setViewControllers([transactionCoordinator.transactionViewController,                                             categoryCoordinator.categoryViewController], animated: false)
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
}
