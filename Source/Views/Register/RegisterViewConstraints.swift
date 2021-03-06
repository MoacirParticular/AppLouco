//
//  RegisterViewConstraints.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 19/04/22.
//

import UIKit

extension RegisterView {
    func setUIElements() {
        setTitle()
        setEmailAddress()
        setPassword()
        setNextButton()
        setLoginButton()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            titleLabel.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
    
    private func setEmailAddress() {
        contentView.addSubview(emailAddressTextField)

        NSLayoutConstraint.activate([
            emailAddressTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: kTop),
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
    
    private func setLoginButton() {
        contentView.addSubview(loginButton)

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: kTop),
            loginButton.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
}
