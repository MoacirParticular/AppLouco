//
//  AddTransactionCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 31/05/2022.
//

import Foundation
import UIKit

class AddTransactionCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddTransactionViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
