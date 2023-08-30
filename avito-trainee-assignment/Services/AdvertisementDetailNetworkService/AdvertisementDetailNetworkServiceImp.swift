//
//  AdvertisementDetailNetworkServiceImp.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - AdvertisementDetailNetworkServiceImplementation
final class AdvertisementDetailNetworkServiceImp: AdvertisementDetailNetworkService {
    private let networkService = NetworkService(baseUrl: "https://www.avito.st/s/interns-ios")
    
    func getAdvertisement(
        id: String,
        completion: @escaping (Result<AdvertisementDetail, RequestError>) -> Void
    ) {
        networkService.sendRequest(
            endpoint: .getAdvertisementInfo(advertisementId: id),
            completion: completion
        )
    }
}
