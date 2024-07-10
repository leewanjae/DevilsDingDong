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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy년 MM월 dd일 (E) HH:mm"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        guard let matchDate = dateFormatter.date(from: "\(date) \(time)") else {
            print("Invalid date format")
            return
        }
        
        guard let notificationDate = Calendar.current.date(byAdding: .hour, value: -5, to: matchDate) else {
            print("Error calculating notification date")
            return
        }
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "matchNoti", content: content, trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("Error = \(error.localizedDescription)")
            }
        }
    }
}
