//
//  DraggableModalGestureRecognizerDelegate.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import Foundation
import UIKit

class DraggableModalGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {

  var gestureDirection: GestureDirection

  enum GestureDirection {
    case up
    case down
  }

  init(gestureDirection: GestureDirection) {
    self.gestureDirection = gestureDirection

    super.init()
  }

  func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if let pan = gestureRecognizer as? UIPanGestureRecognizer {
      let translation = pan.translation(in: pan.view)
      let angle = atan2(translation.y, translation.x)
      return abs(self.gestureDirection == .up ? angle + .pi / 2.0 : angle - .pi / 2.0) < (.pi / 8.0)
    }
    return false
  }
}
