//
//  AppDelegate.swift
//  BackgroundFetchWithLocalNotification
//
//  Created by Natalie Ng on 2019/11/15.
//  Copyright © 2019 Natalie. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge, .carPlay], completionHandler: { (granted, error) in
            if granted {
                print("granted")
            } else {
                print("not granted")
            }
        })
        
        self.window = UIWindow()
        self.window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
 
    func applicationDidEnterBackground(_ application: UIApplication) {
        application.setMinimumBackgroundFetchInterval(0.1)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
  
    func application(_ application: UIApplication,
                     performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("\(Date())")
        NotificationManager.shared.getNotification { (result) in
            guard let result = result else {
                completionHandler(.noData)
                return
            }
            
            guard result else {
                completionHandler(.failed)
                return
            }
            
            completionHandler(.newData)
        }
    }
}




