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
        let vc2 = UINavigationController(rootViewController: TodayMatchView())
        let vc3 = UINavigationController(rootViewController: TotalRecordViewController())
        
        vc1.tabBarItem = UITabBarItem(title: "경기일정", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        vc2.tabBarItem = UITabBarItem(title: "오늘의 경기", image: UIImage(systemName: "figure.basketball") , selectedImage: UIImage(systemName: "figure.australian.football"))
        vc3.tabBarItem = UITabBarItem(title: "리그 순위", image: UIImage(systemName: "trophy"), selectedImage: UIImage(systemName: "trophy.fill"))
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, vc3]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
