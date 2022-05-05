//
//  ProfileModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 02/05/22.
//

import Foundation

struct ProfileModel {
    let age: String
    let gender: String
    let cpf: String
    let phone: String
    
    init() {
        self.age = String.empty
        self.gender = String.empty
        self.cpf = String.empty
        self.phone = String.empty
    }
    
    init(age: String, gender:String, cpf: String, phone: String) {
        self.age = age
        self.gender = gender
        self.cpf = cpf
        self.phone = phone
    }
}
