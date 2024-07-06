//
//  NotificationManger.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/29/24.
//

import UIKit
import UserNotifications

class NotificationManger {
    static let shared = NotificationManger()
    
    func setNotification(enemy: String, date:String, time: String) {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "딩동! 경기가 도착했어요"
        content.subtitle = "맨유 vs \(enemy)"
        content.body = "\(date) \(time)시"
        content.sound = .default

        var dateCompoents = DateComponents()
        dateCompoents.hour = 00
        dateCompoents.minute = 00
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompoents, repeats: true)
        let request = UNNotificationRequest(identifier: "matchNoti", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
        }
    }
}
