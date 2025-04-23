//
//  RMCharacterViewController.swift
//  RicknMorty
//
//  Created by Yasin on 21.04.2025.
//

import UIKit

class RMCharacterViewController: UIViewController {
    
    let listView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(listView)
        
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
