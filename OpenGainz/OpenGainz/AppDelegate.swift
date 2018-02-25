//
//  AppDelegate.swift
//  OpenGainz
//
//  Created by Marcel van Workum on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Firebase
import FirebaseAuthUI
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  internal var window: UIWindow?

  private var openGainzCoordinator: OpenGainzCoordinator!

  internal func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    FirebaseApp.configure()

    openGainzCoordinator = OpenGainzCoordinator()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = openGainzCoordinator.rootViewController
    window?.makeKeyAndVisible()

    return true
  }
  
  internal func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {

    let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
    if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
      return true
    }
    return false
  }
}
