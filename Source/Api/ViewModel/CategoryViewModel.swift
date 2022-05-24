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
    
    init(id: Int, name: String, about: String) {
        model = CategoryModel(id: id, name: name, about: about)
    }
    
    func mock() -> [CategoryViewModel] {
        var mocks = [CategoryViewModel]()
        
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 0, name: "Contas Fixas", about: "Contas que pago todo mês")))
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 1, name: "Sem Categoria", about: "Contas que não importa a categoria")))
        
        return mocks
    }
    
    func request() {
        let parameters: [AnyHashable: Any] = ["body": ""]
        let provider = CategoryProvider()
        provider.request(parameters: parameters) { result in
            print(result)
            
            switch result {
                case .success(let categorysModel):
                    print("\(categorysModel.count) ")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    func save() -> Bool {
        
        return true        
    }
}
