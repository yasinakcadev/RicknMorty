//
//  RMCharacterListViewModel.swift
//  RicknMorty
//
//  Created by Yasin on 23.04.2025.
//

import Foundation

struct RMCharacterListViewModel {
    
    func fetchAllCharacters() {
        RMService.shared.fetchData(RMRequest.listCharactersRequests, expecting: RMAllCharacters.self) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
