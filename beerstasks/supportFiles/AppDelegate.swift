//
//  AppDelegate.swift
//  beerstasks
//
//  Created by José Alves da Cunha on 24/04/20.
//  Copyright © 2020 José Alves da Cunha. All rights reserved.
//

import UIKit
import SupportSDK
import ZendeskCoreSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Zendesk.initialize(appId: "ebb3070094ba6cfda0cb8bafb46ada1d630569c3cd752f18",
            clientId: "mobile_sdk_client_cdc39173698c8bd21437",
            zendeskUrl: "https://beers.zendesk.com")
        Support.initialize(withZendesk: Zendesk.instance)
        
        let identity = Identity.createAnonymous()
        Zendesk.instance?.setIdentity(identity)

        Support.initialize(withZendesk: Zendesk.instance)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

