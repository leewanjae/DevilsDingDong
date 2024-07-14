//
//  AppDelegate.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/7/24.
//

import UIKit
import NotificationCenter
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
            return .portrait
        }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        requestNotificationAuthorization()
//        let firebase = FirebaseStoreManager()
//        MatchInfo.match.forEach { match in
//            firebase.addFirestore(collection: "matches", document: "\(match.id)", data: match)
//        }
        
//        let scoreList = ScoreList(scores: Score.scoreDB)
//                let firebaseStoreManager = FirebaseStoreManager()
//                firebaseStoreManager.addFirestore(collection: "24-25_Score", document: "score", data: scoreList)

        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
}

extension AppDelegate {
    private func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error)")
            }
            DispatchQueue.main.async {
                if granted {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
}
