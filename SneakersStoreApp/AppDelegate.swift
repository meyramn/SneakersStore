//
//  AppDelegate.swift
//  SneakersStoreApp
//
//  Created by Meyram on 29.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
        //window?.rootViewController = rootViewController
        
        return true
    }



}

