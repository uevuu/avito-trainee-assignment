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
    
    private func getAdvertisementDetail() {
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
}

// MARK: - ProductViewOutput
extension ProductPresenter: ProductViewOutput {
    func viewDidLoadEvent() {
        view?.showLoading()
        getAdvertisementDetail()
    }
    
    func backToPreviosModule() {
        output.goToPreviousModule()
    }
    
    func tapOnReloadButton() {
        view?.showLoading()
        getAdvertisementDetail()
    }
}
