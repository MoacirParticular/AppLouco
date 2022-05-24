//
//  AddCategoryView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import UIKit

class AddCategoryView: ViewDefault {
    // MARK: Closures
    var onSave:((_ categoryViewModel: CategoryViewModel) -> Void)?
    var onCancel: (() -> Void)?
    
    // MARK: Constants
    
    // MARK: Visual Elements
    
    lazy var titleLabel = LabelDefault(text: "Adicionar Categoria", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    lazy var nameLabel = LabelDefault(text: "Nome da categoria")
    lazy var aboutLabel = LabelDefault(text: "Descrição da categoria")
    
    lazy var nameTextField = TextFieldDefault(placeholder: "Nome da categoria")
    lazy var aboutTextField = TextFieldDefault(placeholder: "Descrição da categoria")
    
    lazy var buttonSave = ButtonDefault(title: "Salvar", target: self, action: #selector(buttonSaveTap), for: .touchUpInside)
    lazy var buttonCancel = ButtonDefault(title: "Cancelar", target: self, action: #selector(buttonCancelTap), for: .touchUpInside)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElements() {
        setTitle()
        setName()
        setDescription()
        setButton()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }
    
    private func setName() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: kTop),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            nameTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            nameTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setDescription() {
        contentView.addSubview(aboutLabel)
        contentView.addSubview(aboutTextField)

        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: kTop),
            aboutLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            aboutLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            aboutTextField.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 8),
            aboutTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            aboutTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            aboutTextField.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setButton() {
        contentView.addSubview(buttonSave)
        contentView.addSubview(buttonCancel)
        
        NSLayoutConstraint.activate([
            buttonSave.topAnchor.constraint(equalTo: aboutTextField.bottomAnchor, constant: kTop),
            buttonSave.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            buttonSave.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),

            buttonCancel.topAnchor.constraint(equalTo: buttonSave.bottomAnchor, constant: kTop),
            buttonCancel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            buttonCancel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }
    
    @objc
    private func buttonSaveTap() {
        guard let name = nameTextField.text else { return }
        guard let about = aboutTextField.text else { return }
        
        CategoryViewModel(id: 0, name: name, about: about).save() 
    }
    
    @objc
    private func buttonCancelTap() {
        onCancel?()
    }

}
