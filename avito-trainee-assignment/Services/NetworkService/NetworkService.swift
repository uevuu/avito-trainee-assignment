//
//  NetworkService.swift
//  avito-trainee-assignment
//
//  Created by Nikita Marin on 26.08.2023.
//

import Foundation

// MARK: - NetworkService
final class NetworkService {
    private let baseURL: String
    
    init(baseUrl: String) {
        self.baseURL = baseUrl
    }

    func sendRequest<T: Codable>(
        endpoint: Endpoint,
        completion: @escaping(Result<T, RequestError>) -> Void
    ) {
        guard let url = URL(string: baseURL + endpoint.path) else {
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
