//
//  HeaderTextLabel.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 26.08.2023.
//

import UIKit

// MARK: - HeaderTextLabel
final class HeaderTextLabel: UICollectionReusableView {
    private lazy var headerLabel = CommonLabel(font: R.Fonts.systemBold(with: 25))
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        addSubview(headerLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func setTitle(_ title: String) {
        headerLabel.text = title
    }
}
