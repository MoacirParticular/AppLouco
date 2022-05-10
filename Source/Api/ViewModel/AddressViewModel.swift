//
//  AddressViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 05/05/22.
//

import Foundation

class AddressViewModel {
    let cep: String
    let street: String
    let number: String
    let district: String
    let city: String
    let state: String
    let cepViewModel: CEPViewModel
    
    init() {
        cep = String.empty
        street = String.empty
        number = String.empty
        district = String.empty
        city = String.empty
        state = String.empty
        cepViewModel = CEPViewModel()
    }
    
    init(cep: String, street: String, number: String, district: String, city: String, state: String, cepViewModel: CEPViewModel) {
        self.cep = cep
        self.street = street
        self.number = number
        self.district = district
        self.city = city
        self.state = state
        self.cepViewModel = cepViewModel
    }
}
