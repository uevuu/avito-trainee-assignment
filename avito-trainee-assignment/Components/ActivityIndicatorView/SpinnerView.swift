//
//  SpinnerView.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

import UIKit

// MARK: - SpinnerView
final class SpinnerView: UIActivityIndicatorView {
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        hidesWhenStopped = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
