//
//  MainTabBarViewController.swift
//  Namshi
//
//  Created by MacBook on 11/30/20.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private lazy var tabsConfig: [(vc: UIViewController, title: String)] = [
        (vc: Router.resolveVC(HomeViewController.self), title: .tabBatTitle_Home),
        (vc: Router.resolveVC(CatalogViewController.self), title: .tabBatTitle_Catalog),
        (vc: UIViewController(), title: .tabBatTitle_Wishlist),
        (vc: UIViewController(), title: .tabBatTitle_Cart),
        (vc: UIViewController(), title: .tabBatTitle_Profile),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .tabBarBackgroundColor
        
        setupTabs()
    }
    
    func setupTabs() {
        viewControllers = tabsConfig.map { setupTabBarItem($0) }
    }
    
    private func setupTabBarItem(_ tabBarItemConfig: (vc: UIViewController,
                                                      title: String)) -> UIViewController {
        tabBarItemConfig.vc.tabBarItem.image =
            UIImage(named: tabBarItemConfig.title.lowercased())
        tabBarItemConfig.vc.tabBarItem.title = tabBarItemConfig.title
        return tabBarItemConfig.vc
    }
}
