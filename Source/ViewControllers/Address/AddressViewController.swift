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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onSave?(AddressViewModel())
    }
}
