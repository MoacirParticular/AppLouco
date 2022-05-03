//
//  ProfileViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 02/05/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    //MARK: Closures
    var onSaveProfile: ((_ profileViewModel: ProfileViewModel) -> Void)?
    
    //MARK: Visual Elements
    lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.backgroundColor = .white
        
        view.onSaveProfile = { profileViewModel in
            self.onSaveProfile?(profileViewModel)
        }
        
        return view
    }()
    
    override func loadView() {
        self.view = profileView
    }
}
