//
//  GlobalStyles.swift
//  SmartEducation
//
//  Created by MacBook on 11/21/20.
//

import Foundation
import UIKit

class GlobalStyles {
    class func create() {
        setupTransparentNavigationBar()
    }

    private class func setupTransparentNavigationBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UISearchBar.appearance().placeholder = .searchBarPlaceholder
        UISearchBar.appearance().barTintColor = .searchBar_barTintColor
        UISearchBar.appearance().showsScopeBar = true
        
        UITabBar.appearance().barTintColor = .tabBarTintColor
        UITabBar.appearance().tintColor = .tabBarSelectedItemColor
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.segmentControl_selectedItemColor],
            for: .selected)
    }
}
