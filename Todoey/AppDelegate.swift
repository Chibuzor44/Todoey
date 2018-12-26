//
//  AppDelegate.swift
//  Todoey
//
//  Created by Chibuzor Agubulom on 12/22/18.
//  Copyright © 2018 Chibuzor Agubulom. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        
        do {
            _ = try Realm()
        }catch {
            print("Error initializing new realm, \(error)")
        }
        
        return true
    }

}

