//
//  Notification.swift
//  BackgroundFetchWithLocalNotification
//
//  Created by Natalie Ng on 2019/11/15.
//  Copyright © 2019 Natalie. All rights reserved.
//

import Foundation

struct Notification: Codable {
    let title: String
    let msg: String
    let isNewMsg: Bool
    let _id: String
}
