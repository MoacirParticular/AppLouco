//
//  AddTransactionView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 31/05/2022.
//

import Foundation

import UIKit

class AddTransactionView: ViewDefault {
    // MARK: - Closures
    
    // MARK: - Properts
    lazy private var titleLabel = LabelDefault(text: "Adicionar lançamento", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    lazy private var about = LabelEditDefault(labelText: "Descrição", textFieldPlaceHolder: "ex. Internet")
    lazy private var typeLanctoLabel = LabelDefault(text: "Tipo de lançamento", font: UIFont.systemFont(ofSize: 15, weight: .regular))
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmet = UISegmentedControl(items: ["Entrada", "Saída"])

        segmet.translatesAutoresizingMaskIntoConstraints = false
        segmet.selectedSegmentIndex = 1
        segmet.backgroundColor = .lightGray
        segmet.translatesAutoresizingMaskIntoConstraints = false

        segmet.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)

        return segmet
    }()
    
    lazy private var amount = LabelEditDefault(labelText: "Valor", textFieldPlaceHolder: "R$ 0,00")

    //MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setElementsVisual()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints

    private func setElementsVisual() {
        setTitle()
        setAbout()
        setTypeLancto()
        setSegmentControl()
        setAmount()
    }
    
    private func setTitle() {
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: kLeft),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -kLeft)
        ])
    }
            
    private func setAbout() {
        self.addSubview(about)
        
        NSLayoutConstraint.activate([
            about.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            about.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: kLeft),
            about.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -kLeft),            
        ])
    }

    private func setTypeLancto() {
        self.addSubview(typeLanctoLabel)
        
        NSLayoutConstraint.activate([
            typeLanctoLabel.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 20),
            typeLanctoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: kLeft),
            typeLanctoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -kLeft)
        ])
    }

    private func setSegmentControl() {
        self.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: typeLanctoLabel.bottomAnchor, constant: 6),
            segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: kLeft),
            segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -kLeft)
        ])
    }

    
    private func setAmount() {
        self.addSubview(amount)
        amount.showHideIcon(imageName: "arrowDown", color: "F6AAA5".color, show: true)
        
        NSLayoutConstraint.activate([
            amount.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: kLeft),
            amount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -kLeft)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    func segmentAction(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            amount.showHideIcon(imageName: "arrowUp", color: "9FC8E5".color, show: true)
        case 1:
            amount.showHideIcon(imageName: "arrowDown", color: "F6AAA5".color, show: true)
        default:
            amount.showHideIcon(imageName: "", color: UIColor.clear, show: false)
            break;
        }
    }


}
