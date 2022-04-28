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
}
