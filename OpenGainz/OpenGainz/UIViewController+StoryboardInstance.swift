//
//  File.swift
//  OpenGainz
//
//  Created by Tre Kani on 25/2/18.
//  Copyright © 2018 OpenGainz. All rights reserved.
//

import Foundation
import UIKit

internal extension UIViewController {
  internal class func storyboardInstance() -> Self? {
    return createStoryboardInstance()
  }

  private class func createStoryboardInstance<T>() -> T? {
    let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
    return storyboard.instantiateInitialViewController() as? T
  }
}
