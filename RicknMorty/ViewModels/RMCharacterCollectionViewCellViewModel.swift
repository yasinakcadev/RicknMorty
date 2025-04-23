//
//  RMCharacterCollectionViewCellViewModel.swift
//  RicknMorty
//
//  Created by Yasin on 23.04.2025.
//

import Foundation

struct RMCharacterCollectionViewCellViewModel {
    let name: String?
    let status: String?
    let imageURL: URL?
    
    var statusText: String {
        return "Status: \(self.status ?? "")"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = self.imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badURL)))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
