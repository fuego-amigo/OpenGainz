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
  func homeViewControllerDidAppear(_ viewController: HomeViewController)
  func homeViewControllerDidSelectAddWorkout(_ viewController: HomeViewController)
}

internal class HomeViewController: UIViewController {
  internal var delegate: HomeViewControllerDelegate?

  private var firstAppearance = true

  internal override func viewDidLoad() {
    /// Setup the Navigation Controller Visuals
    navigationItem.title = NSLocalizedString("Workouts", comment: "")

    let rightNavigationalButton = UIBarButtonItem(
      barButtonSystemItem: .add, target: self, action: #selector(addWorkoutButton))

    navigationItem.rightBarButtonItem = rightNavigationalButton
  }

  internal override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    guard firstAppearance else { return }
    defer { firstAppearance = false }

    delegate?.homeViewControllerDidAppear(self)
  }

  @objc
  private func addWorkoutButton() {
    delegate?.homeViewControllerDidSelectAddWorkout(self)
  }
}
