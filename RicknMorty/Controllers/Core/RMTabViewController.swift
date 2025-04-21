//
//  ViewController.swift
//  RicknMorty
//
//  Created by Yasin on 21.04.2025.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let characters = createNavController(RMCharacterViewController(), "Characters", 0, "person")
        let locations = createNavController(RMLocationViewController(), "Locations", 1, "globe")
        let episodes = createNavController(RMEpisodeViewController(), "Episodes", 2, "tv")
        let settings = createNavController(RMSettingsViewController(), "Settings", 3, "gear")
        
       setViewControllers([characters, locations, episodes, settings], animated: true)
    }
    
    private func createNavController(_ controller: UIViewController, _ title: String, _ tag: Int, _ imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), tag: tag)
        controller.title = title
        controller.navigationItem.largeTitleDisplayMode = .automatic
        controller.view.backgroundColor = .systemBackground
        return navigationController
    }
}

