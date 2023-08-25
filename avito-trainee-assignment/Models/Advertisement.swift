//
//  Advertisement.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import Foundation

struct Advertisement: Codable {
    let id: String
    let title: String
    let price: String
    let location: String
    let imageUrl: String
    let createdDate: String
}
