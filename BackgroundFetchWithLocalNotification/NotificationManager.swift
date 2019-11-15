//
//  NotificationManager.swift
//  BackgroundFetchWithLocalNotification
//
//  Created by Natalie Ng on 2019/11/15.
//  Copyright © 2019 Natalie. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared: NotificationManager = NotificationManager()
    var notifications: [Notification] = []
    
    private init() {}
    
    func getNotification(completeion: @escaping (Bool?)->Void) {
        URLSession.shared.dataTask(
            with: URL(string: "http://localhost:3000/getNotification")!
        ) { (data, response, error) in
            
            if let error = error {
                completeion(false)
                return
            }
            

            guard let data = data, let results = try? JSONDecoder().decode([Notification].self, from: data) else {
                completeion(false)
                return
            }
            
            NotificationManager.shared.notifications = results
            
            for (index, result) in results.enumerated() {
                print(result)
                
                let content = UNMutableNotificationContent()
                content.title = result.title
                content.subtitle = "\(Date())"
                content.body = result.msg
                content.badge = (index+1) as NSNumber
                content.sound = UNNotificationSound.default
                content.categoryIdentifier = "notification"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
                
                let request = UNNotificationRequest(identifier: result.title, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    guard error == nil else {
                        completeion(false)
                        return
                    }
                    completeion(true)
                })
            }
            
            
            }.resume()

    }
    
}
