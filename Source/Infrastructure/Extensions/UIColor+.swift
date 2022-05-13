//
//  UIColor+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

extension UIColor {
    class func hexColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static var buttonBackgroundColor: UIColor {
        return UIColor(named: "buttonBackgroundColor")!
    }
    
    static var labelTextColor: UIColor {
        return UIColor(named: "labelTextColor")!
    }
    
    static var textFieldBackgroundColor: UIColor {
        return UIColor(named: "textFieldBackgroundColor")!
    }
    
    static var textFieldTextColor: UIColor {
        return UIColor(named: "textFieldTextColor")!
    }
    
    static var textFieldBorderColor: CGColor {
        return UIColor(named: "textFieldBorderColor")!.cgColor
    }
    
    static var tabbarIconColor: UIColor {
        return UIColor(named: "tabbarIconColor")!
    }
    
    static var inputsColor: UIColor {
        return UIColor(named: "input")!
    }
    
    static var outputsColor: UIColor {
        return UIColor(named: "output")!
    }

    static var viewBackgroundColor: UIColor {
        return UIColor(named: "viewBackgroundColor")!
    }

    static var swipeBackgroundColor: UIColor {
        return UIColor(named: "swipeBackgroundColor")!
    }
}
