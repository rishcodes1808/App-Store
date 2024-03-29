//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Rishabh Raj on 24/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class BaseTabBarController : UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewControllers = [
        createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
        createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
          createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
          
        ]
    }
    
    fileprivate func createNavController(viewController : UIViewController, title : String, imageName : String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
        
    }
}
