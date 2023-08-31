//
//  MockAdvertisementDetailNetworkService.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockAdvertisementDetailNetworkService
final class MockAdvertisementDetailNetworkService: AdvertisementDetailNetworkService {
    var success = true

    func getAdvertisement(
        id: String,
        completion: (Result<AdvertisementDetail, RequestError>) -> Void
    ) {
        if success {
            completion(.success(AdvertisementDetail()))
        } else {
            completion(.failure(.unknown))
        }
    }
}

// MARK: - AdvertisementDetail + Extension
extension AdvertisementDetail {
    init() {
        self.init(
            id: "test",
            title: "test",
            price: "test",
            location: "test",
            imageUrl: "test",
            createdDate: "test",
            description: "test",
            email: "test",
            phoneNumber: "test",
            address: "test"
        )
    }
}
