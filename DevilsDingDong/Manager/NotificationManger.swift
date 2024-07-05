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
    
    func setNotification() {
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "DevilsDingDong"
        content.body = "맨체스터유나이티드 VS 크리스탈펠리스"
        content.sound = .default
        content.badge = 1
<<<<<<< HEAD
        content.userInfo = ["MatchID" : MatchInfo.data[0].id]
=======
//        content.userInfo = ["MatchID" : MatchInfo.data[0].id]
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46

        let fireDate = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date().addingTimeInterval((3)))
        let trigger = UNCalendarNotificationTrigger(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier: "MatchInfo", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
        }
    }
}
