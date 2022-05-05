//
//  RegisterPersonalDataViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

class RegisterPersonalDataViewController : ViewControllerDefault {
    var onNextTap: (() -> Void)?
    
    lazy var registerPersonalDataView: Personal = {
        let view = RegisterPersonalDataView()
        
        return view
    }()

    override func loadView() {
        self.view = self.registerPersonalDataView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dados Pessoais"
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
}
