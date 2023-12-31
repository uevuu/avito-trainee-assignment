//
//  ProductPresenter.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 27.08.2023.
//

import Foundation

// MARK: - ProductPresenter
public final class ProductPresenter {
    public weak var view: ProductViewInput?
    private var advertisementDetail: AdvertisementDetail?
    private let output: ProductPresenterOutput
    private let advertisementId: String
    private let advertisementDetailNetworkService: AdvertisementDetailNetworkService
    
    public init(
        output: ProductPresenterOutput,
        advertisementId: String,
        advertisementDetailNetworkService: AdvertisementDetailNetworkService
    ) {
        self.output = output
        self.advertisementId = advertisementId
        self.advertisementDetailNetworkService = advertisementDetailNetworkService
    }
}

// MARK: - ProductViewOutput
extension ProductPresenter: ProductViewOutput {
    public func loadData() {
        view?.showLoading()
        advertisementDetailNetworkService.getAdvertisement(id: advertisementId) { [weak self] result in
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
    
    public func backToPreviousModule() {
        output.goToPreviousModule()
    }
}
