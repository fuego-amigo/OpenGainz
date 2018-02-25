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
  internal var workoutViewController: WorkoutViewController?

  internal var workouts = [Workout]()

  internal override init() {
    homeViewController = HomeViewController.storyboardInstance()!
    navigationController = UINavigationController(rootViewController: homeViewController)

    super.init()

    homeViewController.delegate = self
    homeViewController.dataSource = self

    /// Testing Data for Workouts
    let testExercise = Exercise(name: "Bench Press", weight: 100, sets: 5, reps: 5)

    let testWorkout1 = Workout(name: "Chest and Triceps", exercises: [testExercise])
    let testWorkout2 = Workout(name: "Back and Biceps", exercises: [testExercise])

    workouts.append(testWorkout1)
    workouts.append(testWorkout2)
  }

  internal var rootViewController: UIViewController {
    return navigationController
  }
}

extension OpenGainzCoordinator: HomeViewControllerDelegate {
  internal func homeViewController(viewController: HomeViewController, DidSelectWorkout: Workout) {
    guard workoutViewController == nil else { fatalError("unexpected workoutViewController") }

    workoutViewController = WorkoutViewController()
    workoutViewController!.delegate = self

    rootViewController.present(workoutViewController!, animated: true)
  }

  internal func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController) {
    let alert = UIAlertController(
      title: NSLocalizedString("Enter a Workout Name", comment: ""),
      message: "",
      preferredStyle: .alert)

    alert.addTextField { textField in
      textField.text = ""
    }

    alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { [weak alert] (_) in
      let textField = alert!.textFields![0]
      DispatchQueue.main.async {
        self.createNewWorkout(workoutName: textField.text)
      }
    }))

    rootViewController.present(alert, animated: true)
  }

  internal func createNewWorkout(workoutName: String?) {
    guard let name = workoutName else { fatalError("expected workoutName") }
    guard name != "" else { return }

    workouts.append(Workout(name: name, exercises: [Exercise]()))

    homeViewController.tableView.reloadData()
  }
}

extension OpenGainzCoordinator: HomeViewControllerDataSource {
  internal func homeViewControllerDidRequestWorkouts(viewController: HomeViewController) -> [Workout] {
    return workouts
  }
}

extension OpenGainzCoordinator: WorkoutViewControllerDelegate {
  
}
