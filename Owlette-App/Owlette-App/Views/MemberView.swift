//
//  MemberView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/22/23.
//

import UIKit

class MemberView: UIView {
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    public lazy var stateSearchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "CA"
        return textField
    }()
    
    public var saveButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Save", for: .normal)
        return button
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.reuseId)
        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.12)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit() {
        setupBackgroundViewConstraints()
        setupStateSearchTextField()
        setupSaveButtonConstraints()
        setupCollectionViewConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupStateSearchTextField() {
        addSubview(stateSearchTextField)
        stateSearchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateSearchTextField.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 11),
            stateSearchTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 11),
            stateSearchTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            stateSearchTextField.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func setupSaveButtonConstraints() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            saveButton.leadingAnchor.constraint(equalTo: stateSearchTextField.trailingAnchor, constant: 11),
            saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            saveButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            saveButton.topAnchor.constraint(equalTo: stateSearchTextField.topAnchor)
        
        ])
    }
    
    private func setupCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stateSearchTextField.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
