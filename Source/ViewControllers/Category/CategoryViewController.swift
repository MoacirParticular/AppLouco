//
//  CategoryViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 10/05/22.
//

import UIKit

class CategoryViewController: ViewControllerDefault {
    // MARK: - Closures
    var onAddCategory:(()-> Void)?
    var onEditCategory:((_ categoryViewModel: CategoryViewModel)-> Void)?
    var onGetCategorys:(() -> Void)?
    
    // MARK: - Properties
    private lazy var categoryView: CategoryView = {
        let view = CategoryView()
        view.onAddCategory = {[weak self] in
            guard let self = self else { return }
            
            self.onAddCategory?()
        }
        
        view.onEditCategory = {[weak self] categoryViewModel in
            guard let self = self else { return }
            
            self.onEditCategory?(categoryViewModel)
        }
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onGetCategorys?()
    }
    
    override func loadView() {
        super.loadView()
        self.view = categoryView
    }
    
    func setData(categorysViewModel: CategorysViewModel) {
        categoryView.setData(categorysViewModel: categorysViewModel)
    }
}
