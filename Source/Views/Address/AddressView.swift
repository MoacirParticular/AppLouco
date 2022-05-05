//
//  AddressView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 05/05/22.
//

//import Foundation
//import UIKit
//
//class AddressView: ViewDefault {
//    //MARK: Closures
//    var onSaveProfile: ((_ profileViewModel: ProfileViewModel) -> Void)?
//
//    //MARK: Elements Views
//    let titleLabel = LabelDefault(text: "Seus dados", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
//    
//    let ageLabel = LabelDefault(text: "Faixa etária")
//    lazy var ageTextField = TextFieldDefault(placeholder: "Sua idade")
//    lazy var agePickerView:ToolbarPickerView = {
//        let picker = ToolbarPickerView()
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        
//        picker.didTapDone = { [weak self] in
//            guard let self = self else { return }
//            
//            let row = picker.selectedRow(inComponent: 0)
//            picker.selectRow(row, inComponent: 0, animated: false)
//            self.ageTextField.text = Age.allCases[row].rawValue
//            self.ageTextField.resignFirstResponder()
//        }
//        
//        picker.didTapCancel = {
//            self.ageTextField.resignFirstResponder()
//        }
//        
//        return picker
//    }()
//    
//    lazy var genderLabel = LabelDefault(text: "Genero")
//    lazy var genderTextField = TextFieldDefault(placeholder: "Seu genero")
//    lazy var genderPickerView: ToolbarPickerView = {
//        let picker = ToolbarPickerView()
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        
//        picker.didTapDone = { [weak self] in
//            guard let self = self else { return }
//            
//            let row = picker.selectedRow(inComponent: 0)
//            picker.selectRow(row, inComponent: 0, animated: false)
//            self.genderTextField.text = Gender.allCases[row].rawValue
//            self.genderTextField.resignFirstResponder()
//        }
//        
//        picker.didTapCancel = {
//            self.genderTextField.resignFirstResponder()
//        }
//        
//        return picker
//    }()
//    
//    lazy var cpfLabel = LabelDefault(text: "CPF")
//    lazy var cpfTextField = TextFieldDefault(placeholder: "informe seu CPF", keyboardType: .numberPad)
//
//    lazy var phoneLabel = LabelDefault(text: "Telefone")
//    lazy var phoneTextField = TextFieldDefault(placeholder: "informe seu telefone", keyboardType: .numberPad)
//    
//    lazy var buttonSave:ButtonDefault = {
//        let bt = ButtonDefault(title: "Salvar", backgroundColor: .blue)
//        
//        bt.addTarget(self, action: #selector(saveProfileTap), for: .touchUpInside)
//        
//        return bt
//    }()
//
//    
//    override init(frame: CGRect) {
//        super .init(frame: frame)
//        
//        setUIElements()
//        setPickerView()
//        setTextFields()
//    }
//    
//    private func setPickerView() {
//        agePickerView.dataSource = self
//        agePickerView.delegate = self
//        ageTextField.inputView = agePickerView
//        ageTextField.inputAccessoryView = agePickerView.toolbar
//
//        genderPickerView.dataSource = self
//        genderPickerView.delegate = self
//        genderTextField.inputView = genderPickerView
//        genderTextField.inputAccessoryView = genderPickerView.toolbar
//    }
//    
//    private func setTextFields() {
//        cpfTextField.delegate = self
//    }
//    
//    @objc
//    private func buscaCEPButtonTAP() {
//        guard let cep = cepTextField.text else { return }
//        
//        let provider = CEPProvider()
//        provider.getEndereco(withCEP: cep) { (model, error) in
//            guard let model = model
//            else {
//                print("Deu erro na busca do cep: \(String(describing: error))")
//                return
//            }
//            
//            self.cepViewModel = CEPViewModel(model: model)
//        }
//    }
//    
//    @objc
//    private func saveProfileTap() {
//        let age = ageTextField.text ?? String.empty
//        let gender = genderTextField.text ?? String.empty
//        let cpf = cpfTextField.text ?? String.empty
//        let cep = cepTextField.text ?? String.empty
//        
//        let profileViewModel = ProfileViewModel(age: age,
//                                                gender: gender,
//                                                cpf: cpf,
//                                                cep: cep,
//                                                cepViewModel: self.cepViewModel)
//        
//        onSaveProfile?(profileViewModel)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setUIElements() {
//        setTitleLabel()
//        setAgeLabel()
//        setAgeTextField()
//        setGenderLabel()
//        setGenderTextField()
//        setCPF()
//        setCEP()
//        setButtonSave()
//    }
//
//    private func setTitleLabel() {
//        contentView.addSubview(titleLabel)
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
//            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//        ])
//    }
//    
//    private func setAgeLabel() {
//        contentView.addSubview(ageLabel)
//        
//        NSLayoutConstraint.activate([
//            ageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: kTop),
//            ageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            ageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//        ])
//    }
//
//    private func setAgeTextField() {
//        contentView.addSubview(ageTextField)
//        
//        NSLayoutConstraint.activate([
//            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
//            ageTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            ageTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//            ageTextField.heightAnchor.constraint(equalToConstant: kHeight),
//        ])
//    }
//    
//    private func setGenderLabel() {
//        contentView.addSubview(genderLabel)
//        
//        NSLayoutConstraint.activate([
//            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 16),
//            genderLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            genderLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//        ])
//    }
//    
//    private func setGenderTextField() {
//        contentView.addSubview(genderTextField)
//        
//        NSLayoutConstraint.activate([
//            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 8),
//            genderTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            genderTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//            genderTextField.heightAnchor.constraint(equalToConstant: kHeight),
//        ])
//    }
//    
//    private func setCPF() {
//        contentView.addSubview(cpfLabel)
//        contentView.addSubview(cpfTextField)
//
//        NSLayoutConstraint.activate([
//            cpfLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 16),
//            cpfLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            cpfLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//        
//            cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 8),
//            cpfTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            cpfTextField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//            cpfTextField.heightAnchor.constraint(equalToConstant: kHeight),
//        ])
//    }
//    
//    
//    private func setCEP() {
//        contentView.addSubview(cepLabel)
//        contentView.addSubview(cepTextField)
//        contentView.addSubview(buscaCEPButton)
//
//        NSLayoutConstraint.activate([
//            cepLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 16),
//            cepLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            cepLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//            
//            buscaCEPButton.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 8),
//            buscaCEPButton.heightAnchor.constraint(equalToConstant: 24),
//            buscaCEPButton.widthAnchor.constraint(equalToConstant: 24),
//            buscaCEPButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
//
//            cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 8),
//            cepTextField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
//            cepTextField.rightAnchor.constraint(equalTo: buscaCEPButton.rightAnchor, constant: -kLeft),
//            cepTextField.heightAnchor.constraint(equalToConstant: kHeight),
//        ])
//    }
//    
//    private func setButtonSave() {
//        contentView.addSubview(buttonSave)
//
//        NSLayoutConstraint.activate([
//            buttonSave.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 30),
//            buttonSave.leftAnchor.constraint(equalTo: self.leftAnchor, constant: kLeft),
//            buttonSave.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -kLeft),
//            buttonSave.heightAnchor.constraint(equalToConstant: kHeight),
//        ])
//    }
//    
//}
//
//extension ProfileView: UITextFieldDelegate {
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        if textField == cpfTextField {
//            if (textField.text?.count ?? 0) < 14 {
//                textField.layer.borderColor = UIColor.red.cgColor
//            } else if textField.text?.isValidCPF ?? false {
//              textField.layer.borderColor = UIColor.textFieldBorderColor
//            }
//
//            textField.text = String(textField.text!.prefix(14))
//        }
//    }
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == cpfTextField {
//            if !string.isBackspace {
//                if range.location == 3 || range.location == 7 {
//                    textField.text = textField.text! + "."
//                } else if range.location == 11 {
//                    textField.text = textField.text! + "-"
//                }
//            }
//        }
//        
//        return true
//    }
//}
//
//extension ProfileView: UIPickerViewDataSource, UIPickerViewDelegate {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView == agePickerView {
//            return Age.asArray.count
//        } else if pickerView == genderPickerView {
//            return Gender.asArray.count
//        }
//        
//        return 0
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        
//        if pickerView == agePickerView {
//            return Age.allCases[row].rawValue
//        } else if pickerView == genderPickerView {
//            return Gender.allCases[row].rawValue
//        }
//        
//        return String.empty
//    }
//}
