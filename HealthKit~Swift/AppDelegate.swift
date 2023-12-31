//
//  AppDelegate.swift
//  HealthKit~Swift
//
//  Created by Jay D 2014/9/17.
//  Copyright (c) 2014年 Bit degree. All rights reserved.
//

import UIKit
import HealthKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    
    var tabBarController: UITabBarController?
    
    var window: UIWindow?
    
    let healthStore: HKHealthStore = HKHealthStore()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        // Override point for customization after application launch.
        
        let profile: ProfileViewController = ProfileViewController(style: .plain)
        profile.healthStore = self.healthStore
        
        let profileNavigtion: UINavigationController = UINavigationController(rootViewController: profile);
        profileNavigtion.tabBarItem.image = UIImage(named: "profile")
        profileNavigtion.title = "Profile"
        
        let journal: JournalViewController = JournalViewController(style: .plain)
        journal.healthStore = self.healthStore
        
        let journalNavigtion: UINavigationController = UINavigationController(rootViewController: journal);
        journalNavigtion.tabBarItem.image = UIImage(named: "journal")
        journalNavigtion.title = "Journal"
        
        let energy: EnergyViewController = EnergyViewController(style: .grouped)
        energy.healthStore = self.healthStore
        
        let energyNavigtion: UINavigationController = UINavigationController(rootViewController: energy);
        energyNavigtion.tabBarItem.image = UIImage(named: "energyburn")
        energyNavigtion.title = "Energy"
        
        self.tabBarController = UITabBarController()
        self.tabBarController!.viewControllers = [profileNavigtion, journalNavigtion, energyNavigtion]
        
        let screen: CGRect = UIScreen.main.bounds
        
        self.window = UIWindow(frame: screen)
        self.window!.backgroundColor = UIColor.black
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

