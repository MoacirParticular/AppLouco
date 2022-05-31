//
//  LabelEditDefault.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 31/05/2022.
//

import Foundation

import UIKit

class LabelEditDefault: UIView {
    // MARK: - Closures
    
    // MARK: - Properts
    var widthLayout: NSLayoutConstraint?
    
    lazy private var label = LabelDefault(text: "", font: .systemFont(ofSize: 15, weight: .light))
    lazy private var textField = TextFieldDefault(placeholder: "")
    lazy private var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .black.withAlphaComponent(0.3)
        
        return iv
    }()
    
    // MARK: Inits
    
    init(labelText: String, textFieldPlaceHolder: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.label.text = labelText
        self.textField.placeholder = textFieldPlaceHolder
        
        setElementsVisual()
    }
    
    init(labelDefault: LabelDefault, textFieldDefault: TextFieldDefault) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.label = labelDefault
        self.textField = textFieldDefault
        
        setElementsVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showHideIcon(imageName: String, color: UIColor, show: Bool) {
        iconImageView.image = UIImage(named: imageName)
        iconImageView.backgroundColor = color
        
        if widthLayout != nil {
             removeConstraint(widthLayout!)
         }
        
        switch show {
        case true:
            widthLayout = NSLayoutConstraint(item: self.iconImageView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 26)

            addConstraint(widthLayout!)
        case false:
            widthLayout = NSLayoutConstraint(item: self.iconImageView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .width,
                                              multiplier: 1.0,
                                              constant: 0)

            addConstraint(widthLayout!)
        }
    }
 
    private func setElementsVisual() {
        self.addSubview(iconImageView)
        self.addSubview(label)
        self.addSubview(textField)
        
        self.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            label.leftAnchor.constraint(equalTo: self.leftAnchor),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),

            iconImageView.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 6),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 0),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 6),
            textField.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: label.rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            
            self.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
}
