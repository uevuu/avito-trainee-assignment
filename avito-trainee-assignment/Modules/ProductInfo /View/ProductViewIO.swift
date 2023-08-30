//
//  ProductViewIO.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 27.08.2023.
//

import UIKit

// MARK: - ProductViewInput
protocol ProductViewInput: AnyObject {
    func showDetail(_ advertisementDetail: AdvertisementDetail)
    func showError()
    func showLoading()
}

// MARK: - ProductViewOutput
protocol ProductViewOutput: AnyObject {
    func loadData()
    func backToPreviosModule()
}

