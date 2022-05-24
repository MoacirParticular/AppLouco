//
//  TransactionViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import Foundation

class TransactionViewModel {
    let model: TransactionModel
    
    init(withModel model: TransactionModel) {
        self.model = model
    }
    
    init(name: String, type: Int, category: CategoryModel, date: Date, value: Double) {
        self.model = TransactionModel(name: name, type: type, category: category, date: date, value: value)
    }
    
    var name: String {
        model.name
    }
    
    var type: TypeEntry {
        switch model.type {
        case 0:
            return TypeEntry.Input
        case 1:
            return TypeEntry.Output
        default:
            return TypeEntry.Input
        }
    }
    
    var category: CategoryModel {
        model.category
    }
    
    var date: Date {
        model.date
    }
    
    var value: Double {
        model.value
    }
    
    func getMock() -> [TransactionViewModel] {
        var list = [TransactionViewModel]()
        
        list.append(TransactionViewModel(withModel: TransactionModel(name: "Salário", type: 0, category: CategoryModel(id: 0, name: "Entradas", about: String.empty), date: Date(), value: 3000)))

        list.append(TransactionViewModel(withModel: TransactionModel(name: "Luz", type: 1, category: CategoryModel(id: 0, name: "Contas Fixas", about: String.empty), date: Date(), value: 500)))

        list.append(TransactionViewModel(withModel: TransactionModel(name: "Internet", type: 1, category: CategoryModel(id: 0, name: "Contas Fixas", about: String.empty), date: Date(), value: 199)))

        return list
    }
}
