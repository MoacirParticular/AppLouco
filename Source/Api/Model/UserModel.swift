//
//  UserModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let email, password: String
    
    init() {
        id = 0
        email = String.empty
        password = String.empty
    }
    
    init(id: Int, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password        
    }
}
