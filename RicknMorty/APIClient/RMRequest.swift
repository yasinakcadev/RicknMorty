//
//  RMRequest.swift
//  RicknMorty
//
//  Created by Yasin on 22.04.2025.
//

import Foundation

final class RMRequest {
    
    let baseURL = "https://rickandmortyapi.com/api"
    let endpoint: String
    let pathComponents: [String]
    let queryParameters: [URLQueryItem]
    
    public init(endpoint: String, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    var urlString: String {
        var string = baseURL
        string += "/"
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { item in
                string += "/\(item)"
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argStr = queryParameters.compactMap ({ item in
                guard let value = item.value else { return nil }
                return "\(item.name)=\(item.value)"
            }).joined(separator: "&")
            
            string += argStr
            
        }
        
        return string
    }
    
    var url: URL? {
        return URL(string: urlString)
    }
}
