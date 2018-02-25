//
//  OpenGainzCoordinator.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal class OpenGainzCoordinator: NSObject {
  internal let navigationController: UINavigationController
  internal let homeViewController: HomeViewController

  internal override init() {
    homeViewController = HomeViewController.storyboardInstance()!
    navigationController = UINavigationController(rootViewController: homeViewController)

    super.init()

    homeViewController.delegate = self
    homeViewController.dataSource = self
  }

  internal var rootViewController: UIViewController {
    return navigationController
  }
}

extension OpenGainzCoordinator: HomeViewControllerDelegate, HomeViewControllerDataSource {
  internal func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController) {
    print("add workout")
  }

  internal func HomeViewControllerDidRequestWorkouts(viewController: HomeViewController) -> [Workout] {
    let exercise = Exercise(name: "Bench Press", weight: 100, sets: 5, reps: 5)

    let testWorkout1 = Workout(name: "Chest and Triceps", exercises: [exercise])

    let testWorkout2 = Workout(name: "Back and Biceps", exercises: [exercise])

    return [testWorkout1, testWorkout2]
  }
}
