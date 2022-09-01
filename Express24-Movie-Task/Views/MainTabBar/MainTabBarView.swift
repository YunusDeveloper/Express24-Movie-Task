//
//  MainTabBarView.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 31/08/22.
//

import UIKit
import RxSwift
class MainTabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       tabBar.layer.borderWidth = 0.50
       tabBar.layer.borderColor = UIColor.clear.cgColor
       tabBar.clipsToBounds = true
        UINavigationBar.appearance().barTintColor = UIColor.navigationBarColor
        UINavigationBar.appearance().titleTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        UITabBar.appearance().barTintColor = UIColor.backgroundColor
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundImage = nil
        UITabBar.appearance().layer.backgroundColor = UIColor.white.cgColor
        UITabBar.appearance().shadowImage = nil
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.primaryGrey4], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.primaryGrey], for: .selected)
//        UITabBar.appearance().tintColor = UIColor.primaryGrey
    }
}
