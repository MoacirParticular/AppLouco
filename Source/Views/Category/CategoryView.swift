//
//  CategoryView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import UIKit

class CategoryView: ViewDefault {
    // MARK: Closures
    var onAddCategory:(()-> Void)?
    
    // MARK: Constants
    
    // MARK: Visual Elements
    
    lazy var titleLabel = LabelDefault(text: "Categorias", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    
    lazy var addCategoryButton: ButtonDefault = {
        let button = ButtonDefault(title: "", target: self, action: #selector(addCategoryTap), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .tabbarIconColor
        button.setImage(UIImage(systemName: "plus.circle"), for: [])
        button.addTarget(self, action: #selector(addCategory), for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    @objc
    private func addCategoryTap() {
        onAddCategory?()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElements() {
        setTitle()
        setAddCategoryButton()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }
    
    private func setAddCategoryButton() {
        contentView.addSubview(addCategoryButton)

        NSLayoutConstraint.activate([
            addCategoryButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            addCategoryButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            addCategoryButton.heightAnchor.constraint(equalToConstant: 24),
            addCategoryButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: Actions
    
    @objc
    private func addCategory() {
        
    }
}
