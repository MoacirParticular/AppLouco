//
//  ResumeViewController.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 29/04/22.
//

import Foundation
import UIKit

class ResumeViewController: UIViewController {
    //MARK: Closures
    var onGoHome: (() -> Void )?
    
    //MARK: Variables
    var profileViewModel: ProfileViewModel?
    
    //MARK: Elements Views
    lazy var resumeView: ResumeView = {
        let view = ResumeView(withProfile: self.profileViewModel)
        
        view.onGoHome = {
            self.onGoHome?()
        }
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setProfileViewModel(profileViewModel: ProfileViewModel) {
        self.profileViewModel = profileViewModel
    }
    
    override func loadView() {
        self.view = resumeView
    }
}
