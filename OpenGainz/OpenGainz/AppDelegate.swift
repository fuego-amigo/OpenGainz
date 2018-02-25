//
//  AppDelegate.swift
//  OpenGainz
//
//  Created by Marcel van Workum on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import UIKit

@UIApplicationMain
internal class AppDelegate: UIResponder, UIApplicationDelegate, FUIAuthDelegate {
  internal var window: UIWindow?
  
  internal var firebaseAuthUI = FUIAuth.defaultAuthUI()

  internal func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    firebaseAuthUI?.delegate = self
    firebaseAuthUI?.providers = [FUIGoogleAuth()]

    let authViewController = firebaseAuthUI?.authViewController()
    return true
  }
  
  func application(
    _ app: UIApplication, open url: URL,
    options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
    let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
    if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
      return true
    }
    return false
  }

  internal func authUI(
    _ authUI: FUIAuth,
    didSignInWith user: User?,
    error: Error?) {
    
  }
}
