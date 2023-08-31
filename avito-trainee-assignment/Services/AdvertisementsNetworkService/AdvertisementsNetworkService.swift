//
//  AdvertisementsNetworkService.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - AdvertisementsNetworkService
public protocol AdvertisementsNetworkService: AnyObject {
    func getAdvertisements(completion: @escaping(Result<Advertisements, RequestError>) -> Void)
}
