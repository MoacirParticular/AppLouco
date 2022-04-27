//
//  AgeEnums.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import Foundation

enum Age: String, CaseIterable {
    case zero = "0..15"
    case sixteen = "16..25"
    case twentySix = "26..35"
    case ThirtySix = "36..50"
    case greaterFifty = "> 50"

    static var asArray: [Age] {return self.allCases}
    
    func asInt() -> Int {
            return Age.asArray.firstIndex(of: self)!
    }
}


