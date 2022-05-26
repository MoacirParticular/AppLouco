//
//  ViewDefault.swift
//  AppLouco
//
//  Created by Moacir Ezequiel Lamego on 20/04/22.
//

import UIKit

class ViewDefault: UIView {
    // MARK: Constants
    let kTop: CGFloat = 30
    let kLeft: CGFloat = 12
    let kHeight: CGFloat = 46
    let kZero: CGFloat = 0
    
    // MARK: Visual Elements
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func afterHideKeyboard() {
        scrollView.setContentOffset(CGPoint(x: 0, y: -50), animated: true)
    }
    
    func afterShowKeyboard(_ height: CGFloat) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor

        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
    }
}
