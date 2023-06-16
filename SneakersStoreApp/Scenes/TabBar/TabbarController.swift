//
//  TabbarController.swift
//  SneakersStoreApp
//
//  Created by Meyram on 01.06.2023.
//

import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        setupMainViewControllers()
    }
    
    func setupMainViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: CatalogViewController(), tabTitle: "Catalog", tabImage: UIImage(systemName: "house")!),
            wrapInNavigationController(with: CartViewController(), tabTitle: "Cart", tabImage: UIImage(systemName: "cart")!),
            wrapInNavigationController(with: ProfileViewController(), tabTitle: "Profile", tabImage: UIImage(systemName: "person")!)
        ]
        
    }
    
    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
}

