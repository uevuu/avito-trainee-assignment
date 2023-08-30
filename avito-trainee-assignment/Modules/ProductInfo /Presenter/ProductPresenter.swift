//
//  ProductPresenter.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 27.08.2023.
//

import Foundation

// MARK: - ProductPresenter
final class ProductPresenter {
    weak var view: ProductViewInput?
    private let output: ProductPresenterOutput
    private let advertisementNetworkService: AdvertisementNetworkService
    private let advertisementId: String
    private var advertisementDetail: AdvertisementDetail?
    
    init(
        output: ProductPresenterOutput,
        advertisementId: String,
        advertisementNetworkService: AdvertisementNetworkService
    ) {
        self.output = output
        self.advertisementId = advertisementId
        self.advertisementNetworkService = advertisementNetworkService
    }
}

// MARK: - ProductViewOutput
extension ProductPresenter: ProductViewOutput {
    func loadData() {
        view?.showLoading()
        advertisementNetworkService.getAdvertisement(id: advertisementId) { [weak self] result in
            switch result {
            case .success(let detail):
                self?.advertisementDetail = detail
                DispatchQueue.main.async {
                    self?.view?.showDetail(detail)
                }
            case .failure:
                DispatchQueue.main.async {
                    self?.view?.showError()
                }
            }
        }
    }
    
    func backToPreviosModule() {
        output.goToPreviousModule()
    }
}
