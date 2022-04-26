//
//  TextFieldDefault.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

class TextFieldDefault: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
    }
    
    init(placeholder: String, isSecureTextEntry: Bool) {
        super.init(frame: .zero)
        initDefault(placeholder: placeholder)
        
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    private func initDefault(placeholder: String) {
        self.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.textFieldBorderColor
        self.backgroundColor = .textFieldBackgroundColor
        self.textColor = .textFieldTextColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // How to add padding to UITextField placeholder
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
