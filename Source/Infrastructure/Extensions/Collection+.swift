//
//  Collection+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

extension Collection where Element == Int {
    var digitoCPF: Int {
        var number = count + 2
        let digit = 11 - reduce(into: 0) {
            number -= 1
            $0 += $1 * number
        } % 11
        return digit > 9 ? 0 : digit
    }
}
