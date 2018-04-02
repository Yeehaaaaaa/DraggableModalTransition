//
//  DraggableModalPercentDrivenInteractiveTransition.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import Foundation
import UIKit

class DraggableModalPercentDrivenInteractiveTransition: UIPercentDrivenInteractiveTransition {

  private var fromViewController: UIViewController!
  var toViewController: UIViewController?
  private var segueIdentifier: String!
  private var dragModalTransitionDelegate: DragModalTansitioningDelegate!

  func setupDragModalAnimation(_ fromViewController: UIViewController, segueIdentifier: String) {

    self.fromViewController = fromViewController
    self.segueIdentifier = segueIdentifier

    self.dragModalTransitionDelegate = DragModalTansitioningDelegate()
    dragModalTransitionDelegate.dragModalInteractiveTransition = self

    let panUp = UIPanGestureRecognizer(target: self, action: #selector(dragUpGesture(_:)))
//        panUp.delegate = DraggableModalGestureRecognizerDelegate(gestureDirection: .up)
    self.fromViewController.view.addGestureRecognizer(panUp)
  }

  func setupSecond(viewController: UIViewController) {

    self.toViewController = viewController
    self.toViewController?.transitioningDelegate = dragModalTransitionDelegate

    let panDown = UIPanGestureRecognizer(target: self, action: #selector(dragDownGesture(_:)))
    //    panDown.delegate = DraggableModalGestureRecognizerDelegate(gestureDirection: .down)
    self.toViewController?.view.addGestureRecognizer(panDown)
  }

  @objc func dragUpGesture(_ gesture: UIPanGestureRecognizer) {
    let translate = gesture.translation(in: gesture.view)
    let percent   = -translate.y / gesture.view!.bounds.size.height

    if gesture.state == .began {

      self.fromViewController.performSegue(withIdentifier: self.segueIdentifier, sender: nil)

    } else if gesture.state == .changed {
      self.update(percent)
    } else if gesture.state == .ended {
      let velocity = gesture.velocity(in: gesture.view)
      self.completionSpeed = 0.999
      if (percent > 0.5 && velocity.y == 0) || velocity.y < 0 {
        self.finish()
      } else {
        self.cancel()
      }
    }
  }

  @objc func dragDownGesture(_ gesture: UIPanGestureRecognizer) {
    let translate = gesture.translation(in: gesture.view)
    let percent   = translate.y / gesture.view!.bounds.size.height

    if gesture.state == .possible {
      if translate != .zero {
        let angle = atan2(translate.y, translate.x)
        print(angle)
      }
    } else if gesture.state == .began {

      self.toViewController?.dismiss(animated: true, completion: nil)

    } else if gesture.state == .changed {
      self.update(percent)
    } else if gesture.state == .ended || gesture.state == .cancelled {
      let velocity = gesture.velocity(in: gesture.view)
      self.completionSpeed = 0.999
      if (percent > 0.5 && velocity.y == 0) || velocity.y > 0 {
        self.finish()
        self.toViewController = nil
      } else {
        self.cancel()
      }
    }
  }
}
