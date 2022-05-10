//
//  TransactionView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 10/05/22.
//

import UIKit


class TransactionView: ViewDefault {
    // MARK: Visual Elements
    lazy var titleLabel = LabelDefault(text: "Meus gastos", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    lazy var titleLabel2 = LabelDefault(text: "Teste 1", font: UIFont.systemFont(ofSize: 17, weight: .semibold))
    lazy var titleLabel3 = LabelDefault(text: "Teste 2", font: UIFont.systemFont(ofSize: 17, weight: .semibold))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElements() {
        setTitle()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleLabel2)
        contentView.addSubview(titleLabel3)
        
        

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleLabel2.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            titleLabel3.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 12),
            titleLabel3.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel3.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
        
        
      
        
    }
}
