//
//  ProfileViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 02/05/22.
//

import Foundation

struct ProfileViewModel {
    let model: ProfileModel
    
    init(withModel model: ProfileModel) {
        self.model = model
    }
    
    init(age: String, gender:String, cpf: String, phone: String) {
        self.model = ProfileModel(age: age, gender: gender, cpf: cpf, phone: phone)
    }
    
    var age: String {
        model.age
    }
    
    var gender: String {
        model.gender
    }
    
    var cpf: String {
        model.cpf
    }
    
    var phone: String {
        model.phone
    }
}
