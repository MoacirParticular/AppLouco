//
//  CategoryProvider.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 24/05/2022.
//

import Foundation

typealias CategoryAPICompletionHandler = (Result<CategorysModel, Error>) -> Void
typealias CategorysViewModelCompletionHandler = (Result<CategorysViewModel, Error>) -> Void
typealias SendCompletionHandler = (Result<Bool, Error>) -> Void

protocol CategoryProviderProtocol {
    func request(parameters: [AnyHashable: Any], completionHandler: @escaping CategoryAPICompletionHandler)
    func send(parameters: [AnyHashable : Any], completionHandler: @escaping SendCompletionHandler)
}

class CategoryProvider: CategoryProviderProtocol {
    func request(parameters: [AnyHashable : Any], completionHandler: @escaping CategoryAPICompletionHandler) {
        let urlStr = "https://meusgastos.azurewebsites.net/api/Category"
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse  else { return }
            
            debugPrint("error \(httpResponse.statusCode)")
            
            if !(200 ... 299).contains(httpResponse.statusCode) {
                completionHandler(.failure( NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
            }
                        
            guard let data = data, error == nil else {
                print(error.debugDescription)
                completionHandler(.failure(error!))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let model = try? decoder.decode(CategorysModel.self, from: data)
            else {
                completionHandler(.failure( NSError(domain: "json to NSDictionary", code: -100009, userInfo: nil)))
                return
            }
            
            print(model)
            
            completionHandler(.success(model))
        }
        
        task.resume()
    }
    
    func send(parameters: [AnyHashable : Any], completionHandler: @escaping SendCompletionHandler) {
        guard let categoryModel = parameters["CategoryModel"] as? CategoryModel else {
            completionHandler(.failure( NSError(domain: "Erro não consegui recurar o ViewModel", code: -100010, userInfo: nil)))
            return
        }
            
        let urlStr = "https://meusgastos.azurewebsites.net/api/Category/\(categoryModel.id > 0 ? "\(categoryModel.id)" : "")"
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = categoryModel.id > 0 ? "PUT" : "POST"
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(categoryModel)
        } catch let error {
            debugPrint(error)
            completionHandler(.failure(error))
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse  else { return }
            
            debugPrint("-----> statusCode ---> \(httpResponse.statusCode) <---")
            
            if (200 ... 299).contains(httpResponse.statusCode) {
                completionHandler(.success(true))
            } else {
                completionHandler(.failure( NSError(domain: "Erro na requisição status code fora da faixa 200", code: httpResponse.statusCode, userInfo: nil)))
            }
        }
        
        task.resume()
    }
}
