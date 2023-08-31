//
//  AdvertisementDetail.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import Foundation

public struct AdvertisementDetail: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    let description: String
    let email: String
    let phoneNumber: String
    let address: String
    
    public init(
        id: String,
        title: String,
        price: String,
        location: String,
        imageUrl: String,
        createdDate: String,
        description: String,
        email: String,
        phoneNumber: String,
        address: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.location = location
        self.imageUrl = imageUrl
        self.createdDate = createdDate
        self.description = description
        self.email = email
        self.phoneNumber = phoneNumber
        self.address = address
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
        case description
        case email
        case phoneNumber = "phone_number"
        case address
    }
}
