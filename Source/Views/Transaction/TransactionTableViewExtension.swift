//
//  TransactionTableViewExtension.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import UIKit

extension TransactionView {
    func setConstraintTableView() {
        self.addSubview(transactionsTableView)
        
        NSLayoutConstraint.activate([
            transactionsTableView.topAnchor.constraint(equalTo: self.inputsView.bottomAnchor, constant: 16),
            transactionsTableView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: space),
            transactionsTableView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -space),
            transactionsTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    private func swipeToEdit() {
        
    }
    
    private func swipeToDelete(row: Int) {
        self.transactionsViewModel?.remove(at: row)
        self.transactionsTableView.reloadData()
    }
}

extension TransactionView: UITableViewDelegate {
    
}



extension TransactionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.transactionsViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Editar") { [weak self] (action,view, completionHandler)  in
            guard let self = self else { return }
            self.swipeToEdit()
            completionHandler(true)
        }

        editAction.backgroundColor = .swipeBackgroundColor
        let swipe = UISwipeActionsConfiguration(actions: [editAction])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar"){[weak self] _, _, _
            in debugPrint("delete press")
            guard let self = self else { return }
            self.swipeToDelete(row: indexPath.row)
        }

        deleteAction.backgroundColor = .swipeBackgroundColor
        let swipe = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipe
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TransactionTableViewCell
        
        cell.contentView.backgroundColor = .clear
        
        guard let transactionViewModel = transactionsViewModel?[indexPath.row] else { return cell }
        
        cell.nameLabel.text = transactionViewModel.name
        cell.valueLabel.text = String(transactionViewModel.value).formatDoubleToCurrency()
        cell.categoryLabel.text = transactionViewModel.category.name
        cell.dateLabel.text = "29 fev"
        
        switch transactionViewModel.type {
        case .Input:
            cell.iconTypeEntry.image = UIImage(named: "arrowUp")?.withRenderingMode(.alwaysTemplate)
            cell.iconTypeEntry.tintColor = "9FC8E5".color
            cell.valueLabel.textColor = "9FC8E5".color

        case .Output:
            cell.iconTypeEntry.image = UIImage(named: "arrowDown")?.withRenderingMode(.alwaysTemplate)
            cell.iconTypeEntry.tintColor = "F6AAA5".color
            cell.valueLabel.textColor = "F6AAA5".color            
        }

        return cell
    }
}
/*
extension ListaView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for:  indexPath) as! CustomTableViewCell
        cell.configureCell(name: DataStore.names[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, editingStruleForRowat indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            DataStore.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
*/
