//
//  GenderEnums.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "🧔🏻‍♂️"
    case female = "👱🏿‍♀️"
    case undefined = "Não quero informar"

    static var asArray: [Gender] {return self.allCases}
    
    func asInt() -> Int {
            return Gender.asArray.firstIndex(of: self)!
    }
}
