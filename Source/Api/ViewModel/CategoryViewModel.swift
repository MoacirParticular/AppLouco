//
//  CategoryViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import Foundation

class CategoryViewModel {
    let model: CategoryModel
    
    init(withModel model: CategoryModel) {
        self.model = model
    }
    
    init(name: String, about: String) {
        model = CategoryModel(name: name, about: about)
    }
    
    func mock() -> [CategoryViewModel] {
        var mocks = [CategoryViewModel]()
        
        mocks.append(CategoryViewModel(withModel: CategoryModel(name: "Contas Fixas", about: "Contas que pago todo mês")))
        mocks.append(CategoryViewModel(withModel: CategoryModel(name: "Sem Categoria", about: "Contas que não importa a categoria")))
        
        return mocks
    }
    
    func save() -> Bool {
        
        return true        
    }
}
