//
//  UIButtonDefault.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class ButtonDefault: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        // Criei 2 extensoes para pegar cor
        // UIColor.hexColor(hex: "#29B06D")
        // "#29B06D".color
        
        initDefault(title: title, backgroundColor: .buttonBackgroundColor)
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        initDefault(title: title, backgroundColor: backgroundColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(title: String, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }
}
