//
//  AddressViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 05/05/22.
//

import Foundation


class AddressViewController: ViewControllerDefault {
    //MARK: Closures
    var onSave:((_ addressViewModel: AddressViewModel) -> Void)?
    
    //MARK: Elements Views
    lazy var addressView: AddressRegisterView = {
        let view = AddressRegisterView()
        
        view.onSaveProfile = { viewModel in
            self.onSave?(viewModel)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = self.addressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        onSave?(AddressViewModel())
    }
}
