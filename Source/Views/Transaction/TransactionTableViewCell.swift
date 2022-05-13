//
//  TransactionTableViewCell.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    let iconTypeEntry: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .black.withAlphaComponent(0.3)
        
        return iv
    }()
    
    lazy var nameLabel = LabelDefault(text: String.empty, font: UIFont.systemFont(ofSize: 12))
    lazy var categoryLabel = LabelDefault(text: String.empty, font: UIFont.systemFont(ofSize: 12))
    lazy var valueLabel = LabelDefault(text: String.empty, font: UIFont.systemFont(ofSize: 12))
    lazy var dateLabel = LabelDefault(text: String.empty, font: UIFont.systemFont(ofSize: 12))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMovieCover()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)

         if !selected {
             contentView.backgroundColor = .viewBackgroundColor
         } else {
             contentView.backgroundColor = .viewBackgroundColor
         }
    }
    
    private func setupMovieCover() {
        iconTypeEntry.backgroundColor = .clear
        dateLabel.textColor = "C4C4C4".color
        
        contentView.addSubview(iconTypeEntry)
        contentView.addSubview(nameLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            iconTypeEntry.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconTypeEntry.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            iconTypeEntry.heightAnchor.constraint(equalToConstant: 20),
            iconTypeEntry.widthAnchor.constraint(equalToConstant: 20),

            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            nameLabel.leftAnchor.constraint(equalTo: iconTypeEntry.rightAnchor, constant: 12),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100),

            valueLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 0),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),

            categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            categoryLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            categoryLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100),

            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            dateLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }

}
