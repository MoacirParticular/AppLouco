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
        
        viewController.onCancel = {
            self.popToRoot()
        }
        
        viewController.onSave = { categoryViewModel in
            CategoryViewModel(withModel: CategoryModel()).save { result in
                print(result)
                
                switch result {
                case .success(_):
                    let newModel = CategoryModel(id: categoryViewModel.id, name: categoryViewModel.name, about: categoryViewModel.about)
                    self.coordinatorViewModel.categorysViewModel?.append(CategoryViewModel(withModel: newModel))
                    self.popToRoot()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.navigationController.presentAlert(withTitle: "Erro", message: "Erro ao gravar a Categoria")
                }
            }
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func popToRoot() {
        self.navigationController.popToRootViewController(animated: true)
    }
}
