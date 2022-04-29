//
//  UIViewController+.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 28/04/22.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title: String, message : String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        print("Youve pressed OK Button")
    }

    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
