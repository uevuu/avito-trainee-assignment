//
//  Endpoint.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - Endpoint
enum Endpoint {
    case getAdvertisements
    case getAdvertisementInfo(advertisementId: String)
        
    var path: String {
        switch self {
        case .getAdvertisements:
            return "/main-page.json"
        case .getAdvertisementInfo(let advertisementId):
            return "/details/\(advertisementId).json"
        }
    }
}
