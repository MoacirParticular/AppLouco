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
    
    init(age: String, gender:String, cpf: String, cep: String, cepViewModel: CEPViewModel) {
        self.model = ProfileModel(age: age, gender: gender, cpf: cpf, cep: cep, cepViewModel: cepViewModel)
    }
    
    var age: String {
        model.age
    }
}
