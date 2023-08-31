//
//  MockAdvertisementsNetworkService.swift
//  avito-trainee-assignmentTests
//
//  Created by Nikita Marin on 31.08.2023.
//

import avito_trainee_assignment

// MARK: - MockAdvertisementsNetworkService
final class MockAdvertisementsNetworkService: AdvertisementsNetworkService {
    var success = true

    func getAdvertisements(completion: (Result<Advertisements, RequestError>) -> Void) {
        if success {
            completion(.success(Advertisements(advertisements: [
                Advertisement(),
                Advertisement(),
                Advertisement()
            ])))
        } else {
            completion(.failure(.unknown))
        }
    }
}

// MARK: - Advertisement + Extension
extension Advertisement {
    init() {
        self.init(
            id: "test",
            title: "test",
            price: "test",
            location: "test",
            imageUrl: "test",
            createdDate: "test"
        )
    }
}
