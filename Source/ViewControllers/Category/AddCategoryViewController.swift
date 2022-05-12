//
//  AddCategoryViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import Foundation

class AddCategoryViewController: ViewControllerDefault {
    // MARK: - Closures
    var onSave:((_ viewModel: CategoryViewModel) -> Void)?

    // MARK: - Properties
    private lazy var addCategoryView: AddCategoryView = {
        let view = AddCategoryView()
        
        view.onSave = {[weak self] categoryViewModel in
            guard let self = self else { return }
            self.onSave?(categoryViewModel)
        }
        
        view.onCancel = {[weak self] in
            guard let self = self else { return }
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = addCategoryView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
