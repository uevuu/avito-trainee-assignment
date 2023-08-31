//
//  CommonButton.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

import UIKit

//MARK: - CommonButton
final class CommonButton: UIButton {
    init(_ title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setup()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setup() {
        setTitleColor(R.Colors.blue, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
