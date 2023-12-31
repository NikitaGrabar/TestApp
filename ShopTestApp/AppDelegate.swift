//
//  AppDelegate.swift
//  ShopTestApp
//
//  Created by Nikita Grabar on 17.10.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        root()
        window?.makeKeyAndVisible()
        return true
    }
    
    func root() {
        let vc = ProductListController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        window?.rootViewController = nav
    }

}

