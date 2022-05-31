//
//  TransactionCoordinator.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import UIKit

class TransactionCoordinator: Coordinator {
    let navigationController: UINavigationController
    let coordinatorViewModel: CoordinatorViewModel
    lazy var transactionViewController: TransactionViewController = {
        let view = TransactionViewController()
        view.tabBarItem.image = UIImage(named: "TransactionIcon")
        view.tabBarItem.title = "Lançamentos"
        
        view.onAdd = {
            self.startAdd()
        }
        
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
    
    func startAdd() {
        let coordinator = AddTransactionCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
