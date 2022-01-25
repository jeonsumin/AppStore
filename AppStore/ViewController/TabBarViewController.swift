//
//  TabBarViewController.swift
//  AppStore
//
//  Created by Terry on 2022/01/25.
//

import UIKit

class TabBarViewController: UITabBarController {

    //MARK: - Properties
    
    //tabBar 에서 필요한 Properties 설정
    private lazy var todayViewController :UIViewController = {
       let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이",
                     image: UIImage(systemName: "mail"),
                     tag: 0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController :UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController()) //네비게이션 컨트롤러 임베디드
        let tabBarItem = UITabBarItem(title: "앱",
                     image: UIImage(systemName: "square.stack.3d.up"),
                     tag: 1)
        viewController.tabBarItem = tabBarItem
         return viewController
     }()
    
//    private let searchViewController = TodayViewController()
    
    
    //MARK: - Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [todayViewController, appViewController]
        
        
        
// tabBarItem 추가 하는 코드
//        searchViewController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 2)
//        viewControllers = [todayViewController, appViewController, searchViewController]
    }
}
