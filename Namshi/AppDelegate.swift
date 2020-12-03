//
//  AppDelegate.swift
//  Namshi
//
//  Created by MacBook on 11/27/20.
//

import UIKit
import IQKeyboardManagerSwift
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initCrashlytics()
        IQKeyboardManager.shared.enable = true
        DIContainerConfigurator.initiate()
        initializeWindow()
        GlobalStyles.create()
        return true
    }
    
    private func initCrashlytics() {
        AppCenter.start(withAppSecret: "f027b4bb-0d45-419e-a618-51dbc9582be9", services: [
          Analytics.self,
          Crashes.self
        ])
    }
    
    private func initializeWindow() {
        let rootViewController =
            UINavigationController(rootViewController: MainTabBarViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
