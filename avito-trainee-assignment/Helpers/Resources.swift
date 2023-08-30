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
        static let tryAgain = "Попробуй еще раз"
    }
    
    enum Fonts {
        static func systemRegular(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        static func systemBold(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .bold)
        }
        
        static func systemSemiBold(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size, weight: .semibold)
        }
    }
    
    enum Image {
        static let heart = UIImage(systemName: "heart")
        static let ellipsis = UIImage(systemName: "ellipsis")
        static let chevronBackward = UIImage(systemName: "chevron.backward")
        static let cartBadgePlus = UIImage(systemName: "cart.badge.plus")
        static let squareAndArrowUp = UIImage(systemName: "square.and.arrow.up")
        
    }
}
