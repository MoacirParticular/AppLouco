//
//  UserProvider.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

typealias UserAPICompletionHandler = (Result<UserModel, Error>) -> Void

protocol UserProviderProtocol {
    func request(parameters: [AnyHashable: Any], completionHandler: @escaping UserAPICompletionHandler)
    func send(parameters: [AnyHashable : Any], completionHandler: @escaping UserAPICompletionHandler)
}

final class UserProvider: UserProviderProtocol {
    func request(parameters: [AnyHashable : Any], completionHandler: @escaping UserAPICompletionHandler) {
        
    }
    
    func send(parameters: [AnyHashable : Any], completionHandler: @escaping UserAPICompletionHandler) {
        let body:NSDictionary = parameters["body"] as! NSDictionary
        let userModel = body["UserModel"] as! UserModel
        
        let urlStr = "https://meusgastos.azurewebsites.net/User"
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        urlRequest.httpBody = try? JSONEncoder().encode(userModel)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
        
            guard let httpResponse = response as? HTTPURLResponse  else { return }
            
            print("error \(httpResponse.statusCode)")
            
            if !(200 ... 299).contains(httpResponse.statusCode) {
                completionHandler(.failure( NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
            }
                        
            guard let data = data, error == nil else {
                print(error.debugDescription)
                completionHandler(.failure(error!))
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let model = try? decoder.decode(UserModel.self, from: data)
            else {
                completionHandler(.failure( NSError(domain: "json to NSDictionary", code: -100009, userInfo: nil)))
                return
            }
            
            print(model)
            
            completionHandler(.success(model))
        }
        
        task.resume()

    }
}
