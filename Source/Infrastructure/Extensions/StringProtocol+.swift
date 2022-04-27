//
//  StringProtocol+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 27/04/22.
//

import Foundation

extension StringProtocol {
    var isValidCPF: Bool {
        let numbers = compactMap(\.wholeNumberValue)
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        
        let result = numbers.prefix(9).digitoCPF == numbers[9] &&
            numbers.prefix(10).digitoCPF == numbers[10]
        
        return result
    }
}
