//
//  Advertisement.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import Foundation

public struct Advertisement: Decodable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
    
    public init(
        id: String,
        title: String,
        price: String,
        location: String,
        imageUrl: String,
        createdDate: String
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.location = location
        self.imageUrl = imageUrl
        self.createdDate = createdDate
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case location
        case imageUrl = "image_url"
        case createdDate = "created_date"
    }
}
