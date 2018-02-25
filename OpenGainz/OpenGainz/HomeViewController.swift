//
//  HomeViewController.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal protocol HomeViewControllerDelegate: class {
  func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController)
}

internal class HomeViewController: UIViewController {
  internal var delegate: HomeViewControllerDelegate?

  internal override func viewDidLoad() {
    /// Setup the Navigation Controller Visuals
    navigationItem.title = NSLocalizedString("Workouts", comment: "")

    let rightNavigationalButton = UIBarButtonItem(
      barButtonSystemItem: .add, target: self, action: #selector(addWorkoutButton))

    navigationItem.rightBarButtonItem = rightNavigationalButton
  }

  @objc
  private func addWorkoutButton() {
    delegate?.homeViewControllerDidSelectAddWorkout(viewController: self)
  }
}
