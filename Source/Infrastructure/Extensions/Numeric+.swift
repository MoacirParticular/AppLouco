//
//  numeric+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

extension Numeric {
    var formattedWithSeparator: String {
        Formatter.withSeparator.string(for: self) ?? String.empty
    }
}
