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
    
    lazy var buttonE = ButtonDefault(title: "Esconde")
    lazy var buttonM = ButtonDefault(title: "Mostra")

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

    var heightLayout: NSLayoutConstraint?
    
    private func setTitle() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleLabel2)
        contentView.addSubview(titleLabel3)
        contentView.addSubview(buttonE)
        contentView.addSubview(buttonM)

        

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

            buttonE.topAnchor.constraint(equalTo: titleLabel3.bottomAnchor, constant: 12),
            buttonE.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            buttonE.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            buttonM.topAnchor.constraint(equalTo: buttonE.bottomAnchor, constant: 12),
            buttonM.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            buttonM.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
        
        buttonE.addTarget(self, action: #selector(buttonETap), for: .touchUpInside)
        buttonM.addTarget(self, action: #selector(buttonMTap), for: .touchUpInside)
    }
                          
    @objc
    func buttonETap() {
        if heightLayout != nil {
            removeConstraint(heightLayout!)
        }
        
        heightLayout = NSLayoutConstraint(item: self.titleLabel2,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: nil,
                                          attribute: .notAnAttribute,
                                          multiplier: 1.0,
                                          constant: 0)
        
        addConstraint(heightLayout!)
    }

    @objc
    func buttonMTap() {
        if heightLayout != nil {
            removeConstraint(heightLayout!)
        }
        
        heightLayout = NSLayoutConstraint(item: self.titleLabel2,
                                          attribute: .height,
                                          relatedBy: .equal,
                                          toItem: nil,
                                          attribute: .notAnAttribute,
                                          multiplier: 1.0,
                                          constant: 30)
        
        addConstraint(heightLayout!)
    }
}
