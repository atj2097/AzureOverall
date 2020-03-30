//
//  TabBar.swift
//  AzureOverall
//
//  Created by God on 3/29/20.
//  Copyright © 2020 Adam Jackson. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    lazy var browseViewController = UINavigationController(rootViewController: BrowseViewController())
    lazy var cartScreen = UINavigationController(rootViewController: CartScreenViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        browseViewController.tabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        cartScreen.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart.fill"), tag: 1)
        self.viewControllers = [browseViewController,cartScreen]
    }
}
