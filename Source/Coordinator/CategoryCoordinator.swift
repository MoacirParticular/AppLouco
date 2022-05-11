//
//  CategoryCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 10/05/22.
//

import UIKit

class CategoryCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    let categoryViewController: CategoryViewController = {
        let view = CategoryViewController()
        view.tabBarItem.image = UIImage(named: "CategoryIcon")
        view.tabBarItem.title = "Categorias"
        
        return view
    }()
    
    init(navigationController: UINavigationController,
         coordinatorViewModel: CoordinatorViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
    }
    
    func start() {
        //self.navigationController.pushViewController(viewController, animated: true)
    }
}
