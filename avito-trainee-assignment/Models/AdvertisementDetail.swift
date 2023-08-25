//
//  AdvertisementDetail.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import Foundation

struct AdvertisementDetail: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let image_url: String
    let created_date: String
    let description: String
    let email: String
    let phone_number: String
    let address: String
}
