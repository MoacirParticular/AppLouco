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
    let cep: String
    let cepViewModel: CEPViewModel
    
    init() {
        self.age = String.empty
        self.gender = String.empty
        self.cpf = String.empty
        self.cep = String.empty
        self.cepViewModel = CEPViewModel()
    }
    
    init(age: String, gender:String, cpf: String, cep: String, cepViewModel: CEPViewModel) {
        self.age = age
        self.gender = gender
        self.cpf = cpf
        self.cep = cep
        self.cepViewModel = cepViewModel
    }
}
