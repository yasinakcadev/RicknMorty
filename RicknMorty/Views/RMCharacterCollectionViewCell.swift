//
//  RMCharacterCollectionViewCell.swift
//  RicknMorty
//
//  Created by Yasin on 23.04.2025.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RMCharacterCollectionViewCell"
    private var imageView = UIImageView()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
        style()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .label
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        statusLabel.textColor = .secondaryLabel
        statusLabel.textAlignment = .center
    }
    
    private func layout() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            statusLabel.heightAnchor.constraint(equalToConstant: 35),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3)
        ])
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
        viewModel.fetchImage { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
