//
//  CategoryViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import Foundation

typealias CategorysViewModel = [CategoryViewModel]

class CategoryViewModel {
    let model: CategoryModel
    
    init(withModel model: CategoryModel) {
        self.model = model
    }
    
    init(id: Int, name: String, about: String) {
        model = CategoryModel(id: id, name: name, about: about)
    }
    
    var id: Int {
        model.id
    }
    
    var name: String {
        model.name
    }
    
    var about: String {
        model.about
    }
    
    func mock() -> [CategoryViewModel] {
        var mocks = [CategoryViewModel]()
        
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 0, name: "Contas Fixas", about: "Contas que pago todo mês")))
        mocks.append(CategoryViewModel(withModel: CategoryModel(id: 1, name: "Sem Categoria", about: "Contas que não importa a categoria")))
        
        return mocks
    }
    
    func request( completion: @escaping CategorysViewModelCompletionHandler ) {
        let parameters: [AnyHashable: Any] = ["body": ""]
        let provider = CategoryProvider()
        provider.request(parameters: parameters) { result in
            print(result)
            
            switch result {
                case .success(let categorysModel):
                    completion(.success(categorysModel.map { CategoryViewModel(withModel: $0) }))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion (.failure(error))
                }
        }
    }
    
    func save( completion: @escaping SendCompletionHandler ) {
        let parameters: [AnyHashable: Any] = ["CategoryModel": CategoryModel(id: self.id, name: self.name, about: self.about)]
        let provider = CategoryProvider()
        provider.send(parameters: parameters) { result in
            print(result)
            
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let error):
                print(error.localizedDescription)
                completion (.failure(error))
            }
        }
    }
}
