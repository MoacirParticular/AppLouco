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
        
        let urlStr = "https://127.0.0.1:7100/User"
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        urlRequest.httpBody = try? JSONEncoder().encode(userModel)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
        
            guard let data = data, error == nil else {
                print(error.debugDescription)
                completionHandler(.failure(error!))
                return
            }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                    completionHandler(.failure( NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                    return
                }
                
                print(json)
                
                guard let result:NSDictionary = try json["Result"] as? NSDictionary else {
                    completionHandler(.failure( NSError(domain: "json to NSDictionary", code: -100009, userInfo: nil)))
                    return
                }
            } catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
        
        task.resume()

    }
}
