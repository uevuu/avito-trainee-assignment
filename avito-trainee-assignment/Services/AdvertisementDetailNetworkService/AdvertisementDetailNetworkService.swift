//
//  AdvertisementDetailNetworkService.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - AdvertisementDetailNetworkService
protocol AdvertisementDetailNetworkService: AnyObject {
    func getAdvertisement(
        id: String,
        completion: @escaping(Result<AdvertisementDetail, RequestError>) -> Void
    )
}
