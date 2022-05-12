//
//  AddCategoryCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import Foundation
import UIKit

class AddCategoryCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        let viewController = AddCategoryViewController()
        
        
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
