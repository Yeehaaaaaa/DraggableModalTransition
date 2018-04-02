//
//  DragModalTansitioningDelegate.swift
//  DraggableModalTransition
//
//  Created by Arthur Daurel on 01/04/2018.
//  Copyright © 2018 Arthur. All rights reserved.
//

import UIKit

class DragModalTansitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

  // - Si UIPercentDrivenInteractiveTransition est "Set" alors on va pouvoir utiliser notre
  // - animation de facon interactive.
  // - Sinon la transition se fera de facon non interactive.

  weak var dragModalInteractiveTransition: DraggableModalPercentDrivenInteractiveTransition?

  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return DragModalAnimatedTansitioning(transitionType: .presenting)
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return DragModalAnimatedTansitioning(transitionType: .dismissing)
  }

  func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return dragModalInteractiveTransition
  }

  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    return dragModalInteractiveTransition
  }
}
