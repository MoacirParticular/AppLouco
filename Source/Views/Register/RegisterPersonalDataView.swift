//
//  RegisterPersonalDataView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

class RegisterPersonalDataView: ViewDefault {
    /*
        Idade (lista  0..15, 16..25, 26..35, 36..50 >50)
        Genero (Fotinho uma mulher, e a fotinho de um homem e Não quero informar)
        CPF - Mascarado e com verificação de CPF válido.
        Telefone (codigo de area, e numero)
        Botão next vai para a proxima tela que tera os campos :
     */
    
    let ageLabel = LabelDefault(text: "Faixa etária")
    
    lazy var ageTextField = TextFieldDefault(placeholder: "Sua idade")
    lazy var agePickerView:ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = { [weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: false)
            self.ageTextField.text = Age.allCases[row].rawValue
            self.ageTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {
            self.ageTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var genderLabel = LabelDefault(text: "Genero")
    lazy var genderTextField = TextFieldDefault(placeholder: "Seu genero")
    lazy var genderPickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = { [weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: false)
            self.genderTextField.text = Gender.allCases[row].rawValue
            self.genderTextField.resignFirstResponder()
        }
        
        picker.didTapCancel = {
            self.genderTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var cpfLabel = LabelDefault(text: "CPF")
    lazy var cpfTextField = TextFieldDefault(placeholder: "informe seu CPF", keyboardType: .numberPad)
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setUIElements()
        setPickerView()
        setTextFields()
    }
    
    private func setPickerView() {
        agePickerView.dataSource = self
        agePickerView.delegate = self
        ageTextField.inputView = agePickerView
        ageTextField.inputAccessoryView = agePickerView.toolbar

        genderPickerView.dataSource = self
        genderPickerView.delegate = self
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
    }
    
    private func setTextFields() {
        cpfTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
