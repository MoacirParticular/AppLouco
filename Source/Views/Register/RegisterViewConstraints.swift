//
//  RegisterViewConstraints.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

extension RegisterView {
    func setUIElements() {
        setEmailAddress()
        setPassword()
        setNextButton()
    }

    private func setEmailAddress() {
        contentView.addSubview(emailAddressTextField)

        NSLayoutConstraint.activate([
            emailAddressTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            emailAddressTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            emailAddressTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            emailAddressTextField.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
    
    private func setPassword() {
        contentView.addSubview(passwordTextField)

        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailAddressTextField.bottomAnchor, constant: kTop),
            passwordTextField.leadingAnchor.constraint(equalTo: emailAddressTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailAddressTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
    
    private func setNextButton() {
        contentView.addSubview(nextButton)

        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: kTop),
            nextButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: kHeight),
            
        ])
    }
}
