//
//  TransactionModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import Foundation

class TransactionModel: Codable {
    let name: String
    let type: Int
    let category: CategoryModel
    let date: Date
    let value: Double
    
    init() {
        self.name = String.empty
        self.type = 0
        self.category = CategoryModel()
        self.date = Date()
        self.value = 0
    }

    init(name: String, type: Int, category: CategoryModel, date: Date, value: Double) {
        self.name = name
        self.type = type
        self.category = category
        self.date = date
        self.value = value
    }
}
