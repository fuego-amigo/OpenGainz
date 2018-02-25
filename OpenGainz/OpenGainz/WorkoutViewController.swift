//
//  WorkoutViewController.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal protocol WorkoutViewControllerDelegate: class {
  
}

internal class WorkoutViewController: UITableViewController {
  internal weak var delegate: WorkoutViewControllerDelegate?

  internal override func viewDidLoad() {
    let backButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didSelectBack))

    backButton.title = NSLocalizedString("< Back", comment: "")

    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didSelectAddExercise))

    navigationItem.backBarButtonItem = backButton
    navigationItem.rightBarButtonItem = addButton
  }

  // MARK: - Private

  @objc
  internal func didSelectBack() {
    print("back")
  }

  @objc
  internal func didSelectAddExercise() {
    print("add exercise")
  }
}
