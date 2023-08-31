//
//  Advertisements.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 25.08.2023.
//

import Foundation

public struct Advertisements: Decodable {
    let advertisements: [Advertisement]
    
    public init() {
        self.advertisements = []
    }
    
    public init(advertisements: [Advertisement]) {
        self.advertisements = advertisements
    }
}
