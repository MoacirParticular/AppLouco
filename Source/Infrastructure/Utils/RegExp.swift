//
//  RegExp.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import Foundation

struct RegExp {

    /**
     Check password complexity

     - parameter password:         password to test
     - parameter length:           password min length
     - parameter patternsToEscape: patterns that password must not contains
     - parameter caseSensitivty:   specify if password must conforms case sensitivity or not
     - parameter numericDigits:    specify if password must conforms contains numeric digits or not

     - returns: boolean that describes if password is valid or not
     */
    static func checkPasswordComplexity(password: String, length: Int, patternsToEscape: [String], caseSensitivty: Bool, numericDigits: Bool, specialCharacter: Bool) -> Bool {
        if (password.count < length) {
            return false
        }
        if caseSensitivty {
            let hasUpperCase = RegExp.matchesForRegexInText(regex: "[A-Z]", text: password).count > 0
            if !hasUpperCase {
                return false
            }
            let hasLowerCase = RegExp.matchesForRegexInText(regex: "[a-z]", text: password).count > 0
            if !hasLowerCase {
                return false
            }
        }
        if numericDigits {
            let hasNumbers = RegExp.matchesForRegexInText(regex: "\\d", text: password).count > 0
            if !hasNumbers {
                return false
            }
        }
        if specialCharacter {
            let specialCharacter = RegExp.matchesForRegexInText(regex: "[!@#\\$%\\^&\\*]", text: password).count > 0
            if !specialCharacter {
                return false
            }
        }
        if patternsToEscape.count > 0 {
            let passwordLowerCase = password.lowercased()
            for pattern in patternsToEscape {
                let hasMatchesWithPattern = RegExp.matchesForRegexInText(regex: pattern, text: passwordLowerCase).count > 0
                if hasMatchesWithPattern {
                    return false
                }
            }
        }
        return true
    }

    static func matchesForRegexInText(regex: String, text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text,
                options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}


