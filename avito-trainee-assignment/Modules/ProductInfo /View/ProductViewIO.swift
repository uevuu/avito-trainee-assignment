//
//  ProductViewIO.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 27.08.2023.
//

import UIKit

// MARK: - ProductViewInput
protocol ProductViewInput: AnyObject {
    func setDetail(_ advertisementDetail: AdvertisementDetail)
//    func showError()
}

// MARK: - ProductViewOutput
protocol ProductViewOutput: AnyObject {
    func viewDidLoadEvent()
    func backToPreviosModule()
}

