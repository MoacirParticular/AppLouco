//
//  CategoryView.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 11/05/22.
//

import UIKit

class CategoryView: ViewDefault {
    // MARK: Closures
    var onAddCategory:(()-> Void)?
    var onEditCategory:((_ categoryViewModel: CategoryViewModel)-> Void)?
    var categorysViewModel = [CategoryViewModel]()
    
    // MARK: Constants
    let cellId = "cellId"
    
    // MARK: Visual Elements
    
    lazy var titleLabel = LabelDefault(text: "Categorias", font: UIFont.systemFont(ofSize: 25, weight: .bold))
    
    lazy var addCategoryButton: ButtonDefault = {
        let button = ButtonDefault(title: "", target: self, action: #selector(addCategoryTap), for: .touchUpInside)
        button.backgroundColor = .clear
        button.tintColor = .tabbarIconColor
        button.setImage(UIImage(systemName: "plus.circle"), for: [])
        
        return button
    }()
    
    lazy var categoryTableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .lightGray
        tv.dataSource = self
        tv.delegate = self
        tv.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        tv.accessibilityLabel = "Lista de Categorias"
        tv.backgroundColor = .viewBackgroundColor
        
        tv.rowHeight = 60
        tv.estimatedRowHeight = 60
        
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(categorysViewModel: CategorysViewModel) {
        self.categorysViewModel = categorysViewModel
        
        DispatchQueue.main.async {
            self.categoryTableView.reloadData()
        }
    }
    
    func setUIElements() {
        setTitle()
        setAddCategoryButton()
        setTableView()
    }

    private func setTitle() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: kLeft),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
        ])
    }
    
    private func setAddCategoryButton() {
        contentView.addSubview(addCategoryButton)

        NSLayoutConstraint.activate([
            addCategoryButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            addCategoryButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -kLeft),
            addCategoryButton.heightAnchor.constraint(equalToConstant: 24),
            addCategoryButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setTableView() {
        self.addSubview(categoryTableView)
        
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            categoryTableView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            categoryTableView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    // MARK: Actions
    
    @objc
    private func addCategoryTap() {
        onAddCategory?()
    }
    
    private func swipeToEdit(row: Int) {
        onEditCategory?(self.categorysViewModel[row])
    }
}

extension CategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Editar") { [weak self] (action,view, completionHandler)  in
            guard let self = self else { return }
            self.swipeToEdit(row: indexPath.row)
            completionHandler(true)
        }

        editAction.backgroundColor = .swipeBackgroundColor
        let swipe = UISwipeActionsConfiguration(actions: [editAction])
        return swipe
    }
}

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.categorysViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if cell == nil || cell?.detailTextLabel == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        guard let cell = cell else { return UITableViewCell() }
        
        cell.backgroundColor = .viewBackgroundColor
        
        let categoryViewModel = categorysViewModel[indexPath.row]

        cell.textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        cell.textLabel?.text = categoryViewModel.name
        
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12, weight: .light)
        cell.detailTextLabel?.text = categoryViewModel.about

        return cell
    }
}
