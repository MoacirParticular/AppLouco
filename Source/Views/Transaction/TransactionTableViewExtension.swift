//
//  TransactionTableViewExtension.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import UIKit

extension TransactionView {
    func setConstraintTableView() {
        self.addSubview(trasactionsTableView)
        
        NSLayoutConstraint.activate([
            trasactionsTableView.topAnchor.constraint(equalTo: self.inputsView.bottomAnchor, constant: 16),
            trasactionsTableView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: space),
            trasactionsTableView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -space),
            trasactionsTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
}

extension TransactionView: UITableViewDelegate {
    
}

extension TransactionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.transactionsViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TransactionTableViewCell
        
        guard let transactionViewModel = transactionsViewModel?[indexPath.row] else { return cell }
        
        cell.nameLabel.text = transactionViewModel.name
        cell.valueLabel.text = String(transactionViewModel.value).formatDoubleToCurrency()
        cell.categoryLabel.text = transactionViewModel.category.name
        cell.dateLabel.text = "29 fev"
        
        switch transactionViewModel.type {
        case .Input:
            cell.iconTypeEntry.image = UIImage(named: "arrowUp")
            cell.valueLabel.textColor = .blue

        case .Output:
            cell.iconTypeEntry.image = UIImage(named: "arrowDown")
            cell.valueLabel.textColor = .red
        }

        return cell
    }
}
