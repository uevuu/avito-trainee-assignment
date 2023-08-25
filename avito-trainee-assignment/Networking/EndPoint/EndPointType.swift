//
//  EndPointType.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 24.08.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case responseError
}

// 2
protocol DataRequest {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func decode(_ data: Data) throws -> Response
}

// 3
extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

// 4
extension DataRequest {
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}

protocol NetworkService: AnyObject {
    func sendRequest<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void)
}


final class DefaultNetworkService: NetworkService {
    func sendRequest<T: Decodable>(dataType: T.Type, from url: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode != 200 {
                completion(.failure(.responseError))
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

final class AdvertisementNetworkService {
    private let networkService = DefaultNetworkService()
    
//    func getAdvertisements() {
//        networkService.sendRequest(dataType: Advertisements, from: "someUrl", completion: com)
//    }
}



//protocol NetworkService {
//    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
//}
//
//final class DefaultNetworkService: NetworkService {
//
//    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
//
//}
