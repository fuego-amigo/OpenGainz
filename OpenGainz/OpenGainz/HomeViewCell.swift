//
//  HomeViewCell.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal class HomeViewCell: UITableViewCell {
  @IBOutlet private weak var workoutTitleLabel: UILabel!

  internal var workoutTitle: String! {
    didSet {
      workoutTitleLabel.text = workoutTitle
    }
  }
}
