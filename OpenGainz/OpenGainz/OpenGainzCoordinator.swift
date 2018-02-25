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
  }

  internal var rootViewController: UIViewController {
    return navigationController
  }
}

extension OpenGainzCoordinator: HomeViewControllerDelegate {
  internal func homeViewControllerDidSelectAddWorkout(viewController: HomeViewController) {
    print("add workout")
  }
}
