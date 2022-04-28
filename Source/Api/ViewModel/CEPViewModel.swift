//
//  CEPViewModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import Foundation

struct CEPViewModel {
    private var model: CEPModel
    
    init(model: CEPModel) {
        self.model = model
    }
    
    var estado: String {
        model.uf.toEstado()
    }
    
    var cidade: String {
        model.cidade
    }
    
    var bairro: String {
        model.bairro
    }
    
    var logradouro: String {
        return "\(model.tipoLogradouro) \(model.logradouro)"
    }
}

