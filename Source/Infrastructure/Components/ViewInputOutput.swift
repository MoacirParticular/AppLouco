//
//  ViewInputOutput.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import Foundation
import UIKit

enum TypeEntry {
    case Input
    case Output
}

class ViewInputOutput: UIView {
    lazy var icon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bi_arrow-up-circle-fill-2"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var valueLabel = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 25, weight: .bold))

    lazy var subTitleLabel = LabelDefault(text: "", font: UIFont.systemFont(ofSize: 14, weight: .light))

    init(typeEntry: TypeEntry) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false        
        setTypeEntry(type: typeEntry)
        setElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(value: Double) {
        valueLabel.text = String(value).formatDoubleToCurrency()
    }
    
    private func setTypeEntry(type: TypeEntry) {
        switch type {
        case .Input:
            icon.image = UIImage(named: "arrowUp")
            subTitleLabel.text = "Entradas esse mês"
            self.backgroundColor = .inputsColor

        case .Output:
            icon.image = UIImage(named: "arrowDown")
            subTitleLabel.text = "Saídas esses mês"
            self.backgroundColor = .outputsColor
        }
    }
    
    private func setElementsView() {
        self.addSubview(icon)
        self.addSubview(valueLabel)
        self.addSubview(subTitleLabel)
        
        valueLabel.textAlignment = .center
        valueLabel.lineBreakMode = .byClipping
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.5
        
        subTitleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.widthAnchor.constraint(equalToConstant: 24),
            
            valueLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),

            subTitleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 2),
            subTitleLabel.leftAnchor.constraint(equalTo: valueLabel.leftAnchor),
            subTitleLabel.rightAnchor.constraint(equalTo: valueLabel.rightAnchor)
            
        ])
    }
}
