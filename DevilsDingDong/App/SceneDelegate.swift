//
//  SceneDelegate.swift
//  DevilsDingDong
//
//  Created by LeeWanJae on 5/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc1 = UINavigationController(rootViewController: MatchInfoView())
        let vc2 = UINavigationController(rootViewController: TotalRecordView())
        let vc3 = UINavigationController(rootViewController: TodayMatchView())
        
        vc1.tabBarItem = UITabBarItem(title: "경기일정", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        vc2.tabBarItem = UITabBarItem(title: "오늘의 경기", image: UIImage(systemName: "figure.basketball") , selectedImage: UIImage(systemName: "figure.australian.football"))
        vc3.tabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "list.bullet.clipboard"), selectedImage: UIImage(systemName: "list.bullet.clipboard.fill"))
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, vc3]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
