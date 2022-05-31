//
//  TransactionView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 10/05/22.
//

import UIKit


class TransactionView: ViewDefault {
    // MARK: Closures
    var onAdd:(() -> Void)?
    
    // MARK: Constraints
    let space: CGFloat = (20 / 375) *  UIScreen.main.bounds.width
    let width: CGFloat = (157 / 375) * UIScreen.main.bounds.width
    let cellId = "TransactionTableViewCell"
    
    // MARK: Propertys
    var transactionsViewModel: [TransactionViewModel]?

    // MARK: Visual Elements
    lazy var titleLabel = LabelDefault(text: "Meus gastos", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    
    lazy var addButton: ButtonDefault = {
        let button = ButtonDefault(title: "", target: self, action: #selector(addTap), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .tabbarIconColor
        button.setImage(UIImage(systemName: "plus.circle"), for: [])
        
        return button
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmet = UISegmentedControl(items: ["Essa Semana", "Esse mês", "Todos"])

        segmet.translatesAutoresizingMaskIntoConstraints = false
        segmet.selectedSegmentIndex = 1
        segmet.backgroundColor = .lightGray
        segmet.translatesAutoresizingMaskIntoConstraints = false

        return segmet
    }()
    
    lazy var inputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Input)
        view.setValue(value: 113500)
        view.layer.cornerRadius = (width * 10) / 100
        return view
    }()

    lazy var outputsView: ViewInputOutput = {
        let view = ViewInputOutput(typeEntry: .Output)
        view.setValue(value: 562312)
        view.layer.cornerRadius = (width * 10) / 100
        return view
    }()
    
    lazy var transactionsTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .lightGray
        tv.delegate = self
        tv.dataSource = self
        tv.register(TransactionTableViewCell.self, forCellReuseIdentifier: self.cellId)
        tv.accessibilityLabel = "Lista de transações do período"
        
        let lb = LabelDefault(text: "Lançamentos", font: UIFont.systemFont(ofSize: 20, weight: .semibold))
        
        tv.tableHeaderView = lb
        tv.tableHeaderView?.frame.size.height = 30
        
        tv.backgroundColor = .viewBackgroundColor
        
        return tv
    }()

    override init(frame: CGRect) {
        self.transactionsViewModel = TransactionViewModel(withModel: TransactionModel()).getMock()
        
        super.init(frame: frame)
        
        self.scrollView.isScrollEnabled = false
        self.setUIElements()
        self.transactionsTableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUIElements() {
        setTitle()
        setButtonAdd()
        setSegmentControl()
        setIputView()
        setOutputView()
        setConstraintTableView()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }

    private func setButtonAdd() {
        contentView.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            addButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            addButton.heightAnchor.constraint(equalToConstant: 24),
            addButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }

    private func setSegmentControl() {
        contentView.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            segmentedControl.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    private func setIputView() {
        contentView.addSubview(inputsView)
        
        print(UIScreen.main.bounds.width)
        print(space)
        print(width)
        
        NSLayoutConstraint.activate([
            inputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            inputsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: space),
            inputsView.heightAnchor.constraint(equalToConstant: 130),
            inputsView.widthAnchor.constraint(equalToConstant: width),
        ])
    }
    
    private func setOutputView() {
        contentView.addSubview(outputsView)

        NSLayoutConstraint.activate([
            outputsView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 30),
            outputsView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -space),
            outputsView.heightAnchor.constraint(equalToConstant: 130),
            outputsView.widthAnchor.constraint(equalToConstant: width),
        ])
    }
    
    // MARK: Actions
    
    @objc
    private func addTap() {
        onAdd?()
    }
}
