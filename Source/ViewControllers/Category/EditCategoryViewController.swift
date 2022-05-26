//
//  EditCategoryViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 26/05/2022.
//

import Foundation

class EditCategoryViewController: ViewControllerDefault {
    // MARK: - Closures
    var onSave:((_ viewModel: CategoryViewModel) -> Void)?
    var onCancel:(() -> Void)?
    
    // MARK: - Properties
    private lazy var editCategoryView: EditCategoryView = {
        let view = EditCategoryView()
        
        view.onSave = {[weak self] categoryViewModel in
            guard let self = self else { return }
            self.onSave?(categoryViewModel)
        }
        
        view.onCancel = {[weak self] in
            guard let self = self else { return }
            
            self.onCancel?()
        }
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = editCategoryView
    }
    
    func setData(categoryViewModel: CategoryViewModel) {
        editCategoryView.setData(categoryViewModel: categoryViewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}
