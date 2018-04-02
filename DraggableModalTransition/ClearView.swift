//
//  ClearView.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 02/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import Foundation
import UIKit

class ClearView: UIView {

  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

    for sub in self.subviews {
      if sub is BottomView, sub.frame.contains(point) {
        return true
      } else {
        return false
      }
    }
    return true
  }
}
