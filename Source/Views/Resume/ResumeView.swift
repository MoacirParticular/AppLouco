//
//  ResumeView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 03/05/22.
//

import Foundation
import UIKit

class ResumeView: ViewDefault {
    //MARK: Closures
    var onGoHome: (() -> Void )?
    
    //MARK: Variables
    let coordinatorViewModel: CoordinatorViewModel
    
    //MARK: Elements View
    lazy var viewYellow: UIView = {
        let view = UIView()
        view.backgroundColor = "FFFCE5".color
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    lazy var labelAge = LabelDefault()
    lazy var genderLabel = LabelDefault()
    lazy var cpfLabel = LabelDefault()
    lazy var phoneLabel = LabelDefault()
    lazy var cepLabel = LabelDefault()
    lazy var streetLabel = LabelDefault()
    lazy var numberLabel = LabelDefault()
    lazy var districtLabel = LabelDefault()
    lazy var cityLabel = LabelDefault()
    lazy var ufLabel = LabelDefault()

    
    var buttonHome = ButtonDefault(title: "Home")
    
    init(withCoordinatorViewModel coordinatorViewModel: CoordinatorViewModel) {
        self.coordinatorViewModel = coordinatorViewModel

        super.init(frame: .zero)
        
        self.setElementsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setElementsView() {
        setValuesInElementsViews()
        
        setLabelAge()
        setButtonHome()
    }
    
    private func setValuesInElementsViews() {
        labelAge.text = "Sua Faixa etária: \(self.coordinatorViewModel.profileViewModel?.age ?? String.empty)"
        genderLabel.text = "Genero: \(self.coordinatorViewModel.profileViewModel?.gender ?? String.empty)"
        cpfLabel.text = "CPF: \(self.coordinatorViewModel.profileViewModel?.cpf ?? String.empty)"
        phoneLabel.text = "Telefone: \(self.coordinatorViewModel.profileViewModel?.phone ?? String.empty)"
        cepLabel.text = "CEP: \(self.coordinatorViewModel.addressViewModel?.cep ?? String.empty)"
        streetLabel.text = "Endereço: \(self.coordinatorViewModel.addressViewModel?.street ?? String.empty)"
        numberLabel.text = "Número: \(self.coordinatorViewModel.addressViewModel?.number ?? String.empty)"
        districtLabel.text = "Bairro: \(self.coordinatorViewModel.addressViewModel?.district ?? String.empty)"
        cityLabel.text = "Cidade: \(self.coordinatorViewModel.addressViewModel?.city ?? String.empty)"
        ufLabel.text = "Estado: \(self.coordinatorViewModel.addressViewModel?.state ?? String.empty)"
    }
    
    private func setLabelAge() {
        contentView.addSubview(viewYellow)
        
        viewYellow.addSubview(labelAge)
        viewYellow.addSubview(genderLabel)
        viewYellow.addSubview(cpfLabel)
        viewYellow.addSubview(phoneLabel)
        viewYellow.addSubview(cepLabel)
        viewYellow.addSubview(streetLabel)
        viewYellow.addSubview(numberLabel)
        viewYellow.addSubview(districtLabel)
        viewYellow.addSubview(cityLabel)
        viewYellow.addSubview(ufLabel)

        NSLayoutConstraint.activate([
            viewYellow.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewYellow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewYellow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            labelAge.topAnchor.constraint(equalTo: viewYellow.topAnchor, constant: 100),
            labelAge.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            labelAge.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),
            
            genderLabel.topAnchor.constraint(equalTo: labelAge.bottomAnchor, constant: 12),
            genderLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            genderLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            cpfLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 12),
            cpfLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            cpfLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            phoneLabel.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 12),
            phoneLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            phoneLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            cepLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 12),
            cepLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            cepLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            streetLabel.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 12),
            streetLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            streetLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            numberLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 12),
            numberLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            numberLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            districtLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 12),
            districtLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            districtLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            cityLabel.topAnchor.constraint(equalTo: districtLabel.bottomAnchor, constant: 12),
            cityLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            cityLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),

            ufLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 12),
            ufLabel.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            ufLabel.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),
        ])
    }
    
    private func setButtonHome() {
        viewYellow.addSubview(buttonHome)
        
        buttonHome.addTarget(self, action: #selector(buttonHomeTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonHome.topAnchor.constraint(equalTo: self.ufLabel.bottomAnchor, constant: 30),
            buttonHome.leftAnchor.constraint(equalTo: viewYellow.leftAnchor, constant: kLeft),
            buttonHome.rightAnchor.constraint(equalTo: viewYellow.rightAnchor, constant: -kLeft),
            buttonHome.heightAnchor.constraint(equalToConstant: kHeight),
//            viewYellow.bottomAnchor.constraint(equalTo: buttonHome.bottomAnchor, constant: 50)
        ])
    }
    
    @objc
    func buttonHomeTap() {
        onGoHome?()
    }
}
