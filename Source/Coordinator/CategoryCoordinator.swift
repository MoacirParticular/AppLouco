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
    lazy var categoryViewController: CategoryViewController = {
        let view = CategoryViewController()
        
        view.onAddCategory = {
            self.startAddCategory()
        }
        
        view.onGetCategorys = {
            self.getCategorys()
        }
        
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
    
    func startAddCategory() {
        let coordinator = AddCategoryCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel)
        coordinator.start()
    }
    
    func getCategorys() {
        CategoryViewModel(withModel: CategoryModel()).request()
    }
}
