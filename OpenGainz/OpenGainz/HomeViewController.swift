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
  func HomeViewControllerDidRequestWorkouts(viewController: HomeViewController) -> [Workout]
}

internal protocol HomeViewControllerDelegate: class {
  func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController)
}

internal class HomeViewController: UITableViewController {
  internal var delegate: HomeViewControllerDelegate?
  internal var dataSource: HomeViewControllerDataSource?

  private var workouts = [Workout]()

  internal override func viewDidLoad() {
    guard let dataSource = self.dataSource else { fatalError("Expected dataSource") }

    workouts = dataSource.HomeViewControllerDidRequestWorkouts(viewController: self)

    /// Setup the Navigation Controller Visuals
    navigationItem.title = NSLocalizedString("Workouts", comment: "")

    let rightNavigationalButton = UIBarButtonItem(
      barButtonSystemItem: .add, target: self, action: #selector(addWorkoutButton))

    navigationItem.rightBarButtonItem = rightNavigationalButton

    /// Setup UITableView
    /// This must be set here as the Storyboard does not work
    tableView.backgroundColor = UIColor.lightGray
  }

  // MARK: - TableViewVisualData

  internal override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  internal override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return workouts.count
  }

  internal override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }


  // MARK: - UITableViewControllerDelegate

  internal override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)

    let workout = workouts[indexPath.row]
    cell.textLabel?.text = workout.name

    return cell
  }

  // MARK: - Private

  @objc
  private func addWorkoutButton() {
    delegate?.homeViewControllerDidSelectAddWorkout(viewController: self)
  }
}
