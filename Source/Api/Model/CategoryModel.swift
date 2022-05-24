//
//  CategoryModel.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 12/05/22.
//

import Foundation

typealias CategorysModel = [CategoryModel]

class CategoryModel: Codable {
    let id: Int
    let name: String
    let about: String
    
    init() {
        id = 0
        name = String.empty
        about = String.empty
    }
    
    init(id: Int, name: String, about: String) {
        self.id = id
        self.name = name
        self.about = about
    }
}
