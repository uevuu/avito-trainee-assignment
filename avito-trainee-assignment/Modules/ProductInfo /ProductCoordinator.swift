//
//  ProductCoordinator.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 31.08.2023.
//

import UIKit

// MARK: - ProductCoordinator
final class ProductCoordinator {
    private let productId: String
    private weak var navigationController: UINavigationController?
    
    init(
        productId: String,
        navigationController: UINavigationController?
    ) {
        self.productId = productId
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let productInfoPresenter = ProductPresenter(
            output: self,
            advertisementId: productId,
            advertisementDetailNetworkService: AdvertisementDetailNetworkServiceImp()
        )
        let productInfoViewController = ProductViewController(output: productInfoPresenter)
        productInfoPresenter.view = productInfoViewController
        navigationController?.pushViewController(productInfoViewController, animated: animated)
    }
}

// MARK: - ProductPresenterOutput
extension ProductCoordinator: ProductPresenterOutput {
    func goToPreviousModule() {
        navigationController?.popViewController(animated: true)
    }
}
