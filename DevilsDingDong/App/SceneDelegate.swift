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
<<<<<<< HEAD
        let matchInfoView = MatchInfoView()
        let navigationController = UINavigationController(rootViewController: matchInfoView)
        navigationController.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
=======
        
        let vc1 = UINavigationController(rootViewController: MatchInfoView())
        let vc2 = UINavigationController(rootViewController: TodayMatchView())
        let vc3 = UINavigationController(rootViewController: TotalRecordView())
        
        vc1.tabBarItem = UITabBarItem(title: "경기일정", image: UIImage(systemName: "calendar.circle"), selectedImage: UIImage(systemName: "calendar.circle.fill"))
        vc2.tabBarItem = UITabBarItem(title: "오늘의 경기", image: UIImage(systemName: "figure.basketball") , selectedImage: UIImage(systemName: "figure.australian.football"))
        vc3.tabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "list.bullet.clipboard"), selectedImage: UIImage(systemName: "list.bullet.clipboard.fill"))
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [vc1, vc2, vc3]
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
>>>>>>> 53ff7b74eb07f851df93f38f1861e928ad351b46
        window?.makeKeyAndVisible()
    }
}
