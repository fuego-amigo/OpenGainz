//
//  AppDelegate.swift
//  OpenGainz
//
//  Created by Marcel van Workum on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  internal var window: UIWindow?
  private let openGainzCoordinator = OpenGainzCoordinator()

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)

    window?.rootViewController = openGainzCoordinator.rootViewController
    window?.makeKeyAndVisible()

    return true
  }
}

