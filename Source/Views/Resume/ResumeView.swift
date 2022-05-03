//
//  ResumeView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import Foundation
import UIKit

class ResumeView: ViewDefault {
    //MARK: Closures
    var onGoHome: (() -> Void )?
    
    //MARK: Variables
    let profileViewModel: ProfileViewModel?
    
    //MARK: Elements View
    var labelAge = LabelDefault(text: String.empty, font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    
    var buttonHome = ButtonDefault(title: "Home")
    
    init(withProfile profileViewModel: ProfileViewModel?) {
        self.profileViewModel = profileViewModel

        super.init(frame: .zero)
        
        self.setElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsView() {
        setValuesInElementsViews()
        
        setLabelAge()
        setButtonHome()
    }
    
    private func setValuesInElementsViews() {
        labelAge.text = "Sua Faixa etária: \(self.profileViewModel?.age ?? String.empty)"
    }
    
    private func setLabelAge() {
        self.addSubview(labelAge)
        
        NSLayoutConstraint.activate([
            labelAge.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            labelAge.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            labelAge.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
        ])
    }
    
    private func setButtonHome() {
        self.addSubview(buttonHome)
        
        buttonHome.addTarget(self, action: #selector(buttonHomeTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonHome.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            buttonHome.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            buttonHome.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24),
            
        ])
    }
    
    @objc
    func buttonHomeTap() {
        onGoHome?()
    }
}
