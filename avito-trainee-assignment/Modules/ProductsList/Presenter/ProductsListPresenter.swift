//
//  ProductsListPresenter.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 26.08.2023.
//

import Foundation

// MARK: - ProductsListPresenter
final class ProductsListPresenter {
    weak var view: ProductsListViewInput?
    private let output: ProductsListPresenterOutput
    private let advertisementNetworkService: AdvertisementNetworkService
    private var advertisements: [Advertisement] = []
    
    init(
        output: ProductsListPresenterOutput,
        advertisementNetworkService: AdvertisementNetworkService
    ) {
        self.output = output
        self.advertisementNetworkService = advertisementNetworkService
    }
}

// MARK: - ProductsListViewOutput
extension ProductsListPresenter: ProductsListViewOutput {
    func loadData() {
        view?.showLoading()
        advertisementNetworkService.getAdvertisements { [weak self] result in
            switch result {
            case .success(let response):
                self?.advertisements = response.advertisements
                DispatchQueue.main.async {
                    self?.view?.showProducts()
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.view?.showError()
                }
            }
        }
    }
    
    func getAdvertisementsCount() -> Int {
        advertisements.count
    }
    
    func getAdvertisement(at indexPath: IndexPath) -> Advertisement {
        advertisements[indexPath.item]
    }
    
    func tapOnProduct(at indexPath: IndexPath) {
        output.goToProductInfoModule(id: advertisements[indexPath.item].id)
    }
}
