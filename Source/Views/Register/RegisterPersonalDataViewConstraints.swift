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
        setGenderLabel()
        setGenderTextField()
        setCPF()
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
    
    private func setGenderLabel() {
        contentView.addSubview(genderLabel)
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 16),
            genderLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            genderLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }
    
    private func setGenderTextField() {
        contentView.addSubview(genderTextField)
        
        NSLayoutConstraint.activate([
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
            genderTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            genderTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            genderTextField.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
    
    private func setCPF() {
        contentView.addSubview(cpfLabel)
        contentView.addSubview(cpfTextField)

        NSLayoutConstraint.activate([
            cpfLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 16),
            cpfLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            cpfLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        
            cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 8),
            cpfTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            cpfTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            cpfTextField.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
}
