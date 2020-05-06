//
//  AppDelegate.swift
//  sheepSwift30
//
//  Created by macbook pro on 2019/9/26.
//  Copyright © 2019 sheep. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?  
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let viewController = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }
    
    

   
}

