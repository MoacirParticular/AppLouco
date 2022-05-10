//
//  HomeViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import Foundation

class TransactionViewController: ViewControllerDefault {
    // MARK: - Closures
    
    // MARK: - Properties
    
    lazy var transactionView: TransactionView = {
        let view = TransactionView()
        view.backgroundColor = .white
        
        return view
    }()
    
    // MARK: Lifecyclie
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = transactionView
    }
}
