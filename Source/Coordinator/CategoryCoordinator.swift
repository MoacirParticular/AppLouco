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
        
        view.onEditCategory = { categoryViewModel in
            self.startEditCategory(categoryViewModel: categoryViewModel)
        }
        
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
    
    func startEditCategory(categoryViewModel: CategoryViewModel) {
        let coordinator = EditCategoryCoordinator(navigationController: self.navigationController, coordinatorViewModel: self.coordinatorViewModel, categoryViewModel: categoryViewModel)
        
        coordinator.onUpdateData = {
            self.categoryViewController.setData(categorysViewModel: self.coordinatorViewModel.categorysViewModel ?? CategorysViewModel())
        }
        
        coordinator.start()
    }
    
    func getCategorys() {
        CategoryViewModel(withModel: CategoryModel()).request { result in
            switch result {
            case .success(let categorysViewModel):
                self.coordinatorViewModel.categorysViewModel = categorysViewModel
                self.categoryViewController.setData(categorysViewModel: categorysViewModel)
            case .failure(let error):
                debugPrint("Error : \(error)")
            }
        }
    }
}
