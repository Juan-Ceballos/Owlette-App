//
//  MemberView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/22/23.
//

import UIKit

class MemberView: UIView {
    
    static let minPadding: CGFloat = 8
    static let noSpacing: CGFloat = 0
    static let saveButtonTitle = "Save"
    static let backgroundBlack = "backgroundBlack"
    
    override func layoutSubviews() {
        let saveButtonCornerRadius = saveButton.frame.size.height / 2
        saveButton.layer.cornerRadius = saveButtonCornerRadius
    }
    
    private var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: MemberView.backgroundBlack)
        return view
    }()
    
    public lazy var stateSearchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = .black
        textField.textColor = .lightText
        let magView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        magView.contentMode = .scaleAspectFit
        magView.tintColor = .systemGray
        textField.leftView = magView
        textField.leftViewMode = .always
        return textField
    }()
    
    public lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(MemberView.saveButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBrown
        let buttonWidth = self.bounds.width * 0.2
        let buttonHeight = self.bounds.width * 0.1
        button.frame = CGRect(x: MemberView.noSpacing, y: MemberView.noSpacing, width: buttonWidth, height: buttonHeight)
        return button
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.reuseId)
        cv.register(MembersSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MembersSectionHeaderView.reuseId)
        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.12)
        cv.backgroundColor = UIColor(named: MemberView.backgroundBlack)
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
            stateSearchTextField.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 22),
            stateSearchTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 11),
            stateSearchTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            stateSearchTextField.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func setupSaveButtonConstraints() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: stateSearchTextField.trailingAnchor, constant: 11),
            saveButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            saveButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1),
            saveButton.centerYAnchor.constraint(equalTo: stateSearchTextField.centerYAnchor)
        
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
