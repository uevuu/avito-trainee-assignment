//
//  CommonSecondaryLabel.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

import UIKit

// MARK: - CommonSecondaryLabel
final class CommonSecondaryLabel: UILabel {
    init(font: UIFont = R.Fonts.systemRegular(with: 14)) {
        super.init(frame: .zero)
        self.font = font
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        textColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
    }
}
