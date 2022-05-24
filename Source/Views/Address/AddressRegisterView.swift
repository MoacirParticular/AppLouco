//
//  AddressView.swift
//  RegisterApp
//
//  Created by Natanael Alves Pereira on 25/04/22.
//

import UIKit

class AddressRegisterView: ViewDefault {
    
    var onSaveProfile: ((_ addressViewModel: AddressViewModel) -> Void)?
    var cepViewModel = CEPViewModel()
    
    lazy var titleLabel = LabelDefault(text: "Registro", font: UIFont.systemFont(ofSize: 25, weight: .semibold))
    
    lazy var subTitleLabel = LabelDefault(text: "Dados de Endereço")
    lazy var cepLabel = LabelDefault(text: "CEP:")
    lazy var cepTextField: UITextField = {
        let tf = TextFieldDefault(placeholder: "Digite seu cep:")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    lazy var buscaCEPButton: ButtonDefault = {
        let bt = ButtonDefault(title: "🔍")
        bt.addTarget(self, action: #selector(buscaCEPButtonTAP), for: .touchUpInside)
        return bt
    }()
    
    lazy var streetLabel = LabelDefault(text: "Endereço:")
    lazy var streetTextField = TextFieldDefault(placeholder: "Digite o seu Endereço: ")

    lazy var numberLabel = LabelDefault(text: "Número ou S/N + Complemento:")
    lazy var numberTextField = TextFieldDefault(placeholder: "Digite o seu número ou S/N + Complemento:")

    lazy var districtLabel = LabelDefault(text: "Bairro:")
    lazy var districtTextField = TextFieldDefault(placeholder: "Digite o seu Bairro:")

    lazy var cityLabel = LabelDefault(text: "Cidade:")
    lazy var cityTextField = TextFieldDefault(placeholder: "Digite a sua Cidade:")

    lazy var ufLabel = LabelDefault(text: "Estado:")
    lazy var ufTextField = TextFieldDefault(placeholder: "Digite o Estado:")
    
    lazy var nextButton: ButtonDefault = {
        let button = ButtonDefault(title: "NEXT")
        button.addTarget(self, action: #selector(saveProfileTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubView()
        setUpConstraints()
    }
    
    func addSubView(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(cepLabel)
        contentView.addSubview(cepTextField)
        contentView.addSubview(buscaCEPButton)
        contentView.addSubview(streetLabel)
        contentView.addSubview(streetTextField)
        contentView.addSubview(numberLabel)
        contentView.addSubview(numberTextField)
        contentView.addSubview(districtLabel)
        contentView.addSubview(districtTextField)
        contentView.addSubview(cityLabel)
        contentView.addSubview(cityTextField)
        contentView.addSubview(ufLabel)
        contentView.addSubview(ufTextField)
        contentView.addSubview(nextButton)
    }

    @objc private func saveProfileTap(){
        let cep = cepTextField.text ?? String.empty
        let street = streetTextField.text ?? String.empty
        let number = numberTextField.text ?? String.empty
        let district = districtTextField.text ?? String.empty
        let city = cityTextField.text ?? String.empty
        let state = ufTextField.text ?? String.empty

        let viewModel = AddressViewModel(cep: cep,
                                         street: street,
                                         number: number,
                                         district: district,
                                         city: city,
                                         state: state,
                                         cepViewModel: self.cepViewModel)

        onSaveProfile?(viewModel)
    }
    
    @objc
    private func buscaCEPButtonTAP() {
        guard let cep = cepTextField.text else { return }

        let provider = CEPProvider()
        provider.getEndereco(withCEP: cep) { (model, error) in
            guard let model = model
            else {
                print("Deu erro na busca do cep: \(String(describing: error))")
                return
            }

            let viewModel = CEPViewModel(model: model)
            self.updateCamp(cepModel: viewModel)
            print(viewModel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            cepLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            cepLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor,constant: 5),
            cepTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            cepTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor, constant: -50),
            cepTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            buscaCEPButton.topAnchor.constraint(equalTo: cepTextField.topAnchor),
            buscaCEPButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            buscaCEPButton.leadingAnchor.constraint(equalTo: cepTextField.trailingAnchor, constant: 5),
            
            streetLabel.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 5),
            streetLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            streetTextField.topAnchor.constraint(equalTo: streetLabel.bottomAnchor,constant: 10),
            streetTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            streetTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            streetTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            numberLabel.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10),
            numberTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            numberTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            numberTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            districtLabel.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 5),
            districtLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            districtTextField.topAnchor.constraint(equalTo: districtLabel.bottomAnchor,constant: 10),
            districtTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            districtTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            districtTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            cityLabel.topAnchor.constraint(equalTo: districtTextField.bottomAnchor, constant: 5),
            cityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,constant: 10),
            cityTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            cityTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            cityTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            ufLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 5),
            ufLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            ufTextField.topAnchor.constraint(equalTo: ufLabel.bottomAnchor,constant: 10),
            ufTextField.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            ufTextField.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            ufTextField.heightAnchor.constraint(equalToConstant: kHeight),
            
            nextButton.topAnchor.constraint(equalTo: ufTextField.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: streetTextField.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: streetTextField.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: kHeight),
        ])
    }
}
