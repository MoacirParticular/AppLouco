//
//  CEPProvider.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import Foundation

class CEPProvider {
    func getEndereco(withCEP cep:String, completion: @escaping((CEPModel?, Error?) -> Void)) {
        let urlStr = "https://webservice.kinghost.net/web_cep.php?auth=73b65d791603439f96cab4e7af82e7d0&formato=json&cep=\(cep.replacingOccurrences(of: "-", with: ""))"
        
        guard let url = URL(string: urlStr) else { return }
        
        let urlRequest = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { ( data, response, error ) in
            
            if let error = error {
                print(error)
                completion(nil, error)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                
                guard let model = try? decoder.decode(CEPModel.self, from: data)
                else {
                    completion(nil, error)
                    return
                }
                
                print(model)
                
                completion(model, nil)
            }
        }
        
        task.resume()
    }
}
