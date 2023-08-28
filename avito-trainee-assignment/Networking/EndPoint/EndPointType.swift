//
//  EndPointType.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 26.08.2023.
//

import UIKit

enum EndPoint: String {
    case advertisement = "/main-page.json"
    case advertisements = "/dateils"
    
    
}

enum HTTPMethod: String {
    case get = "GET"
}

enum RequestError: Error {
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

final class NetworkService {
    private let baseURL: String
    
    init(baseUrl: String) {
        self.baseURL = baseUrl
    }

    func sendRequest<T: Codable>(
        endpoint: String,
        completion: @escaping(Result<T, RequestError>) -> Void
    ) {
        guard let url = URL(string: baseURL + endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode != 200 {
                completion(.failure(.responseError))
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}


extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()
    
    func loadImage(_ urlString: String) {
        image = nil
        if let imageFromCache = UIImageView.imageCache.object(forKey: urlString as NSString) {
            image = imageFromCache
            return
        }

        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad
        )
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else { return }
            UIImageView.imageCache.setObject(newImage, forKey: urlString as NSString)
            DispatchQueue.main.async {
                self.image = newImage
            }
        }.resume()
    }
}

// MARK: - AdvertisementNetworkService
final class AdvertisementNetworkService {
    private let networkService = NetworkService(baseUrl: "https://www.avito.st/s/interns-ios")
    
    func getAdvertisements(completion: @escaping(Result<Advertisements, RequestError>) -> Void) {
        networkService.sendRequest(endpoint: "/main-page.json", completion: completion)
    }
    
    func getAdvertisement(
        id: String,
        completion: @escaping(Result<AdvertisementDetail, RequestError>) -> Void
    ) {
        networkService.sendRequest(endpoint: "/details/\(id).json", completion: completion)
    }
}

