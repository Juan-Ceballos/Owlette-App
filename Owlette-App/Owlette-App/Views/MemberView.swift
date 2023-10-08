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
    
    public var topContentView: UIView = {
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
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .heavy)
        return button
    }()
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.reuseId)
        cv.register(MembersSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MembersSectionHeaderView.reuseId)
        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.11)
        cv.backgroundColor = UIColor(named: MemberView.backgroundBlack)
        return cv
    }()
    
    public var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = UIColor.gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupBackgroundViewConstraints()
        setupTopContentView()
        setupStateSearchTextField()
        setupSaveButtonConstraints()
        setupCollectionViewConstraints()
        setupActivityIndicatorConstraints()
    }
    
    private func setupActivityIndicatorConstraints() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
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
    
    private func setupTopContentView() {
        addSubview(topContentView)
        topContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topContentView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            topContentView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            topContentView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            topContentView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setupStateSearchTextField() {
        addSubview(stateSearchTextField)
        stateSearchTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stateSearchTextField.topAnchor.constraint(equalTo: topContentView.topAnchor, constant: 22),
            stateSearchTextField.leadingAnchor.constraint(equalTo: topContentView.leadingAnchor, constant: 11),
            stateSearchTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            stateSearchTextField.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        ])
    }
    
    private func setupSaveButtonConstraints() {
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: stateSearchTextField.trailingAnchor, constant: 44),
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
