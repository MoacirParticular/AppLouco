//
//  HomeViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import Foundation

class TransactionViewController: ViewControllerDefault {
    // MARK: - Closures
    var onAdd:(() -> Void)?
    
    // MARK: - Properties
    
    lazy var transactionView: TransactionView = {
        let view = TransactionView()
        view.backgroundColor = .viewBackgroundColor
        view.onAdd = { self.onAdd?() }
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.title = "Meus Gastos"
    }
    
    override func loadView() {        
        self.view = transactionView
    }
}
