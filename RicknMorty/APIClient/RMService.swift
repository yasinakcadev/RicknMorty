//
//  RMService.swift
//  RicknMorty
//
//  Created by Yasin on 22.04.2025.
//

import Foundation

enum RMServiceError: Error {
    case badRequest
    case dataError
    case decodeError
}

final class RMService {
    
    static let shared = RMService()
    
    private init() {}
    
    public func fetchData<T: Codable>(_ request: RMRequest, expecting type: T.Type, _ completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.badRequest))
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(RMServiceError.dataError))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(RMServiceError.decodeError))
            }
        }.resume()
        
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
