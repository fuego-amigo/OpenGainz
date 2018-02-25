//
//  Workout.swift
//  OpenGainz
//
//  Created by Marcel van Workum on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation

internal struct Workout {
  internal let id = UUID()
  internal let name: String
  internal var exercises: [Exercise]
}
