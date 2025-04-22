//
//  RMCharacterViewController.swift
//  RicknMorty
//
//  Created by Yasin on 21.04.2025.
//

import UIKit

class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
