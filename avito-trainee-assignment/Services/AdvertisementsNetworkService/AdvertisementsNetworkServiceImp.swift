//
//  AdvertisementsNetworkServiceImp.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - AdvertisementsNetworkServiceImp
final class AdvertisementsNetworkServiceImp: AdvertisementsNetworkService {
    private let networkService = NetworkService(baseUrl: "https://www.avito.st/s/interns-ios")
    
    func getAdvertisements(completion: @escaping (Result<Advertisements, RequestError>) -> Void) {
        networkService.sendRequest(
            endpoint: .getAdvertisements,
            completion: completion
        )
    }
}
