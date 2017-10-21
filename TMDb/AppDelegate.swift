//
//  AppDelegate.swift
//  TMDb
//
//  Created by Alexandre Freire García on 13/10/17.
//  Copyright © 2017 Alexandre Freire García. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAssembly = AppAssembly()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        appAssembly.window.rootViewController = appAssembly.navigationController
        appAssembly.window.makeKeyAndVisible()
        
        return true
    }

}

