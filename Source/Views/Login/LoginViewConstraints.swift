//
//  LoginViewConstraints.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import UIKit

extension LoginView {
    func setUIElements() {
        setTitle()
        setEmailAddress()
        setPassword()
        setLoginButton()
        setNextButton()
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
    
    private func setLoginButton() {
        contentView.addSubview(loginButton)

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: kTop),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
    
    private func setNextButton() {
        contentView.addSubview(registerButton)

        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: kTop),
            registerButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
}
