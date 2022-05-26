//
//  EditCategoryCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 26/05/2022.
//

import Foundation
import UIKit

class EditCategoryCoordinator: Coordinator {
    // MARK: - Closures
    var onUpdateData:(() -> Void )?
    
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    let categoryViewModel: CategoryViewModel
    
    init(navigationController: UINavigationController, coordinatorViewModel: CoordinatorViewModel, categoryViewModel: CategoryViewModel) {
        self.navigationController = navigationController
        self.coordinatorViewModel = coordinatorViewModel
        self.categoryViewModel = categoryViewModel
    }
    
    func start() {
        let viewController = EditCategoryViewController()
        
        viewController.onCancel = {
            self.popToRoot()
        }
        
        viewController.onSave = { categoryViewModel in
            categoryViewModel.save { result in
                    print(result)
                    
                    switch result {
                    case .success(_):
                        let newModel = CategoryModel(id: categoryViewModel.id, name: categoryViewModel.name, about: categoryViewModel.about)
                        
                        if let row = self.coordinatorViewModel.categorysViewModel?.firstIndex(where: {$0.id == categoryViewModel.id}) {
                            self.coordinatorViewModel.categorysViewModel?[row] = CategoryViewModel(withModel: newModel)
                        }
                        
                        self.onUpdateData?()
                    
                        self.popToRoot()
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.navigationController.presentAlert(withTitle: "Erro", message: "Erro ao gravar a Categoria")
                    }
                }
        }
        
        viewController.setData(categoryViewModel: self.categoryViewModel)
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func popToRoot() {
        DispatchQueue.main.async {
            self.navigationController.popToRootViewController(animated: true)
        }
    }
}

