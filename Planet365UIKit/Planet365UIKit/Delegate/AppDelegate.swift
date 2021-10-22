//
//  AppDelegate.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 18.10.21..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Load Initial storyboard
        let storyBoard: UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let initViewController: UINavigationController = storyBoard.instantiateInitialViewController() as! UINavigationController
        self.window?.rootViewController = initViewController
        
        return true
    }


}

