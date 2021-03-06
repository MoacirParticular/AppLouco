//
//  GenderEnums.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "ð§ð»ââï¸"
    case female = "ð±ð¿ââï¸"
    case undefined = "NÃ£o quero informar"

    static var asArray: [Gender] {return self.allCases}
    
    func asInt() -> Int {
            return Gender.asArray.firstIndex(of: self)!
    }
}
