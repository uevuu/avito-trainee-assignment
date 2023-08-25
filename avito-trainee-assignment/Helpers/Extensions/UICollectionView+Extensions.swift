//
//  UICollectionView+Extensions.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import UIKit

extension UICollectionView {
    func register(_ cellClass: UICollectionViewCell.Type) {
        register(cellClass, forCellWithReuseIdentifier: "\(cellClass.self)")
    }
    
    func registerHeader(_ reusableViewClass: UICollectionReusableView.Type) {
        register(
            reusableViewClass,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "\(reusableViewClass.self)"
        )
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(
        _ cellClass: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let cell = self.dequeueReusableCell(
            withReuseIdentifier: "\(cellClass.self)",
            for: indexPath
        ) as? T else {
            fatalError("Forgot register \(T.self)")
        }
        return cell
    }
    
    func dequeueReusableHeader<T: UICollectionReusableView>(
        _ reusableViewClass: T.Type,
        for indexPath: IndexPath
    ) -> T {
        guard let header = self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "\(reusableViewClass.self)",
            for: indexPath
        ) as? T else {
            fatalError("Forgot register header - \(T.self)")
        }
        return header
    }
}
