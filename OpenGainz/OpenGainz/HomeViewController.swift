//
//  HomeViewController.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal protocol HomeViewControllerDataSource: class {
  func homeViewControllerDidRequestWorkouts(viewController: HomeViewController) -> [Workout]
}

internal protocol HomeViewControllerDelegate: class {
  func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController)
  func homeViewController(viewController: HomeViewController, DidSelectWorkout: Workout)
}

internal class HomeViewController: UITableViewController {
  internal var delegate: HomeViewControllerDelegate?
  internal var dataSource: HomeViewControllerDataSource!

  internal override func viewDidLoad() {
    /// Setup the Navigation Controller Visuals
    navigationItem.title = NSLocalizedString("Workouts", comment: "")

    let rightNavigationalButton = UIBarButtonItem(
      barButtonSystemItem: .add, target: self, action: #selector(addWorkoutButton))

    navigationItem.rightBarButtonItem = rightNavigationalButton

    /// Setup UITableView
    /// This must be set here as the Storyboard does not work
    /// This Color must match the UIView in storyboard
    tableView.backgroundColor = UIColor.lightGray
  }

  // MARK: - TableViewVisualData

  internal override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.homeViewControllerDidRequestWorkouts(viewController: self).count
  }

  internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }

  // MARK: - UITableViewControllerDelegate

  internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as! HomeViewCell

    let workout = dataSource.homeViewControllerDidRequestWorkouts(viewController: self)[indexPath.row]

    cell.workoutTitle = workout.name

    return cell
  }

  internal override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let workouts = dataSource.homeViewControllerDidRequestWorkouts(viewController: self)

    delegate?.homeViewController(viewController: self, DidSelectWorkout: workouts[indexPath.row])
  }

  // MARK: - Private

  @objc
  private func addWorkoutButton() {
    delegate?.homeViewControllerDidSelectAddWorkout(viewController: self)
  }
}
