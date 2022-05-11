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
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmet = UISegmentedControl(items: ["Essa Semana", "Esse mês", "Todos"])

        segmet.translatesAutoresizingMaskIntoConstraints = false
        segmet.selectedSegmentIndex = 1
        segmet.backgroundColor = .lightGray
        segmet.translatesAutoresizingMaskIntoConstraints = false

        return segmet
    }()
    
    lazy var inputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Input)
        view.setValue(value: 111113500)
        view.layer.cornerRadius = 25
        return view
    }()

    lazy var outputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Output)
        view.setValue(value: 562312)
        view.layer.cornerRadius = 25
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElements() {
        setTitle()
        setSegmentControl()
        setIputView()
        setOutputView()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }

    private func setSegmentControl() {
        contentView.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            segmentedControl.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            segmentedControl.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])
    }
    
    private func setIputView() {
        contentView.addSubview(inputsView)

        NSLayoutConstraint.activate([
            inputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 130),
            inputsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            inputsView.heightAnchor.constraint(equalToConstant: 124),
            inputsView.widthAnchor.constraint(equalToConstant: 171),
        ])
    }
    
    private func setOutputView() {
        contentView.addSubview(outputsView)

        NSLayoutConstraint.activate([
            outputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 130),
            outputsView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            outputsView.heightAnchor.constraint(equalToConstant: 124),
            outputsView.widthAnchor.constraint(equalToConstant: 171),
        ])
    }

    
}
