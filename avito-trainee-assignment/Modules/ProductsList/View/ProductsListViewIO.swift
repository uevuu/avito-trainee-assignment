//
//  ProductsListViewIO.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import UIKit

// MARK: - ProductsListViewInput
protocol ProductsListViewInput: AnyObject {
    func reloadCollectionView()
//    func showError(_ type: RequestError)
}

// MARK: - ProductsListViewOutput
protocol ProductsListViewOutput: AnyObject {
    func viewDidLoadEvent()
    func getAdvertisementsCount() -> Int
    func getAdvertisement(at indexPath: IndexPath) -> Advertisement
    func tapOnProduct(at indexPath: IndexPath)
}
