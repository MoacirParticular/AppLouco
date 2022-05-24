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
    var onGetCategorys:(() -> Void)?
    
    // MARK: - Properties
    private lazy var categoryView: CategoryView = {
        let view = CategoryView()
        view.onAddCategory = {
            self.onAddCategory?()
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
}
