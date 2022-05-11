//
//  String+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

extension String {
    static let empty = String()
    static let whitespace = " "
    
    var color: UIColor {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)

        if #available(iOS 13, *) {
            guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else { return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) }

            let a, r, g, b: Int32
            switch hex.count {
            case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
            case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
            case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
            default:    (a, r, g, b) = (255, 0, 0, 0)
            }

            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)

        } else {
            var int = UInt32()

            Scanner(string: hex).scanHexInt32(&int)
            let a, r, g, b: UInt32
            switch hex.count {
            case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
            case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
            case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
            default:    (a, r, g, b) = (255, 0, 0, 0)
            }

            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
        }
    }
    
    var formattedAsIntegerCurrency: String {
        guard let decimal = Decimal(string: self) else { return self }
        
        let nDecimalNumber = NSDecimalNumber(decimal: decimal)
        let integerValue = nDecimalNumber.intValue
        return integerValue.formattedWithSeparator
    }
    
    func toZipCode() -> String {
        String(format: "%@-%@", String(dropLast(3)), String(suffix(3)))
    }
    
    /// Concatenates all the decimals in the string
    var decimalDigitis: String {
        self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var masked: String {
        replacingOccurrences(
            of: "(?!^).(?!$)", // RegEx
            with: "x", // Replacement
            options: .regularExpression // Option to set RegEx
        )
    }
    
    // ^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*]).{8,}$
    
    var unMasked: String {
        filter("0123456789".contains)
    }
    
    var cpf: String {
        if self.count == 11 {
            var characters = Array(self)
            characters.insert(".", at: 3)
            characters.insert(".", at: 7)
            characters.insert("-", at: 11)
            
            return String(characters)
        }
        
        return self
    }
    
    var toInt: Int {
        let num = filter { "0"..."9" ~= $0 }
        return Int(num) ?? 0
    }
    
    var isBackspace: Bool {
      let char = self.cString(using: String.Encoding.utf8)!
      return strcmp(char, "\\b") == -92
    }
    
    func toEstado() -> String {
        if self.uppercased() == "AC" { return "Acre" }
        if self.uppercased() == "AL" { return "Alagoas" }
        if self.uppercased() == "AP" { return "Amapá"}
        if self.uppercased() == "AM" { return "Amazonas" }
        if self.uppercased() == "BA" { return "Bahia" }
        if self.uppercased() == "CE" { return "Ceará" }
        if self.uppercased() == "DF" { return "Distrito Federal" }
        if self.uppercased() == "ES" { return "Espírito Santo" }
        if self.uppercased() == "GO" { return "Goiás" }
        if self.uppercased() == "MA" { return "Maranhão" }
        if self.uppercased() == "MT" { return "Mato Grosso" }
        if self.uppercased() == "MS" { return "Mato Grosso do Sul" }
        if self.uppercased() == "MG" { return "Minas Gerais" }
        if self.uppercased() == "PA" { return "Pará" }
        if self.uppercased() == "PB" { return "Paraíba" }
        if self.uppercased() == "PR" { return "Paraná" }
        if self.uppercased() == "PE" { return "Pernambuco" }
        if self.uppercased() == "PI" { return "Piauí" }
        if self.uppercased() == "RJ" { return "Rio de Janeiro" }
        if self.uppercased() == "RN" { return "Rio Grande do Norte" }
        if self.uppercased() == "RS" { return "Rio Grande do Sul" }
        if self.uppercased() == "RO" { return "Rondônia" }
        if self.uppercased() == "RR" { return "Roraima" }
        if self.uppercased() == "SC" { return "Santa Catarina" }
        if self.uppercased() == "SP" { return "São Paulo" }
        if self.uppercased() == "SE" { return "Sergipe" }
        if self.uppercased() == "TO" { return "Tocantins" }
        
        return String.empty
    }
    
    func formatDoubleToCurrency() -> Self {
            if let intValue = Double(self){
               let numberFormatter = NumberFormatter()
               numberFormatter.locale = Locale(identifier: "pt_BR")
               numberFormatter.numberStyle = NumberFormatter.Style.currency
               return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
          }
        return "Deu Problema"
    }

}

extension NSRegularExpression {
    
    func stringByReplacingMatches(in string: String, withTemplate template: String) -> String {
        let r = NSRange.init(string.startIndex..<string.endIndex, in: string)
        return self.stringByReplacingMatches(in: string, options: [], range: r, withTemplate: template)
    }
}
