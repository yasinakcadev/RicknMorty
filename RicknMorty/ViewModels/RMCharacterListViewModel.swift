//
//  RMCharacterListViewModel.swift
//  RicknMorty
//
//  Created by Yasin on 23.04.2025.
//

import UIKit

protocol RMCharacterListViewModelDelegate: AnyObject {
    func didReceivedCharacters()
}

final class RMCharacterListViewModel: NSObject {
    
    private var characters: [RMCharacter] = []
    public weak var delegate: RMCharacterListViewModelDelegate?
    
    func fetchAllCharacters() {
        RMService.shared.fetchData(
            RMRequest.listCharactersRequests,
            expecting: RMAllCharacters.self)
        { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let results = response.results else { return }
                self.characters = results
                DispatchQueue.main.async {
                    self.delegate?.didReceivedCharacters()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension RMCharacterListViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.identifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let vm = RMCharacterCollectionViewCellViewModel(name: characters[indexPath.item].name, 
                                                        status: characters[indexPath.item].status,
                                                        imageURL: URL(string: characters[indexPath.item].image ?? ""))
        cell.configure(with: vm)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
