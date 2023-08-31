//
//  RequestError.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 30.08.2023.
//

// MARK: - RequestError
public enum RequestError: Error {
    case decodingError
    case invalidURL
    case noData
    case responseError
    case unknown
    
    var message: String {
        switch self {
        case .decodingError:
            return "Decode error"
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data"
        default:
            return "Unknown error"
        }
    }
}
