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
    private let advertisementNetworkService: AdvertisementNetworkService
    private var advertisements: [Advertisement] = []
    
    init(advertisementNetworkService: AdvertisementNetworkService) {
        self.advertisementNetworkService = advertisementNetworkService
    }
    
}

// MARK: - ProductsListViewOutput
extension ProductsListPresenter: ProductsListViewOutput {
    func viewDidLoadEvent() {
        advertisementNetworkService.getAdvertisements { [weak self] result in
            switch result {
            case .success(let response):
                self?.advertisements = response.advertisements
                DispatchQueue.main.async {
                    self?.view?.reloadCollectionView()
                }
            case .failure(let error):
                print(error.message)
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
        print(advertisements[indexPath.item].title)
    }
}