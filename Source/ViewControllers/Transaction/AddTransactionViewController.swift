//
//  AddTransactionViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 31/05/2022.
//

import Foundation

import UIKit

class AddTransactionViewController: ViewControllerDefault {
    private lazy var addTransactionView: AddTransactionView = {
        let view = AddTransactionView()
        view.backgroundColor = .viewBackgroundColor
        
        return view
    }()
    
    override func loadView() {
        self.view = addTransactionView
    }
}
