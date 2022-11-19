//
//  AppDelegate.swift
//  whatsme
//
//  Created by Mohamed Ali on 19/11/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ConfigureIQKeyboardManger()
        
        return true
    }
    
    func ConfigureIQKeyboardManger() {
        let keyboardManager = IQKeyboardManager.shared
        keyboardManager.enable = true
        keyboardManager.toolbarDoneBarButtonItemText = "Dismiss"
        keyboardManager.toolbarTintColor = UIColor.blue
        //keyboardManager.shouldResignOnTouchOutside = true
        //keyboardManager.shouldPlayInputClicks = false
    }
}

