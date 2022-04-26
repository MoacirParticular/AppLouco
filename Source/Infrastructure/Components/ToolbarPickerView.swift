//
//  ToolbarPickerView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import Foundation
import UIKit

class ToolbarPickerView: UIPickerView {
    var didTapDone: (() -> Void)?
    var didTapCancel: (() -> Void)?

    public private(set) var toolbar: UIToolbar?
    public var nameReference: String! = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let done = UIButton()
        done.frame = CGRect(x:0, y:0, width:30, height:30)
        done.setTitle(" Selecionar ", for: .normal)
        done.setTitle(" Selecionar ", for: .highlighted)
        done.backgroundColor = .buttonBackgroundColor
        done.layer.cornerRadius = 5.0
        done.addTarget(self, action: #selector(self.doneTapped), for: .touchUpInside)

        let doneButton = UIBarButtonItem(customView: done)
            
        let cancel = UIButton()
        cancel.frame = CGRect(x:0, y:0, width:30, height:30)
        cancel.setTitle(" Cancelar ", for: .normal)
        cancel.setTitle(" Cancelar ", for: .highlighted)
        cancel.backgroundColor = .buttonBackgroundColor
        cancel.layer.cornerRadius = 5.0
        cancel.addTarget(self, action: #selector(self.cancelTapped), for: .touchUpInside)

        let cancelButton = UIBarButtonItem(customView: cancel)

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        self.toolbar = toolBar
    }

    @objc func doneTapped() {
        didTapDone? ()
    }

    @objc func cancelTapped() {
        didTapCancel? ()
    }
}
