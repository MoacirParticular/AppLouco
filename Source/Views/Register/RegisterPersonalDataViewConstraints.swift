//
//  RegisterPersonalDataViewConstraints.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

extension RegisterPersonalDataView {
    func setUIElements() {
        setAgeLabel()
        setAgeTextField()
    }

    private func setAgeLabel() {
        contentView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            ageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            ageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }

    private func setAgeTextField() {
        contentView.addSubview(ageTextField)
        
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            ageTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            ageTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            ageTextField.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
}
