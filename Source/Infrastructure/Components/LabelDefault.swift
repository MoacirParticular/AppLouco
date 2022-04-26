//
//  LabelDefault.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class LabelDefault: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text, font: UIFont.systemFont(ofSize: 17, weight: .regular))
    }
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        initDefault(text: text, font: font)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, font: UIFont) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .labelTextColor
        self.font = font
    }
}
