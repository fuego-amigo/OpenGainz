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
class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate {
  internal var window: UIWindow?
  private let openGainzCoordinator = OpenGainzCoordinator()

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    FirebaseApp.configure()

    let firebaseAuthUI = FUIAuth.defaultAuthUI()
    firebaseAuthUI?.delegate = self

    window = UIWindow(frame: UIScreen.main.bounds)

    window?.rootViewController = openGainzCoordinator.rootViewController
    window?.makeKeyAndVisible()

    return true
  }

  internal func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {

  }
}
