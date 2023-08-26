//
//  Resources.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 26.08.2023.
//

import UIKit

enum R {
    enum Colors {
        
    }
    
    enum Strings {
        static let recommendations = "Рекомендации"
    }
    
    enum Fonts {
        static func systemRegular(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        static func systemBold(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
    
    enum Image {
        static let heart = UIImage(systemName: "heart")
        static let ellipsis = UIImage(systemName: "ellipsis")
    }
}
