//
//  OpenGainzCoordinator.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Firebase
import FirebaseAuth
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import Foundation
import UIKit

internal class OpenGainzCoordinator: NSObject {
  private let navigationController: UINavigationController
  private let homeViewController: HomeViewController

  private let firebaseAuthUI = FUIAuth.defaultAuthUI()
  private let fireStore = Firestore.firestore()
  private var user: User!

  internal override init() {
    homeViewController = HomeViewController.storyboardInstance()!
    navigationController = UINavigationController(rootViewController: homeViewController)

    super.init()

    homeViewController.delegate = self
    homeViewController.dataSource = self

    firebaseAuthUI?.delegate = self
    firebaseAuthUI?.providers = [FUIGoogleAuth()]
  }

  internal var rootViewController: UIViewController {
    return navigationController
  }

  private func updateFireStore() {
    fireStore.collection("users").document(user.uid)
      .setData(["name": user.displayName!, "email": user.email!]) { error in
        if let error = error {
          fatalError("Unexpected error \(error.localizedDescription)")
        }
    }
  }
}

extension OpenGainzCoordinator: HomeViewControllerDelegate, HomeViewControllerDataSource {
  internal func homeViewControllerDidAppear(_ viewController: HomeViewController) {
    guard let currentFirebaseUser = Firebase.Auth.auth().currentUser else {
      navigationController.present(firebaseAuthUI!.authViewController(), animated: false, completion: nil)
      return
    }

    guard user == nil else {
      fatalError("Unexpected user")
    }

    user = currentFirebaseUser

    updateFireStore()
  }

  internal func homeViewControllerDidSelectAddWorkout(_ viewController: HomeViewController) {
    print("add workout")
  }

  internal func HomeViewControllerDidRequestWorkouts(viewController: HomeViewController) -> [Workout] {
    let exercise = Exercise(name: "Bench Press", weight: 100, sets: 5, reps: 5)

    let testWorkout1 = Workout(name: "Chest and Triceps", exercises: [exercise])

    let testWorkout2 = Workout(name: "Back and Biceps", exercises: [exercise])

    return [testWorkout1, testWorkout2]
  }
}

extension OpenGainzCoordinator: FUIAuthDelegate {
  internal func authUI(
    _ authUI: FUIAuth,
    didSignInWith user: User?,
    error: Error?) {
    if let error = error {
      fatalError("Unexepcted error: \(error.localizedDescription)")
    }

    guard let user = user else {
      fatalError("Expected user")
    }

    self.user = user

    updateFireStore()
  }
}
