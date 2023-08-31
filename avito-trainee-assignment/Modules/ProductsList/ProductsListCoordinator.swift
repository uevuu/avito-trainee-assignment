//
//  ProductsListCoordinator.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 28.08.2023.
//

import UIKit

// MARK: - ProductsListCoordinator
final class ProductsListCoordinator {
    private let window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let productListPresenter = ProductsListPresenter(
            output: self,
            advertisementsNetworkService: AdvertisementsNetworkServiceImp()
        )
        let productListViewController = ProductsListViewController(output: productListPresenter)
        productListPresenter.view = productListViewController
        let navigationController = UINavigationController(rootViewController: productListViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.navigationController = navigationController
    }
}

// MARK: - ProductsListPresenterOutput
extension ProductsListCoordinator: ProductsListPresenterOutput {
    func goToProductInfoModule(id: String) {
        let productInfoCoordinator = ProductCoordinator(
            productId: id,
            navigationController: navigationController
        )
        productInfoCoordinator.start(animated: true)
    }
}
