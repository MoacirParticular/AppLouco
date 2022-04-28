//
//  UserViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

// MARK: - UserVideModel
struct UserVideModel {
    var model: UserModel?
    
    init(model: UserModel) {
        self.model = model
    }
    
    var id : Int {
        self.model?.id ?? 0
    }
    
    var email: String {
        self.model?.email ?? String.empty
    }
    
    var password: String {
        self.model?.password ?? String.empty
    }
    
    func send(completionHandler: @escaping UserAPICompletionHandler) {
        let parameters: [AnyHashable: Any] = ["body": ["UserModel": self.model]]
        let provider = UserProvider()
        provider.send(parameters: parameters, completionHandler: completionHandler)
    }
}
